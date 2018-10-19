package com.inmar.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.inmar.model.Contact;

@Controller

public class ContactController {
	private static final Logger logger = LoggerFactory.getLogger(ContactController.class);
	
	@RequestMapping("contact")
	public String getContactManagementForm(){
		logger.debug("In ContactController getRegistrationForm");
		return "ContactManagement";
	}
	
	@RequestMapping("contact1")
	public String getContactManagementCForm(){
		logger.debug("In ContactController getRegistrationForm");
		return "ContactManagementCreate";
	}
}
