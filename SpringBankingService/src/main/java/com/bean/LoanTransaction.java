package com.bean;

import java.time.LocalDateTime;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

@Entity
@Table(name="loan_transaction")
public class LoanTransaction {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private LocalDateTime date;
	
	private String description;
	
	private double principal;
	
	private double interest;
	
	private double amount_paid;
	
	private double balance;
	
	@ManyToOne(targetEntity=Loan.class)
	@JoinColumn(name="loan_id")
	private Loan loan;
}
