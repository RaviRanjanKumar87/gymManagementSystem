package com.infosys.gymManagementSystem.bean;

import java.util.Objects;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Lob;

@Entity
public class Feedback {
	@Id
	private Long feedbackId;
	private String userId;
	private String fullName;
	@Lob
	private String content;

	public Feedback() {
		super();
		// TODO Auto-generated constructor stub
	}
	
	public Feedback(Long feedbackId, String userId, String fullName, String content) {
		super();
		this.feedbackId = feedbackId;
		this.userId = userId;
		this.fullName = fullName;
		this.content = content;
	}

	public Long getFeedbackId() {
		return feedbackId;
	}

	public void setFeedbackId(Long feedbackId) {
		this.feedbackId = feedbackId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getFullName() {
		return fullName;
	}

	public void setFullName(String fullName) {
		this.fullName = fullName;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

}
