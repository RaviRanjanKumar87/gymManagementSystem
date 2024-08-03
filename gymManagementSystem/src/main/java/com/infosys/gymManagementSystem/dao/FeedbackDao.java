package com.infosys.gymManagementSystem.dao;
import java.util.List;

import com.infosys.gymManagementSystem.bean.Feedback;

public interface FeedbackDao {

	void saveFeedback(Feedback feedback);
	
	void deleteFeedBackById(Long feedbackId);
	
	List<Feedback> getFeedbackList();
	
}