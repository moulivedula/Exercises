package com.inmar.dao;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.inmar.model.Contact;

public class ContactRowMapper implements RowMapper<Contact> {
	public Contact mapRow(ResultSet rs, int rowNum) throws SQLException {
		Contact contact = new Contact();
		contact.setId(rs.getInt("id"));
		contact.setType(rs.getString("type"));
		contact.setName(rs.getString("name"));
		contact.setTitle(rs.getString("title"));
		contact.setPhone(rs.getString("phone"));
		contact.setExt(rs.getString("ext"));
		contact.setFax(rs.getString("fax"));
		contact.setEmail(rs.getString("email"));
	      
	    return contact;
	}
}
