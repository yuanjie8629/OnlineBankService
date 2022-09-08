package com.bean;

import java.time.LocalDate;

import javax.persistence.*;
import javax.validation.constraints.Size;

import org.hibernate.annotations.GenericGenerator;

@Entity
@Table(name="cust_card")
@Inheritance(strategy=InheritanceType.JOINED)  
public class CustCard {
	@Id
	@GenericGenerator(name="cardNumGenerator", strategy="com.generator.CardNumGenerator")
	@GeneratedValue(generator="cardNumGenerator")
	@Column(name="card_num")
	private String cardNum;
		
	private String brand;
	
	private String cvv;
	
	@Column(name="create_date")
	private LocalDate createDate;
	
	@Column(name="expire_date")
	private LocalDate expireDate;
	
	@Size(min=6, max=6)
	private String pin;
	
	private String status;
}
