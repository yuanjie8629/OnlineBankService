package com.bean;

import java.time.LocalDateTime;
import java.util.Objects;
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

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="cust_account")
public class CustAccount {
	@Id
	@GenericGenerator(name="accNumGenerator", strategy="com.generator.AccountNumGenerator")
	@GeneratedValue(generator="accNumGenerator")
	@Column(name="acc_num")
	private String accNum;
	
	@Column(name="cur_bal")
	private double curBal;
	
	@Column(name="avail_bal")
	private double availBal;
	
	@Column(name="hold_amt")
	private double holdAmt;
	
	@Column(name="open_date")
	@CreationTimestamp
	private LocalDateTime openDate;
	
	@Column(name="close_date")
	private LocalDateTime closeDate;
	
	private String status;
	
	@ManyToOne
	@JoinColumn(name="customer_id")
	private Customer customer;
	
	@ManyToOne
	@JoinColumn(name="account_id")
	private Account account;
	
	@OneToMany(mappedBy="account", cascade = { CascadeType.PERSIST, CascadeType.MERGE, CascadeType.REFRESH })
	private List<AccountTransaction> transactions;

	public String getAccNum() {
		return accNum;
	}

	public void setAccNum(String accNum) {
		this.accNum = accNum;
	}

	public double getCurBal() {
		return curBal;
	}

	public void setCurBal(double curBal) {
		this.curBal = curBal;
	}

	public double getAvailBal() {
		return availBal;
	}

	public void setAvailBal(double availBal) {
		this.availBal = availBal;
	}

	public double getHoldAmt() {
		return holdAmt;
	}

	public void setHoldAmt(double holdAmt) {
		this.holdAmt = holdAmt;
	}

	public LocalDateTime getOpenDate() {
		return openDate;
	}

	public void setOpenDate(LocalDateTime openDate) {
		this.openDate = openDate;
	}

	public LocalDateTime getCloseDate() {
		return closeDate;
	}

	public void setCloseDate(LocalDateTime closeDate) {
		this.closeDate = closeDate;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public Customer getCustomer() {
		return customer;
	}

	public void setCustomer(Customer customer) {
		this.customer = customer;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public List<AccountTransaction> getTransactions() {
		return transactions;
	}

	public void setTransactions(List<AccountTransaction> transactions) {
		this.transactions = transactions;
	}
	
	public CustAccount() {
		
	}
	
	public CustAccount(String accNum) {
		this.accNum = accNum;
	}

	public CustAccount(String accNum, double curBal, double availBal, double holdAmt, LocalDateTime openDate,
			LocalDateTime closeDate, String status, Customer customer, Account account,
			List<AccountTransaction> transactions) {
		this.accNum = accNum;
		this.curBal = curBal;
		this.availBal = availBal;
		this.holdAmt = holdAmt;
		this.openDate = openDate;
		this.closeDate = closeDate;
		this.status = status;
		this.customer = customer;
		this.account = account;
		this.transactions = transactions;
	}

	@Override
	public int hashCode() {
		return Objects.hash(accNum);
	}

	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CustAccount other = (CustAccount) obj;
		return Objects.equals(accNum, other.accNum);
	}
}
