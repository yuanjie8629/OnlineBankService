package com.bean;

import java.time.LocalDate;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.validation.annotation.Validated;

import com.annotation.CardNum;

@Validated
@Entity
@Table(name="cust_card")
@Inheritance(strategy=InheritanceType.JOINED)  
public class CustCard {
	@Id
	@CardNum(message="Card Number already exists.")
	@Column(name="card_num")
	@NotBlank(message="Please enter the card number.")
	// Pattern of cardNum = 0000 0000 0000 0000
	@Pattern(regexp="[\\d]{4}\\s[\\d]{4}\\s[\\d]{4}\\s[\\d]{4}", message="Card Number should be 16 digits.")
	private String cardNum;
	
	@NotBlank(message="Please enter the card brand.")
	private String brand;
	
	@NotBlank(message="Please enter the card cvv.")
	@Pattern(regexp="[\\d]{3}", message="Card cvv must be 3 digits.")
	private String cvv;
	
	@Column(name="create_date")
	@CreationTimestamp
	private LocalDate createDate;
	
	
	@Column(name="expiration_date")
	@NotNull(message="Please enter the card expiration date.")
	@Pattern(regexp="(0[1-9]|10|11|12)/[0-9]{2}", message="Please enter valid date in \'mm/yy\' format.")
	private String expirationDate;
	
	@Pattern(regexp="[\\d]{6}", message="Card pin must be 6 digits.")
	private String pin;
	
	private String status;

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

	public LocalDate getCreateDate() {
		return createDate;
	}

	public void setCreateDate(LocalDate createDate) {
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

	public CustCard(@NotBlank(message = "Please enter the card number.") String cardNum,
			@NotBlank(message = "Please enter the card brand.") String brand,
			@NotBlank(message = "Please enter the card cvv.") @Size(min = 3, max = 3) String cvv, LocalDate createDate,
			String expirationDate, @Size(min = 6, max = 6) String pin, String status) {
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
		return "CustCard [cardNum=" + cardNum + ", brand=" + brand + ", cvv=" + cvv + ", createDate=" + createDate
				+ ", expirationDate=" + expirationDate + ", pin=" + pin + ", status=" + status + "]";
	}
}
