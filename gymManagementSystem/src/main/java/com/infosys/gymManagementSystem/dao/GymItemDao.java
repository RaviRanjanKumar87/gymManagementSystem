package com.infosys.gymManagementSystem.dao;



import java.util.List;

import com.infosys.gymManagementSystem.bean.GymItem;

public interface GymItemDao {
	public void saveNewItem(GymItem gymItem);
	public List<GymItem> displayAllItems();
	public GymItem findItemsById(Long id);
	public Long generateItemId();
}
