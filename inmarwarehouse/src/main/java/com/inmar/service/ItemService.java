package com.inmar.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.inmar.dao.ItemsDao;
import com.inmar.model.Item;

@Service("itemService")
public class ItemService {
	@Autowired
    ItemsDao itemsDao;
	
	public List<Item> getItems(){
		List<Item> itemsList = itemsDao.getItems();
		return itemsList;
	}
	
	public List<Item> getItemsByLocation(String location){
		List<Item> itemsList = itemsDao.getItemsByLocation(location);
		return itemsList;
	}

	public List<Item> getItemsByDepartment(String location, String department) {
		List<Item> itemsList = itemsDao.getItemsByDepartment(location, department);
		return itemsList;
	}

	public List<Item> getItemsByCategory(String location, String department, String category) {
		List<Item> itemsList = itemsDao.getItemsByCategory(location, department, category);
		return itemsList;
	}

	public List<Item> getItemsBySubCategory(String location, String department, String category,
			String subcategory) {
		List<Item> itemsList = itemsDao.getItemsBySubCategory(location, department, category, subcategory);
		return itemsList;
	}

	public int createItem(Item item) {
		return itemsDao.createItem(item);
	}

	public Item getItem(int sku) {
		return itemsDao.getItem(sku);
	}

	public int updateItem(Item item) {
		return itemsDao.updateItem(item);
	}

	public int deleteItem(int sku) {
		return itemsDao.deleteItem(sku);
	}
}
