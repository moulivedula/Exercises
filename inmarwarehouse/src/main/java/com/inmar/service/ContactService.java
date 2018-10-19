package com.inmar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inmar.dao.ContactDao;
import com.inmar.model.Contact;

@Service("contactService")
public class ContactService {
	@Autowired
	ContactDao contactDao;
	
	public List<Contact> getContacts(){
		List<Contact> contactList = contactDao.getContacts();
		return contactList;
	}

	public int createContact(Contact contact) {
		return contactDao.createContact(contact);
	}

	public Contact getContact(int id) {
		return contactDao.getContact(id);
	}

	public int updateContact(Contact contact) {
		return contactDao.updateContact(contact);
	}

	public int deleteContact(int id) {
		return contactDao.deleteContact(id);
	}
}
