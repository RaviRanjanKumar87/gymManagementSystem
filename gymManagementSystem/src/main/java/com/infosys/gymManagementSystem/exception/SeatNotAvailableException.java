package com.infosys.gymManagementSystem.exception;

public class SeatNotAvailableException extends RuntimeException {
	private static final long serialVersionUID=1L;
	public SeatNotAvailableException() {
        super("Seat not available");
    }

    public SeatNotAvailableException(String message) {
    	super(message);}
}