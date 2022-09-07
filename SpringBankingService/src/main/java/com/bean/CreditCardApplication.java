package com.bean;

import java.time.LocalDate;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;

@Entity
@Table(name="credit_card_application")
public class CreditCardApplication {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@NotBlank(message="Please enter name.")
	private String name;
	
	@NotBlank(message="Please enter email.")
	@Email(message="Please enter valid email.")
	private String email;
	
	@Column(name="contact_no")
	@Pattern(regexp="^[689]\\d{7}$", message="Please enter valid Singapore phone number.")
	private String contactNo;
	
	@NotNull(message="Please select gender.")
	private char gender;
	
	@NotBlank(message="Please select your salutation.")
	private String salutation;
	
	@Column(name="identity_number", unique=true)
	private String identityNumber;
	
	@NotBlank(message="Please select your nationality.")
	private String nationality;
	
	@NotBlank(message="Please select your race.")
	private String race;
	
	@NotBlank(message="Please select your industry.")
	private String industry;
	
	@NotBlank(message="Please enter your occupation.")
	private String occupation;
	
	@NotBlank(message="Please enter your birthdate.")
	private LocalDate birthdate;
	
	@OneToOne(targetEntity=Address.class,cascade=CascadeType.ALL)
	private Address address;
	
	@Column(name="marital_status")
	@NotBlank(message="Please select your marital status.")
	private String maritalStatus;
}
