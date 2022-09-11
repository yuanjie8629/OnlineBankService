package com.bean;

import java.util.Set;

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
	
	@OneToMany(mappedBy="custCreditCard", cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH })
	private Set<CreditCardTransaction> transactions;
	
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

	public Set<CreditCardTransaction> getTransactions() {
		return transactions;
	}

	public void setTransactions(Set<CreditCardTransaction> transactions) {
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
			Set<CreditCardTransaction> transactions, CreditCard creditCard, Customer customer) {
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
		return "CustCreditCard [" + super.toString() + ", cardDisplayName=" + cardDisplayName + ", availAmt=" + availAmt + ", creditLimit="
				+ creditLimit +  ", creditCard=" + creditCard + ", customer=" + customer + "]";
	}
}
