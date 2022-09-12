package com.bean;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

import org.hibernate.annotations.CreationTimestamp;

@Entity
@Table(name="account_transaction")
public class AccountTransaction {
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
	@JoinColumn(name="acc_num")
	private CustAccount account;

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

	public CustAccount getAccount() {
		return account;
	}

	public void setAccount(CustAccount account) {
		this.account = account;
	}
	
	public AccountTransaction() {
		
	}

	public AccountTransaction(int id, String type, LocalDateTime date, String description, String reference,
			double amount, double balance, String status, CustAccount account) {
		super();
		this.id = id;
		this.type = type;
		this.date = date;
		this.description = description;
		this.reference = reference;
		this.amount = amount;
		this.balance = balance;
		this.status = status;
		this.account = account;
	}

	@Override
	public String toString() {
		return "AccountTransaction [id=" + id + ", type=" + type + ", date=" + date + ", description=" + description
				+ ", reference=" + reference + ", amount=" + amount + ", balance=" + balance + ", status=" + status
				+ ", account=" + account + "]";
	}
}
