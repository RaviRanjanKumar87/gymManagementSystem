package com.infosys.gymManagementSystem.dao;

import java.util.List;


import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.infosys.gymManagementSystem.bean.GymBook;


public interface GymBookRepository extends JpaRepository<GymBook, Long> {

	@Query("SELECT max(bookingId) from GymBook")
	public Long findLastBookingId();
	
	List<GymBook> findByUsername(String username);
}
