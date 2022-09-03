package com.bean;

import java.util.List;

import javax.persistence.*;

@Entity
@Table(name="credit_card")
@PrimaryKeyJoinColumn(name="card_num")  
public class CreditCard extends Card {
	
	@ManyToOne
	@JoinColumn(name="customer_id")
	private Customer customer;
	
	@Column(name="avail_amt")
	private double availAmt;
	
	@Column(name="credit_limit")
	private double creditLimit;
	
	@OneToMany(mappedBy="creditCard", cascade=CascadeType.ALL)
	private List<CreditCardTransaction> transactions;
}
