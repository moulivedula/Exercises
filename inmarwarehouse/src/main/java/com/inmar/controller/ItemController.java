package com.inmar.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.inmar.model.Item;

@Controller

public class ItemController {
	private static final Logger logger = LoggerFactory.getLogger(ItemController.class);
	
	@RequestMapping("/")
	public String getIndexPage() {
		logger.debug("In ItemController getHomepage");
		return "index";
	}
	
	@RequestMapping("graph")
	public String getTreeGraph() {
		logger.debug("In getGraph Page");
		return "graph";
	}
	
	@RequestMapping("item")
	public String getRegistrationForm(@ModelAttribute("item") Item item, BindingResult result){
		logger.debug("In getRegistrationForm");
		return "ItemManagement";
	}
	
	@RequestMapping("saveItem")
	public ModelAndView saveItemData(@ModelAttribute("item") Item item, BindingResult result){
		logger.debug("In saveItemData");
		return new ModelAndView("redirect:/itemList");
	}
	
	@RequestMapping("itemList")
	public ModelAndView saveItemData(){
		logger.debug("In getRegistrationForm");
		return new ModelAndView("redirect:/itemList");
	}
	

}
