package com.bean;

import java.util.List;

import javax.persistence.*;
import javax.validation.constraints.NotBlank;


@Entity
@Table(name="cust_credit_card")
@PrimaryKeyJoinColumn(name="card_num")  
public class CustCreditCard extends CustCard {
	
	@Column(name="card_display_name")
	private String cardDisplayName;
	
	@Column(name="avail_amt")
	private double availAmt;
	
	@Column(name="credit_limit")
	private double creditLimit;
	
	@OneToMany(mappedBy="custCreditCard", cascade=CascadeType.ALL)
	private List<CreditCardTransaction> transactions;
	
	@ManyToOne
	@JoinColumn(name="credit_card_id")
	private CreditCard creditCard;
	
	@ManyToOne
	@JoinColumn(name="customer_id")
	private Customer customer;

	public String getCardDisplayName() {
		return cardDisplayName;
	}

	public void setCardDisplayName(String cardDisplayName) {
		this.cardDisplayName = cardDisplayName;
	}

	public double getAvailAmt() {
		return availAmt;
	}

	public void setAvailAmt(double availAmt) {
		this.availAmt = availAmt;
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

	public CustCreditCard(String cardDisplayName, double availAmt, double creditLimit,
			List<CreditCardTransaction> transactions, CreditCard creditCard, Customer customer) {
		super();
		this.cardDisplayName = cardDisplayName;
		this.availAmt = availAmt;
		this.creditLimit = creditLimit;
		this.transactions = transactions;
		this.creditCard = creditCard;
		this.customer = customer;
	}

	@Override
	public String toString() {
		final int maxLen = 10;
		return "CustCreditCard [" + super.toString() + ", cardDisplayName=" + cardDisplayName + ", availAmt=" + availAmt + ", creditLimit="
				+ creditLimit + ", transactions="
				+ (transactions != null ? transactions.subList(0, Math.min(transactions.size(), maxLen)) : null)
				+ ", creditCard=" + creditCard + ", customer=" + customer + "]";
	}
}
