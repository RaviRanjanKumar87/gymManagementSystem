package com.infosys.gymManagementSystem.controller;

import java.util.List;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.infosys.gymManagementSystem.bean.Feedback;
import com.infosys.gymManagementSystem.bean.GymBook;
import com.infosys.gymManagementSystem.bean.GymItem;
import com.infosys.gymManagementSystem.bean.GymUser;
import com.infosys.gymManagementSystem.bean.Item;
import com.infosys.gymManagementSystem.bean.Slot;
import com.infosys.gymManagementSystem.bean.SlotItem;
import com.infosys.gymManagementSystem.bean.SlotItemEmbed;
import com.infosys.gymManagementSystem.dao.FeedbackDao;
import com.infosys.gymManagementSystem.dao.GymBookDao;
import com.infosys.gymManagementSystem.dao.GymItemDao;
import com.infosys.gymManagementSystem.dao.SlotDao;
import com.infosys.gymManagementSystem.dao.SlotItemDao;
import com.infosys.gymManagementSystem.exception.DuplicateBookingException;
import com.infosys.gymManagementSystem.exception.SeatNotAvailableException;
import com.infosys.gymManagementSystem.service.GymItemService;
import com.infosys.gymManagementSystem.service.GymUserService;

@Controller
@RestController

public class GymController {
	@Autowired
	private GymItemDao gymItemDao;
	@Autowired
	private SlotDao slotDao;
	
	@Autowired
	private SlotItemDao slotItemDao;
	@Autowired
	private GymItemService itemService;
	@Autowired
	private GymUserService userService;
	@Autowired
	private GymBookDao gymBookDao;
	@Autowired
	private FeedbackDao feedbackDao;
	@GetMapping("/index")
	public ModelAndView showIndex() {
		String indexPg="";
		String type=userService.getType();
		if(type.equalsIgnoreCase("Admin"))
			indexPg="index1";
		else if(type.equalsIgnoreCase("Customer"))
			indexPg="index2";
		return new ModelAndView(indexPg);
	}
	@GetMapping("/gymitem")
	public ModelAndView showItemEntryPage() {
		GymItem gymItem= new GymItem();
		Long newId=gymItemDao.generateItemId();
		gymItem.setItemId(newId);
		ModelAndView mv = new ModelAndView("gymItemEntry");
		mv.addObject("itemRecord",gymItem);
		return mv;
		
	}
	@PostMapping("/gymitem")
	public ModelAndView saveItem(@ModelAttribute("itemRecord") GymItem gymItem,HttpSession session) {
		gymItemDao.save(gymItem);
		session.setAttribute("message", "Item added successfully!");
		return new ModelAndView("redirect:/index");
	}

	@GetMapping("/gymitems")
	public ModelAndView showItemReportPage() {
		List<GymItem> itemList=gymItemDao.displayAllItems();
		ModelAndView mv=new ModelAndView("gymItemReport");
		mv.addObject("itemList",itemList);
		return mv;
	}
	@GetMapping("/slot")
	public ModelAndView showSlotEntryPage() {
		Slot slotItem= new Slot();
		Long newId=slotDao.generateSlotId();
		slotItem.setSlotId(newId);
		ModelAndView mv = new ModelAndView("slotEntryPage");
		mv.addObject("slotRecord",slotItem);
		return mv;
		}
	@PostMapping("/slot")
	public ModelAndView saveSlot(@ModelAttribute("slotRecord") Slot slotItem,HttpSession session) {
		slotDao.saveNewSlot(slotItem);
		List<GymItem> itemList=gymItemDao.displayAllItems();
		for(GymItem item:itemList) {
			SlotItemEmbed embed = new SlotItemEmbed(slotItem.getSlotId(),item.getItemId());
			SlotItem slot=new SlotItem(embed);
			slotItemDao.save(slot);
			
		} 
	
		session.setAttribute("message", "Slot added successfully!");
		return new ModelAndView("redirect:/index");


	}
	@GetMapping("/slots")
	public ModelAndView showSlotReportPage() {
		List<Slot> slotList=slotDao.displayAllSlot();
		ModelAndView mv=new ModelAndView("slotReportPage");
		mv.addObject("slotList",slotList);
		return mv;
	}
	@GetMapping("/slot-book/{id}")
	public ModelAndView showSlotBookPage(@PathVariable Long id){
	String fname="";
	String userType=userService.getType();
	if(userType.equalsIgnoreCase("Admin"))
			fname="slotBookPage1";
	else if (userType.equalsIgnoreCase("Customer"))
			fname="slotBookPage2";	
	
	
	Slot slot=slotDao.findSlotById(id);
	List<Item> itemList=itemService.getItemList(id);
	ModelAndView mv= new ModelAndView(fname);
	mv.addObject("slot",slot);
	mv.addObject("itemList", itemList);
	if(userType.equalsIgnoreCase("Admin")){
		List<String> userList=userService.getAllCustomers();
		//userList.forEach(u->System.out.println(u));
		mv.addObject("userList",userList);
	}
	return mv;
}
	@GetMapping("/admin-booking-detail")
	public ModelAndView showAdminBooking() {
		List<GymBook> bookList=gymBookDao.getBookList();
		ModelAndView mv=new ModelAndView("AdminBookingDetails");
		mv.addObject("bookList",bookList);
		return mv;
	}
	 @GetMapping("/customerBookingDetails")
	    public ModelAndView showCustomerBookings() {
	        String username = userService.getUser().getUsername();
	        List<GymBook> customerBookings = gymBookDao.findBookingsByUsername(username);
	        ModelAndView mv = new ModelAndView("CustomerBookingDetails");
	        mv.addObject("bookings", customerBookings);
	        return mv;
	    }
	 @GetMapping("/feedback")
		public ModelAndView showFeedbackForm() {
			return new ModelAndView("feedbackEntryPage");
		}
		
		@PostMapping("/feedback")
		public ModelAndView processFeedback(@RequestParam("content") String content) {
			Feedback feedback = new Feedback();
			GymUser gymUser = userService.getUser();
			
			feedback.setUserId(gymUser.getUsername());
			feedback.setFullName(gymUser.getFirstName()+" "+gymUser.getLastName());
			feedback.setContent(content);
			
			feedbackDao.saveFeedback(feedback);
			ModelAndView mv = new ModelAndView("confirmPage");
			mv.addObject("msg", "Thank you for your valueable feedback !");
			return mv;
		}
		
		@GetMapping("/feedbacks")
		public ModelAndView showAllFeedbacks() {
			
			if(userService.getType().equalsIgnoreCase("Admin")) 
				throw new AccessDeniedException("User not allowed");
			
			ModelAndView mv = new ModelAndView("feedbackList");
			List<Feedback> feedbacks = feedbackDao.getFeedbackList();
			mv.addObject("feedbacks",feedbacks);
			
			return mv;
		}
		
		@PostMapping("/delete-feedback")
		public ModelAndView deleteFeedback(@RequestParam("feedbackId") Long feedbackId) {
			if(userService.getType().equalsIgnoreCase("Admin")) 
				throw new AccessDeniedException("User not allowed");
			
			feedbackDao.deleteFeedBackById(feedbackId);
			return new ModelAndView("redirect:/feedbacks");
		}
		
		

	 @GetMapping("/cancel-booking/{id}")
	    public ModelAndView cancelBooking(@PathVariable Long id) {
		 GymBook gymBook = gymBookDao.findBookInfoById(id); 
		 if (gymBook != null) {
	            SlotItemEmbed embed = new SlotItemEmbed(gymBook.getSlotId(), gymBook.getItemId());
	            SlotItem slotItem = slotItemDao.findItemById(embed);
	            if (slotItem != null) {
	                int seatBooked = slotItem.getSeatBooked();
	                if (seatBooked > 0) {
	                    seatBooked--;
	                    slotItem.setSeatBooked(seatBooked);
	                    slotItemDao.save(slotItem);
	                    gymBookDao.deleteById(id);
	                }
	            }
	        }
	        
	       
	        ModelAndView mv = new ModelAndView("bookingCancellationSuccess");
	        mv.addObject("message", "Booking has been cancelled successfully!");
	        return mv;
	    }

		@PostMapping("/slot-book")
		public ModelAndView bookSlot(@RequestParam("slot_id") Long slotId, @RequestParam("selectItem") Long itemId, @RequestParam("userId") String userId, Model model) {
		    GymItem gymItem = gymItemDao.findItemById(itemId);
		    SlotItemEmbed embedId = new SlotItemEmbed(slotId, itemId);
		    SlotItem slotItem = slotItemDao.findItemById(embedId);
		    int totalSeat = gymItem.getTotalSeat();
		    int currentSeatBooked = slotItem.getSeatBooked();
		    int available = totalSeat - currentSeatBooked;
		    GymBook gymBook = null;
		    String customerId = "";
	        if (userId.equals("0"))
	            customerId = userService.getUser().getUsername();
	        else
	            customerId = userId;
	        
	        List<GymBook> existingBookings = gymBookDao.findBookingsByUsername(customerId);
	        for (GymBook booking : existingBookings) {
	            if (booking.getSlotId().equals(slotId)) {
	                throw new DuplicateBookingException("You have already booked in  this slot.");
	            }
	        }

		    if (available > 0) {
		        Long bookingId = gymBookDao.generateBookingId();
		        slotItem.setSeatBooked(currentSeatBooked + 1);
		        gymBook = new GymBook(bookingId, slotId, itemId, customerId);
		        gymBookDao.save(gymBook);
		        slotItemDao.save(slotItem);
		        model.addAttribute("message", "Slot booked successfully!");
		        model.addAttribute("booking", gymBook);
		    } else {
		        throw new SeatNotAvailableException("No seats available for the selected slot and item.");
		    }
		    
		    return new ModelAndView("BookingSuccess");
		}


    @GetMapping("/slot-item-add/{id}")
	public ModelAndView saveItemSlots(@PathVariable Long id) {
    	itemService.addNewItemToSlots(id);
    	return new ModelAndView("redirect:/index");
}
	
}
