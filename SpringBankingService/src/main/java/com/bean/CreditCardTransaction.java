package com.bean;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="credit_card_transaction")
public class CreditCardTransaction {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String type;
	
	@CreationTimestamp
	private LocalDateTime date;
	
	private String description;
	
	private String reference;
	
	private double amount;
	
	private double balance;
	
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public LocalDateTime getDate() {
		return date;
	}

	public void setDate(LocalDateTime date) {
		this.date = date;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getReference() {
		return reference;
	}

	public void setReference(String reference) {
		this.reference = reference;
	}

	public double getAmount() {
		return amount;
	}

	public void setAmount(double amount) {
		this.amount = amount;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public CustCreditCard getCustCreditCard() {
		return creditCard;
	}

	public void setCreditCard(CustCreditCard creditCard) {
		this.creditCard = creditCard;
	}
	
	public CreditCardTransaction() {
		
	}

	public CreditCardTransaction(int id, String type, LocalDateTime date, String description, String reference,
			double amount, double balance, String status, CustCreditCard creditCard) {
		this.id = id;
		this.type = type;
		this.date = date;
		this.description = description;
		this.reference = reference;
		this.amount = amount;
		this.balance = balance;
		this.status = status;
		this.creditCard = creditCard;
	}
}