package com.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;

@Entity
@Table(name="address")
public class Address {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@NotBlank(message="Please enter your adderess.")
	private String addressLine1;
	
	private String addressLine2;
	
	private String addressLine3;
	
	@Column(name="postal_code")
	@NotBlank(message="Please enter your postalCode.")
	private String postalCode;
	
	@NotBlank(message="Please select your country.")
	private String country;
	
	@OneToOne(targetEntity=Customer.class)
	private Customer customer;

	public String getAddressLine1() {
		return addressLine1;
	}

	public void setAddressLine1(String addressLine1) {
		this.addressLine1 = addressLine1;
	}

	public String getAddressLine2() {
		return addressLine2;
	}

	public void setAddressLine2(String addressLine2) {
		this.addressLine2 = addressLine2;
	}

	public String getAddressLine3() {
		return addressLine3;
	}

	public void setAddressLine3(String addressLine3) {
		this.addressLine3 = addressLine3;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getCountry() {
		return country;
	}

	public void setCountry(String country) {
		this.country = country;
	}
	
	public Address() {
		
	}

	public Address(String addressLine1, String addressLine2, String addressLine3, String postalCode, String country) {
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.addressLine3 = addressLine3;
		this.postalCode = postalCode;
		this.country = country;
	}
}
