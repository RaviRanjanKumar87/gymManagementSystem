package com.infosys.gymManagementSystem.dao;

import java.util.List;


import com.infosys.gymManagementSystem.bean.Slot;

public interface SlotDao {
	public void saveNewSlot(Slot slotItem);
	public List<Slot> displayAllSlot();
	public Slot findSlotById(Long id);
	public Long generateSlotId();
}