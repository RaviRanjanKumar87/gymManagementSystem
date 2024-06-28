package com.infosys.gymManagementSystem.dao;
import org.springframework.data.jpa.repository.JpaRepository;

import com.infosys.gymManagementSystem.bean.SlotItem;
import com.infosys.gymManagementSystem.bean.SlotItemEmbed;

public interface SlotItemRepository extends JpaRepository<SlotItem, SlotItemEmbed>{
	
}