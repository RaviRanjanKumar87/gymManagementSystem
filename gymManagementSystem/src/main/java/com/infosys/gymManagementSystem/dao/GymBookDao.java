package com.infosys.gymManagementSystem.dao;
import java.util.List;
import com.infosys.gymManagementSystem.bean.GymBook;
public interface GymBookDao {
	public void save(GymBook gymBook);
	public Long generateBookingId();
	public List<GymBook> getBookList();
	public GymBook findBookInfoById(Long id);
	public void deleteById(Long id);
	public List<GymBook> findBookingsByUsername(String username);

}
