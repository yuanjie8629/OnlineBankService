package com.bean;

import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="cust_loan")
public class CustLoan {
	@Id
	@GenericGenerator(name="loadIdGenerator", strategy="com.generator.LoanIdGenerator")
	@GeneratedValue(generator="loadIdGenerator")
	private String id;
	
	@Column(name="interest_rate")
	@NotNull(message="Please enter interest rate for the loan.")
	@Min(value=0, message="Interest rate must be positive number.")
	@Max(value=100, message="Interest rate must be less than 100.")
	private double interestRate;
	
	@Column(name="repayment_period")
	private int repaymentPeriod;
	
	@Column(name="principal_bal")
	private double principalBal;
	
	@Column(name="total_amount")
	@Min(value=0, message="Total loan amount must be positive number.")
	@NotNull(message="Please enter the total loan amount.")
	private double totalAmount;
	
	@Min(value=0, message="Down Payment must be positive number.")
	@NotNull(message="Please enter the  down payment paid for the loan.")
	private double downpayment;
	
	@Column(name="disbursement_bank")
	@NotBlank(message="Please enter the disbursement bank for the loan.")
	private String disbursementBank;
	
	@Column(name="disbursement_acc_type")
	@NotBlank(message="Please select the disbursement account type for the loan.")
	private String disbursementAccType;
	
	@Column(name="disbursement_acc_num")
	@NotBlank(message="Please select the disbursement account number for the loan.")
	private String disbursementAccNum;
	
	private String status;
	
	@OneToMany(mappedBy="loan", cascade=CascadeType.ALL)
	private List<LoanPayment> transactions;
	
	@ManyToOne
	private Loan loan;
	
	@ManyToOne
	private Customer customer;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public double getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(double interestRate) {
		this.interestRate = interestRate;
	}

	public int getRepaymentPeriod() {
		return repaymentPeriod;
	}

	public void setRepaymentPeriod(int repaymentPeriod) {
		this.repaymentPeriod = repaymentPeriod;
	}

	public double getPrincipalBal() {
		return principalBal;
	}

	public void setPrincipalBal(double principalBal) {
		this.principalBal = principalBal;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public double getDownpayment() {
		return downpayment;
	}

	public void setDownpayment(double downpayment) {
		this.downpayment = downpayment;
	}

	public String getDisbursementBank() {
		return disbursementBank;
	}

	public void setDisbursementBank(String disbursementBank) {
		this.disbursementBank = disbursementBank;
	}

	public String getDisbursementAccType() {
		return disbursementAccType;
	}

	public void setDisbursementAccType(String disbursementAccType) {
		this.disbursementAccType = disbursementAccType;
	}

	public String getDisbursementAccNum() {
		return disbursementAccNum;
	}

	public void setDisbursementAccNum(String disbursementAccNum) {
		this.disbursementAccNum = disbursementAccNum;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<LoanPayment> getTransactions() {
		return transactions;
	}

	public void setTransactions(List<LoanPayment> transactions) {
		this.transactions = transactions;
	}

	public Loan getLoan() {
		return loan;
	}

	public void setLoan(Loan loan) {
		this.loan = loan;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public CustLoan() {
		
	}

	public CustLoan(String id,
			@NotNull(message = "Please enter interest rate for the loan.") @Min(value = 0, message = "Interest rate must be positive number.") @Max(value = 100, message = "Interest rate must be less than 100.") double interestRate,
			int repaymentPeriod, double principalBal,
			@Min(value = 0, message = "Total loan amount must be positive number.") @NotNull(message = "Please enter the total loan amount.") double totalAmount,
			@Min(value = 0, message = "Down Payment must be positive number.") @NotNull(message = "Please enter the  down payment paid for the loan.") double downpayment,
			@NotBlank(message = "Please enter the disbursement bank for the loan.") String disbursementBank,
			@NotBlank(message = "Please select the disbursement account type for the loan.") String disbursementAccType,
			@NotBlank(message = "Please select the disbursement account number for the loan.") String disbursementAccNum,
			List<LoanPayment> transactions, Loan loan, Customer customer) {
		this.id = id;
		this.interestRate = interestRate;
		this.repaymentPeriod = repaymentPeriod;
		this.principalBal = principalBal;
		this.totalAmount = totalAmount;
		this.downpayment = downpayment;
		this.disbursementBank = disbursementBank;
		this.disbursementAccType = disbursementAccType;
		this.disbursementAccNum = disbursementAccNum;
		this.transactions = transactions;
		this.loan = loan;
		this.customer = customer;
	}
}
