package com.inmar.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.PreparedStatementCreator;
import org.springframework.jdbc.core.RowMapper;
import org.springframework.jdbc.datasource.DataSourceUtils;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.inmar.model.Item;

@Repository("itemsDao")
public class ItemsDao {


	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	public List<Item> getItems() {
		String sql = "select * from items";
		List<Item> items = jdbcTemplateObject.query(sql, new ItemRowMapper());
		return items;
	}

	public List<Item> getItemsByLocation(String location) {
		String sql = "select * from items where location=?";
		List<Item> items = jdbcTemplateObject.query(sql, new Object[] {location}, new ItemRowMapper());
		return items;
	}

	public List<Item> getItemsByDepartment(String location, String department) {
		String sql = "select * from items where location=? and department=?";
		List<Item> items = jdbcTemplateObject.query(sql, new Object[] {location, department}, new ItemRowMapper());
		return items;
	}

	public List<Item> getItemsByCategory(String location, String department, String category) {
		String sql = "select * from items where location=? and department=? and category=?";
		List<Item> items = jdbcTemplateObject.query(sql, new Object[] {location, department, category}, new ItemRowMapper());
		return items;
	}

	public List<Item> getItemsBySubCategory(String location, String department, String category, String subcategory) {
		String sql = "select * from items where location=? and department=? and category=? and subcategory=?";
		List<Item> items = jdbcTemplateObject.query(sql, new Object[] {location, department, category, subcategory}, new ItemRowMapper());
		return items;
	}

	public Item getItem(int sku) {
		Item item=null;
		String sql = "select * from items where sku=?";
		item = jdbcTemplateObject.queryForObject(sql, new Object[] {sku}, new ItemRowMapper());
		
		return item;
	}

	public int createItem(Item item) {
		String sql = "insert into items (name, location, department, category, subcategory) values (?, ?, ?, ?, ?)";
		
		KeyHolder holder = new GeneratedKeyHolder();
		jdbcTemplateObject.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, item.getName());
				ps.setString(2, item.getLocation());
				ps.setString(3, item.getDepartment());
				ps.setString(4, item.getCategory());
				ps.setString(5, item.getSubCategory());
				return ps;
			}
		}, holder);

		int newSku = holder.getKey().intValue();
		item.setSku(newSku);
		
		return newSku;
	}

	public int updateItem(Item item) {
		int count = jdbcTemplateObject.update("UPDATE items set name=?, location = ?, department = ?, category = ?, subcategory=? where sku = ?", 
				new Object[] {item.getName(), item.getLocation(), item.getDepartment(), item.getCategory(), item.getSubCategory(), item.getSku() });
		return count;
	}

	public int deleteItem(int sku) {
		String sql = "delete from items where sku=?";
		return jdbcTemplateObject.update(sql, sku);
	}
}
