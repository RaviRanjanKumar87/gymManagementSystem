package com.infosys.gymManagementSystem.dao;
import java.util.Set;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.infosys.gymManagementSystem.bean.SlotItem;
import com.infosys.gymManagementSystem.bean.SlotItemEmbed;

public interface SlotItemRepository extends JpaRepository<SlotItem, SlotItemEmbed>{
	@Query("SELECT seatBooked from SlotItem a where embeddedId=?1")
	public Integer findSeatBookedById(SlotItemEmbed id);
	
	@Query("SELECT embeddedId from SlotItem")
	public Set<SlotItemEmbed> findAllEmbeds();
}