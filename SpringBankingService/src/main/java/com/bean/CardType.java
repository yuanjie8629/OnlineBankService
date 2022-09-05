package com.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.Table;

@Entity
@Table(name="card_type")
public class CardType {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String type;
	
	private String title;
	
	private String description;
	
	@Column(name="annual_fee")
	private double annualFee;
	
	@Column(name="interest_rate")
	private double interestRate;

	@Column(name="min_income")
	private double minIncome;
	
	@Lob
	@Column(name = "thumbnail", columnDefinition="BLOB")
	private byte[] thumbnail;
	
	@Column(name="is_deleted", nullable = false, columnDefinition = "TINYINT(1) default 0")
	private boolean isDeleted;
}