package com.bean;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="loan")
public class Loan {
	@Id
	@GenericGenerator(name="loadIdGenerator", strategy="com.utils.LoanIdGenerator")
	@GeneratedValue(generator="loadIdGenerator")
	private int id;
	
	@Column(name="interest_rate")
	private double interestRate;
	
	@Column(name="repayment_period")
	private double repaymentPeriod;
	
	@Column(name="principal_bal")
	private double principalBal;
	
	@Column(name="total_amount")
	private double totalAmount;
	
	@OneToMany(mappedBy="loan", cascade=CascadeType.ALL)
	private List<LoanTransaction> transactions;
}
