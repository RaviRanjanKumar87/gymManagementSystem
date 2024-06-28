package com.infosys.gymManagementSystem.dao;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.infosys.gymManagementSystem.bean.GymItem;
@Repository
@Service
public class GymItemDaoImpl implements GymItemDao {

	
	@Autowired
	private GymItemsRepository repository;
	@Override
	public void saveNewItem(GymItem gymItem) {
		// TODO Auto-generated method stub
		repository.save(gymItem);
	}
	@Override
	public List<GymItem> displayAllItems() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}
	@Override
	public GymItem findItemsById(Long id) {
		// TODO Auto-generated method stub
		 return repository.findById(id).get();
	}
	@Override
	public Long generateItemId() {
		// TODO Auto-generated method stub
		Long val=repository.findLastItemId();
		if(val==null)
			val=101L;
		else
			val=val+1;
		
		return val;
	}
	
	

}