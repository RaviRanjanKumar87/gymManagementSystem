package com.infosys.gymManagementSystem.dao;

import com.infosys.gymManagementSystem.bean.GymItem;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
 
public interface GymItemsRepository extends JpaRepository< GymItem,Long>{
		@Query("select max(itemId) from GymItem")
		public Long findLastItemId();
}