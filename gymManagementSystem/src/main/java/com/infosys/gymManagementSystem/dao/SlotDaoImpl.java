package com.infosys.gymManagementSystem.dao;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.infosys.gymManagementSystem.bean.Slot;
@Repository
@Service
public class SlotDaoImpl implements SlotDao {


	@Autowired
	private SlotRepository repository;
	@Override
	public void saveNewSlot(Slot slotItem) {
		// TODO Auto-generated method stub
		repository.save(slotItem);
	}
	@Override
	public List<Slot> displayAllSlot() {
		// TODO Auto-generated method stub
		return repository.findAll();
	}
	@Override
	public Slot findSlotById(Long id) {
		// TODO Auto-generated method stub
		return repository.findById(id).get();
	}
	@Override
	public Long generateSlotId() {
		// TODO Auto-generated method stub
		Long val=repository.findLastSlotId();
		if(val==null)
			val=1L;
		else
			val=val+1;
		
		return val;
		
	}	
}