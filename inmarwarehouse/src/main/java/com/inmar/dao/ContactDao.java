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

import com.inmar.model.Contact;

@Repository("contactDao")
public class ContactDao {


	private DataSource dataSource;
	private JdbcTemplate jdbcTemplateObject;

	@Autowired
	public void setDataSource(DataSource dataSource) {
		this.dataSource = dataSource;
		this.jdbcTemplateObject = new JdbcTemplate(dataSource);
	}

	public List<Contact> getContacts() {
		String sql = "select * from contacts";
		List<Contact> contacts = jdbcTemplateObject.query(sql, new ContactRowMapper());
		return contacts;
	}

	public Contact getContact(int id) {
		Contact contact=null;
		String sql = "select * from contacts where id=?";
		contact = jdbcTemplateObject.queryForObject(sql, new Object[] {id}, new ContactRowMapper());
		
		return contact;
	}

	public int createContact(Contact contact) {
		String sql = "insert into contacts (type, name, title, phone, ext, fax, email) values (?, ?, ?, ?, ?, ?, ?)";
		
		KeyHolder holder = new GeneratedKeyHolder();
		jdbcTemplateObject.update(new PreparedStatementCreator() {
			@Override
			public PreparedStatement createPreparedStatement(Connection connection) throws SQLException {
				PreparedStatement ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
				ps.setString(1, contact.getType());
				ps.setString(2, contact.getName());
				ps.setString(3, contact.getTitle());
				ps.setString(4, contact.getPhone());
				ps.setString(5, contact.getExt());
				ps.setString(6, contact.getFax());
				ps.setString(7, contact.getEmail());
				return ps;
			}
		}, holder);

		int newId = holder.getKey().intValue();
		contact.setId(newId);
		
		return newId;
	}

	public int updateContact(Contact contact) {
		int count = jdbcTemplateObject.update("UPDATE contacts set type=?, name = ?, title = ?, phone = ?, ext=?, fax=?, email=? where id = ?", 
				new Object[] {contact.getType(), contact.getName(), contact.getTitle(), contact.getPhone(), contact.getExt(), contact.getFax(), contact.getEmail(), contact.getId() });
		return count;
	}

	public int deleteContact(int id) {
		String sql = "delete from contacts where id=?";
		return jdbcTemplateObject.update(sql, id);
	}
}
