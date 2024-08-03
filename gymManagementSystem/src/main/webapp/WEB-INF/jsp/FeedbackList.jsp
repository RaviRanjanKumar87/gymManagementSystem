<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Customer Feedbacks</title>
<link rel="stylesheet" href="/CSS/feedbackStyle.css">
</head>
<body>
	<div class="container">
		

		<c:if test="${empty feedbacks}">
			<div class="content">
				<span>No Data Available</span>
			</div>
		</c:if>

		<c:if test="${feedbacks.size() > 0}">
			<div class="content">
				<div class="center-container">
					<div class="feedback-container">
						<c:forEach items="${feedbacks}" var="feedback">
							<div class="feedback">
								<div class="feedback-user">
									<div style="display: flex; align-items: center;">
										<i class="fa fa-user-circle-o" style="color: white; font-size: 20px;"></i>
										<div id="name" style="margin-bottom: 2px; font-size: 20px; font-weight: bold;">${feedback.fullName}</div>
									</div>
									<form action="/delete-feedback" method="post">
										<input type="hidden" name="feedbackId" value="${feedback.feedbackId}">
										
									</form>
								</div>
								<div class="feedback-content">${feedback.content}</div>
							</div>
						</c:forEach>
					</div>
				</div>
			</div>
		</c:if>
	</div>
</body>
</html>