package com.inmar.rest.controller;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.inmar.model.Contact;
import com.inmar.service.ContactService;

@RestController
@RequestMapping("/api/v1")
public class ContactRestController {
	private static final Logger logger = LoggerFactory.getLogger(ContactRestController.class);
	@Autowired
	ContactService contactService;
	
	@RequestMapping(value = "/contact", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<List<Contact>> listAllContacts() throws JsonProcessingException {
		List<Contact> contacts = contactService.getContacts();

		if (contacts.isEmpty()) {
			return new ResponseEntity<List<Contact>>(HttpStatus.NO_CONTENT);
		}

		return new ResponseEntity<List<Contact>>(contacts, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/contact", method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<Contact> createContact(@RequestBody Contact contact) throws JsonProcessingException {
		HttpHeaders headers = new HttpHeaders();
		if (contact == null) {
			return new ResponseEntity<Contact>(HttpStatus.BAD_REQUEST);
		}
		int newSku = contactService.createContact(contact);

		if (newSku > 0) {
			contact.setId(newSku);
			headers.add("Contact Created  - ", String.valueOf(contact.getId()));
			logger.debug("Contact Created successfully");
			return new ResponseEntity<Contact>(contact, headers, HttpStatus.CREATED);
		} else {
			logger.debug("Unable to Create Contact");
			headers.add("Unable to create Contact - ", String.valueOf(contact.getId()));
			return new ResponseEntity<Contact>(contact, headers, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/contact/{id}", method = RequestMethod.PUT, produces = "application/json")
	public ResponseEntity<Contact> updateContact(@PathVariable("id") int id, @RequestBody Contact contact) {
		HttpHeaders headers = new HttpHeaders();
		if (contact == null) {
			return new ResponseEntity<Contact>(HttpStatus.BAD_REQUEST);
		}
		else {
			Contact isExist = contactService.getContact(id);
			 if (isExist == null) {
				 return new ResponseEntity<Contact>(HttpStatus.NOT_FOUND);
			 }
		}  
		
		int count = contactService.updateContact(contact);
		if (count == 1) {
			logger.debug("Contact updted successfully");
			headers.add("Contact Updated  - ", String.valueOf(id));
			return new ResponseEntity<Contact>(contact, headers, HttpStatus.OK);
		} else {
			logger.debug("Unable to update Contact");
			headers.add("Contact Updated  - ", String.valueOf(id));
			return new ResponseEntity<Contact>(contact, headers, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/contact/{id}", method = RequestMethod.DELETE, produces = "application/json")
	public ResponseEntity<Contact> deleteContact(@PathVariable("id") int id) {
		int count = contactService.deleteContact(id);
		if (count == 1) {
			return new ResponseEntity<Contact>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<Contact>(HttpStatus.NOT_FOUND);
		}
	}
}
