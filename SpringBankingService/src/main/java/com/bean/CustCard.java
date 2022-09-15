package com.bean;

import java.time.LocalDateTime;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.validation.annotation.Validated;

import com.annotation.CardNum;

@Validated
@Entity
@Table(name="cust_card")
@Inheritance(strategy=InheritanceType.JOINED)  
public class CustCard {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	protected int id;
	
	@Column(name="card_num", unique=true)
	@CardNum(message="Card Number already exists.")
	@NotBlank(message="Please enter the card number.")
	// Pattern of cardNum = 0000 0000 0000 0000
	@Pattern(regexp="[\\d]{4}\\s[\\d]{4}\\s[\\d]{4}\\s[\\d]{4}", message="Card Number should be 16 digits.")
	protected String cardNum;
	
	@NotBlank(message="Please enter the card brand.")
	protected String brand;
	
	@NotBlank(message="Please enter the card cvv.")
	@Pattern(regexp="[\\d]{3}", message="Card cvv must be 3 digits.")
	protected String cvv;
	
	@Column(name="create_date")
	@CreationTimestamp
	protected LocalDateTime createDate;
	
	@Column(name="expiration_date")
	@NotNull(message="Please enter the card expiration date.")
	@Pattern(regexp="(0[1-9]|10|11|12)/[0-9]{2}", message="Please enter valid date in \'mm/yy\' format.")
	protected String expirationDate;
	
	@Pattern(regexp="[\\d]{6}", message="Card pin must be 6 digits.")
	protected String pin;
	
	protected String status;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getCardNum() {
		return cardNum;
	}

	public void setCardNum(String cardNum) {
		this.cardNum = cardNum;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCvv() {
		return cvv;
	}

	public void setCvv(String cvv) {
		this.cvv = cvv;
	}

	public LocalDateTime getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDateTime createDate) {
		this.createDate = createDate;
	}

	public String getExpirationDate() {
		return expirationDate;
	}

	public void setExpirationDate(String expirationDate) {
		this.expirationDate = expirationDate;
	}

	public String getPin() {
		return pin;
	}

	public void setPin(String pin) {
		this.pin = pin;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}
	
	public CustCard() {
		
	}

	public CustCard(int id,
			@NotBlank(message = "Please enter the card number.") @Pattern(regexp = "[\\d]{4}\\s[\\d]{4}\\s[\\d]{4}\\s[\\d]{4}", message = "Card Number should be 16 digits.") String cardNum,
			@NotBlank(message = "Please enter the card brand.") String brand,
			@NotBlank(message = "Please enter the card cvv.") @Pattern(regexp = "[\\d]{3}", message = "Card cvv must be 3 digits.") String cvv,
			LocalDateTime createDate,
			@NotNull(message = "Please enter the card expiration date.") @Pattern(regexp = "(0[1-9]|10|11|12)/[0-9]{2}", message = "Please enter valid date in 'mm/yy' format.") String expirationDate,
			@Pattern(regexp = "[\\d]{6}", message = "Card pin must be 6 digits.") String pin, String status) {
		this.id = id;
		this.cardNum = cardNum;
		this.brand = brand;
		this.cvv = cvv;
		this.createDate = createDate;
		this.expirationDate = expirationDate;
		this.pin = pin;
		this.status = status;
	}

	@Override
	public String toString() {
		return "CustCard [id=" + id + ", cardNum=" + cardNum + ", brand=" + brand + ", cvv=" + cvv + ", createDate="
				+ createDate + ", expirationDate=" + expirationDate + ", pin=" + pin + ", status=" + status + "]";
	}
}
