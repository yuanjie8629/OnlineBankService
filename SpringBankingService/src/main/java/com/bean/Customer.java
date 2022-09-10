package com.bean;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;

import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="customer")
@PrimaryKeyJoinColumn(name="id")
public class Customer extends User{
	
	@NotBlank(message="Please select your salutation.")
	private String salutation;
	
	@Column(name="identity_number", unique=true)
	@NotBlank(message="Please enter your identity number.")
	private String identityNumber;
	
	@NotBlank(message="Please select your nationality.")
	private String nationality;
	
	@NotBlank(message="Please select your race.")
	private String race;
	
	@NotBlank(message="Please select your industry.")
	private String industry;
	
	@NotBlank(message="Please enter your occupation.")
	private String occupation;
	
	@NotNull(message="Please enter your birthdate.")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private LocalDate birthdate;
	
	@OneToOne(targetEntity=Address.class, cascade = {CascadeType.ALL})
	private Address address;
	
	@Column(name="marital_status")
	@NotBlank(message="Please select your marital status.")
	private String maritalStatus;
	
	@Column(columnDefinition="varchar(30) default 'active'")
	private String status;
	
	@OneToMany(mappedBy="customer", cascade = {CascadeType.MERGE})
	private List<CustAccount> accounts;
	
	@OneToMany(mappedBy="customer", cascade = {CascadeType.MERGE})
	private List<CustCreditCard> creditCards;
	
	@OneToMany(mappedBy="customer", cascade = {CascadeType.MERGE})
	private List<CustLoan> loans;

	public String getSalutation() {
		return salutation;
	}

	public void setSalutation(String salutation) {
		this.salutation = salutation;
	}

	public String getIdentityNumber() {
		return identityNumber;
	}

	public void setIdentityNumber(String identityNumber) {
		this.identityNumber = identityNumber;
	}

	public String getNationality() {
		return nationality;
	}

	public void setNationality(String nationality) {
		this.nationality = nationality;
	}

	public String getRace() {
		return race;
	}

	public void setRace(String race) {
		this.race = race;
	}

	public String getIndustry() {
		return industry;
	}

	public void setIndustry(String industry) {
		this.industry = industry;
	}

	public String getOccupation() {
		return occupation;
	}

	public void setOccupation(String occupation) {
		this.occupation = occupation;
	}

	public LocalDate getBirthdate() {
		return birthdate;
	}

	public void setBirthdate(LocalDate birthdate) {
		this.birthdate = birthdate;
	}

	public Address getAddress() {
		return address;
	}

	public void setAddress(Address address) {
		this.address = address;
	}

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public List<CustAccount> getAccounts() {
		return accounts;
	}

	public void setAccounts(List<CustAccount> accounts) {
		this.accounts = accounts;
	}

	public List<CustCreditCard> getCreditCards() {
		return creditCards;
	}

	public void setCreditCards(List<CustCreditCard> creditCards) {
		this.creditCards = creditCards;
	}

	public List<CustLoan> getLoans() {
		return loans;
	}

	public void setLoans(List<CustLoan> loans) {
		this.loans = loans;
	}
	
	public Customer() {
		this.accounts = new ArrayList<CustAccount>();
		this.creditCards = new ArrayList<CustCreditCard>();
		this.loans = new ArrayList<CustLoan>();
	}
	
	public Customer(@NotBlank(message = "Please select your salutation.") String salutation, String identityNumber,
			@NotBlank(message = "Please select your nationality.") String nationality,
			@NotBlank(message = "Please select your race.") String race,
			@NotBlank(message = "Please select your industry.") String industry,
			@NotBlank(message = "Please enter your occupation.") String occupation,
			@NotBlank(message = "Please enter your birthdate.") LocalDate birthdate, Address address,
			@NotBlank(message = "Please select your marital status.") String maritalStatus, String status,
			List<CustAccount> accounts, List<CustCreditCard> creditCards, List<CustLoan> loans) {
		super();
		this.salutation = salutation;
		this.identityNumber = identityNumber;
		this.nationality = nationality;
		this.race = race;
		this.industry = industry;
		this.occupation = occupation;
		this.birthdate = birthdate;
		this.address = address;
		this.maritalStatus = maritalStatus;
		this.status = status;
		this.accounts = accounts;
		this.creditCards = creditCards;
		this.loans = loans;
	}

	@Override
	public String toString() {
		return "Customer [salutation=" + salutation + ", identityNumber=" + identityNumber + ", nationality="
				+ nationality + ", race=" + race + ", industry=" + industry + ", occupation=" + occupation
				+ ", birthdate=" + birthdate + ", address=" + address + ", maritalStatus=" + maritalStatus + ", status="
				+ status + "]";
	}
}
