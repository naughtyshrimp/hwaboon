package com.hwaboon.myapp.mypage.model;

public class ShoppingCartVO {
	
	private int cartId;
	private String userId;
	private int itemNo;
	private int amount;
	private String itemName;
	private int itemPrice;
	
	public int getCartId() {
		return cartId;
	}
	public void setCartId(int cartId) {
		this.cartId = cartId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getItemNo() {
		return itemNo;
	}
	public void setItemNo(int itemNo) {
		this.itemNo = itemNo;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getItemName() {
		return itemName;
	}
	public void setItemName(String itemName) {
		this.itemName = itemName;
	}
	public int getItemPrice() {
		return itemPrice;
	}
	public void setItemPrice(int itemPrice) {
		this.itemPrice = itemPrice;
	}
	@Override
	public String toString() {
		return "ShoppingCartVO [cartId=" + cartId + ", userId=" + userId + ", itemNo=" + itemNo + ", amount=" + amount
				+ ", itemName=" + itemName + ", itemPrice=" + itemPrice + "]";
	}
	
	
	
	
	
	
}
