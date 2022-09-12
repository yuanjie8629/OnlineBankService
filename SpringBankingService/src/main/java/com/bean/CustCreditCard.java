package com.bean;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="cust_credit_card")
@PrimaryKeyJoinColumn(name="id")  
public class CustCreditCard extends CustCard {
	
	@Column(name="card_display_name")
	private String cardDisplayName;
	
	@Column(name="balance")
	private double balance;
	
	@Column(name="credit_limit")
	private double creditLimit;
	
	@OneToMany(mappedBy="creditCard", cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH })
	private List<CreditCardTransaction> transactions;
	
	@OneToMany(mappedBy="creditCard", cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH })
	private List<CreditCardPayment> payments;
	
	@ManyToOne
	@JoinColumn(name="credit_card_id")
	private CreditCard creditCard;
	
	@ManyToOne
	@JoinColumn(name="customer_id")
	private Customer customer;
	
	public int getId() {
		return super.getId();
	}
	
	public void setId(int id) {
		super.setId(id);
	}
	
	public String getCardDisplayName() {
		return cardDisplayName;
	}

	public void setCardDisplayName(String cardDisplayName) {
		this.cardDisplayName = cardDisplayName;
	}

	public double getBalance() {
		return balance;
	}

	public void setBalance(double balance) {
		this.balance = balance;
	}

	public double getCreditLimit() {
		return creditLimit;
	}

	public void setCreditLimit(double creditLimit) {
		this.creditLimit = creditLimit;
	}

	public List<CreditCardTransaction> getTransactions() {
		return transactions;
	}

	public void setTransactions(List<CreditCardTransaction> transactions) {
		this.transactions = transactions;
	}

	public List<CreditCardPayment> getPayments() {
		return payments;
	}

	public void setPayments(List<CreditCardPayment> payments) {
		this.payments = payments;
	}

	public CreditCard getCreditCard() {
		return creditCard;
	}

	public void setCreditCard(CreditCard creditCard) {
		this.creditCard = creditCard;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}
	
	public CustCreditCard() {
		
	}

	public CustCreditCard(String cardDisplayName, double balance, double creditLimit,
			List<CreditCardTransaction> transactions, List<CreditCardPayment> payments, CreditCard creditCard,
			Customer customer) {
		this.cardDisplayName = cardDisplayName;
		this.balance = balance;
		this.creditLimit = creditLimit;
		this.transactions = transactions;
		this.payments = payments;
		this.creditCard = creditCard;
		this.customer = customer;
	}

	@Override
	public String toString() {
		return "CustCreditCard [" + super.toString() + ", cardDisplayName=" + cardDisplayName + ", balance=" + balance + ", creditLimit="
				+ creditLimit +  ", creditCard=" + creditCard + ", customer=" + customer + "]";
	}
}
