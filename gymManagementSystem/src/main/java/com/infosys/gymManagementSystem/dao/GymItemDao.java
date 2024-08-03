package com.infosys.gymManagementSystem.dao;



import java.util.List;
import com.infosys.gymManagementSystem.bean.GymItem;

public interface GymItemDao {
	public void save(GymItem gymItem);
	public List<GymItem> displayAllItems();
	public GymItem findItemById(Long id);
	public Long generateItemId();
	public Integer findTotalSeatById(Long id);
	
}

