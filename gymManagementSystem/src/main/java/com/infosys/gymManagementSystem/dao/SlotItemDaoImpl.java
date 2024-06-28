package com.infosys.gymManagementSystem.dao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;


import com.infosys.gymManagementSystem.bean.SlotItem;
@Repository
@Service

public class SlotItemDaoImpl implements SlotItemDao{
	@Autowired
	private SlotItemRepository repository;

	@Override
	public void saveNewSlot(SlotItem slotItem) {
		// TODO Auto-generated method stub
		repository.save(slotItem);
	}
	

}
