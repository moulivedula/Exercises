package com.inmar.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.inmar.model.Item;

public class ItemRowMapper implements RowMapper<Item> {
	public Item mapRow(ResultSet rs, int rowNum) throws SQLException {
		Item item = new Item();
		item.setSku(rs.getInt("sku"));
		item.setName(rs.getString("name"));
		item.setLocation(rs.getString("location"));
		item.setDepartment(rs.getString("department"));
		item.setCategory(rs.getString("category"));
		item.setSubCategory(rs.getString("subcategory"));
	      
	    return item;
	}
}
