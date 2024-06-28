package com.infosys.gymManagementSystem.dao;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.infosys.gymManagementSystem.bean.Slot;

public interface SlotRepository extends JpaRepository<Slot,Long> {
		
	@Query("select max(slotId) from Slot")
	public Long findLastSlotId();
		
	
}