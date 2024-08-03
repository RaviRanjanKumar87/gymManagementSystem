package com.infosys.gymManagementSystem.exception;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.ModelAndView;

@ControllerAdvice
public class ExceptionHandlerAdvice {

    @ExceptionHandler(SeatNotAvailableException.class)
    public ModelAndView handleSeatNotAvailableException(SeatNotAvailableException ex, Model model) {
        ModelAndView mv = new ModelAndView("errorPage");
        mv.addObject("message", ex.getMessage());
        return mv;
    }
    @ExceptionHandler(DuplicateBookingException.class)
    public ModelAndView handleDuplicateBookingException(DuplicateBookingException ex, Model model) {
        ModelAndView mv = new ModelAndView("errorPage");
        mv.addObject("message", ex.getMessage());
        return mv;}
}