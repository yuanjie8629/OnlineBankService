package com.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="loan")
public class LoanType {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String type;
	
	private String title;
	
	private String description;
	
	@Column(name="interest_rate")
	private double interestRate;
	
	private double downpayment;
	
	@Lob
	@Column(name = "thumbnail", columnDefinition="BLOB")
	private byte[] thumbnail;
	
	@Column(name="is_deleted", nullable = false, columnDefinition = "TINYINT(1) default 0")
	private boolean isDeleted;
}
