package com.bean;

import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="credit_card_payment")
public class CreditCardPayment {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@CreationTimestamp
	private LocalDateTime date;
	
	@Column(name="paid_date")
	private LocalDateTime paidDate;
	
	@Column(name="due_date")
	private LocalDateTime dueDate;
	
	private String description;
	
	@Column(name="interest_charged")
	private double interestCharged;
	
	@Column(name="amount")
	private double amount;
	
	private String status;
	
	@ManyToOne
	@JoinColumn(name="credit_card_id") 
	private CustCreditCard creditCard;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}

	public LocalDateTime getPaidDate() {
		return paidDate;
	}

	public void setPaidDate(LocalDateTime paidDate) {
		this.paidDate = paidDate;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}
	
	public double getInterestCharged() {
		return interestCharged;
	}

	public void setInterestCharged(double interestCharged) {
		this.interestCharged = interestCharged;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public CustCreditCard getCreditCard() {
		return creditCard;
	}

	public void setCreditCard(CustCreditCard creditCard) {
		this.creditCard = creditCard;
	}
	
	public CreditCardPayment() {
		
	}

	public CreditCardPayment(int id, LocalDateTime date, LocalDateTime paidDate, String description,
			double interestCharged, double amount, String status, CustCreditCard creditCard) {
		this.id = id;
		this.date = date;
		this.paidDate = paidDate;
		this.description = description;
		this.interestCharged = interestCharged;
		this.amount = amount;
		this.status = status;
		this.creditCard = creditCard;
	}
}
