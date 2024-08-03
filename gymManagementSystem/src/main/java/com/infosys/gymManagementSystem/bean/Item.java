package com.infosys.gymManagementSystem.bean;

public class Item {
	private Long itemId;
	private String itemName;
	private Integer totalSeat;
	private Integer seatVacant;
	public Item() {
		super();
		// TODO AUTO-GENERATED CONSTRUCTOR STUB
	}
	public Item (GymItem gym) {
		this.itemId = gym.getItemId();
		this.itemName = gym.getItemName();
		this.totalSeat = gym.getTotalSeat();
		this.seatVacant = gym.getTotalSeat();
	}
	public Item(Long itemId, String itemName, Integer totalSeat, Integer seatVacant) {
		super();
		this.itemId = itemId;
		this.itemName = itemName;
		this.totalSeat = totalSeat;
		this.seatVacant = seatVacant;
		
	}
	public Integer getTotalSeat() {
		return totalSeat;
	}
	public void setTotalSeat(Integer totalSeat) {
		this.totalSeat = totalSeat;
	}
	public Long getItemId() {
		return itemId;
	}
	public void setItemId(Long itemId) {
		this.itemId = itemId;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public Integer getSeatVacant() {
		return seatVacant;
	}
	public void setSeatVacant(Integer seatVacant) {
		this.seatVacant = seatVacant;
	}
}
