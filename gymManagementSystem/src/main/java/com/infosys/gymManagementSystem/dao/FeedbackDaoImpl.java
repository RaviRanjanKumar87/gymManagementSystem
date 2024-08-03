package com.infosys.gymManagementSystem.dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.infosys.gymManagementSystem.bean.Feedback;

@Service
public class FeedbackDaoImpl implements FeedbackDao {

	@Autowired
	private FeedbackRepository repository;

	@Override
	public void saveFeedback(Feedback feedback) {
		if(feedback.getFeedbackId() == null) {
			feedback.setFeedbackId(generateFeedbackId());
		}
		repository.save(feedback);
	}

	@Override
	public void deleteFeedBackById(Long feedbackId) {
		repository.deleteById(feedbackId);
	}
	
	private Long generateFeedbackId() {
		Long newId = repository.findLastFeedbackId();
		
		if(newId == null) {
			newId = 10001L;
		} else {
			newId += 1L;
		}
		
		return newId;
	}

	@Override
	public List<Feedback> getFeedbackList() {
		return repository.findAll();
	}
	
	
}