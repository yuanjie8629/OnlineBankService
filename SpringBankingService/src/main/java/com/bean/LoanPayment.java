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

@Entity
@Table(name="loan_payment")
public class LoanPayment {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private LocalDateTime date;
	
	private String description;
	
	private double principal;
	
	private double interest;
	
	@Column(name="amount_paid")
	private double amountPaid;
	
	private double balance;
	
	private String status;
	
	@ManyToOne(targetEntity=CustLoan.class)
	@JoinColumn(name="loan_id")
	private CustLoan loan;
}
