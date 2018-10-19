package com.inmar.rest.controller;

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
import java.util.List;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.inmar.model.Item;
import com.inmar.service.ItemService;

@RestController
@RequestMapping("/api/v1")
public class ItemRestController {
	private static final Logger logger = LoggerFactory.getLogger(ItemRestController.class);
	@Autowired
	ItemService itemService;
	
	@RequestMapping("/hello")
	public String sayHello(){
		return "Hello Mouli";
	}
	
	@RequestMapping(value = "/item1")
	public String listAllUsers1() throws JsonProcessingException {

		return "Hello Chandra Mouli";
	}
	
	@RequestMapping(value = "/location", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<List<Item>> listAllItems() throws JsonProcessingException {
		List<Item> items = itemService.getItems();

		if (items.isEmpty()) {
			return new ResponseEntity<List<Item>>(HttpStatus.NO_CONTENT);
		}

		return new ResponseEntity<List<Item>>(items, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/location/{location_id}/department", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<List<Item>> listItemsByLocation(@PathVariable String location_id) throws JsonProcessingException {
		logger.debug("Location :"+location_id);
		List<Item> items = itemService.getItemsByLocation(location_id);
		logger.debug("Item Count :"+items.size());
		if (items.isEmpty()) {
			return new ResponseEntity<List<Item>>(HttpStatus.NO_CONTENT);
		}

		return new ResponseEntity<List<Item>>(items, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/location/{location_id}/department/{department_id}/category", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<List<Item>> listItemsByDepartment(@PathVariable String location_id, @PathVariable String department_id) throws JsonProcessingException {
		logger.debug("Location :"+location_id);
		List<Item> items = itemService.getItemsByDepartment(location_id, department_id);
		logger.debug("Item Count :"+items.size());
		if (items.isEmpty()) {
			return new ResponseEntity<List<Item>>(HttpStatus.NO_CONTENT);
		}

		return new ResponseEntity<List<Item>>(items, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/location/{location_id}/department/{department_id}/category/{category_id}/subcategory", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<List<Item>> listItemsByCategory(@PathVariable String location_id, @PathVariable String department_id, @PathVariable String category_id) throws JsonProcessingException {
		logger.debug("Location :"+location_id);
		List<Item> items = itemService.getItemsByCategory(location_id, department_id, category_id);
		logger.debug("Item Count :"+items.size());
		if (items.isEmpty()) {
			return new ResponseEntity<List<Item>>(HttpStatus.NO_CONTENT);
		}

		return new ResponseEntity<List<Item>>(items, HttpStatus.OK);
	}
	
	@RequestMapping(value = "/location/{location_id}/department/{department_id}/category/{category_id}/subcategory/{subcategory_id}", method = RequestMethod.GET, produces = "application/json")
	public ResponseEntity<List<Item>> listItemsBySubCategory(@PathVariable String location_id, @PathVariable String department_id, @PathVariable String category_id, @PathVariable String subcategory_id) throws JsonProcessingException {
		logger.debug("Location :"+location_id);
		List<Item> items = itemService.getItemsBySubCategory(location_id, department_id, category_id, subcategory_id);
		logger.debug("Item Count :"+items.size());
		if (items.isEmpty()) {
			return new ResponseEntity<List<Item>>(HttpStatus.NO_CONTENT);
		}

		return new ResponseEntity<List<Item>>(items, HttpStatus.OK);
	}
	


	@RequestMapping(value = "/item", method = RequestMethod.POST, produces = "application/json")
	public ResponseEntity<Item> createItem(@RequestBody Item item) throws JsonProcessingException {
		HttpHeaders headers = new HttpHeaders();
		if (item == null) {
			return new ResponseEntity<Item>(HttpStatus.BAD_REQUEST);
		}
		int newSku = itemService.createItem(item);

		if (newSku > 0) {
			item.setSku(newSku);
			headers.add("Item Created  - ", String.valueOf(item.getSku()));
			return new ResponseEntity<Item>(item, headers, HttpStatus.CREATED);
		} else {
			headers.add("Unable to create Item - ", String.valueOf(item.getSku()));
			return new ResponseEntity<Item>(item, headers, HttpStatus.INTERNAL_SERVER_ERROR);
		}
	}

	@RequestMapping(value = "/item/{sku}", method = RequestMethod.PUT, produces = "application/json")
	public ResponseEntity<Item> updateItem(@PathVariable("sku") int sku, @RequestBody Item item) {
		HttpHeaders headers = new HttpHeaders();
		if (item == null) {
			return new ResponseEntity<Item>(HttpStatus.BAD_REQUEST);
		}
		else {
			Item isExist = itemService.getItem(sku);
			 if (isExist == null) {
			return new ResponseEntity<Item>(HttpStatus.NOT_FOUND);
			 }
		}  
		
		int count = itemService.updateItem(item);
		if (count == 1) {
			headers.add("Item Updated  - ", String.valueOf(sku));
			return new ResponseEntity<Item>(item, headers, HttpStatus.OK);
		} else {
			headers.add("Item Updated  - ", String.valueOf(sku));
			return new ResponseEntity<Item>(item, headers, HttpStatus.NOT_FOUND);
		}
	}

	@RequestMapping(value = "/item/{sku}", method = RequestMethod.DELETE, produces = "application/json")
	public ResponseEntity<Item> deleteItem(@PathVariable("sku") int sku) {
		int count = itemService.deleteItem(sku);
		if (count == 1) {
			return new ResponseEntity<Item>(HttpStatus.NO_CONTENT);
		} else {
			return new ResponseEntity<Item>(HttpStatus.NOT_FOUND);
		}
	}
}
