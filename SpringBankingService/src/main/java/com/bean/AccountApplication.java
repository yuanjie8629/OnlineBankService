package com.bean;

import java.time.LocalDate;
import java.time.LocalDateTime;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.ManyToOne;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;

import org.hibernate.annotations.CreationTimestamp;
import org.hibernate.annotations.GenericGenerator;
import org.springframework.format.annotation.DateTimeFormat;

@Entity
@Table(name="account_application")
public class AccountApplication {
	@Id
	@GenericGenerator(name="applicationNumGenerator", strategy="com.generator.ApplicationNumGenerator")
	@GeneratedValue(generator="applicationNumGenerator")
	private String id;
	
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
	
	@Column(name="identity_number")
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
	
	@Column(name="marital_status")
	@NotBlank(message="Please select your marital status.")
	private String maritalStatus;
	
	@NotBlank(message="Please enter your adderess.")
	private String addressLine1;
	
	private String addressLine2;
	
	private String addressLine3;
	
	@Column(name="postal_code")
	@NotBlank(message="Please enter your postalCode.")
	private String postalCode;
	
	@NotBlank(message="Please select your country.")
	private String country;
	
	@Lob
	@Column(name = "identity_doc", columnDefinition="MEDIUMBLOB")
	@NotNull(message="Please upload your identity card or passport (front and back) in pdf format. (Max 5MB)")
	@Size(min=1, max=5242880, message="Please upload your identity card or passport (front and back) in pdf format. (Max 5MB)")
	private byte[] identityDoc;
	
	@Column(name="apply_date",columnDefinition="timestamp")
	@CreationTimestamp
	private LocalDateTime applyDate;
	
	@Column(columnDefinition="varchar(30) default 'pending'")
	private String status;
	
	private String comments;
	
	@ManyToOne
	private Account account;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public char getGender() {
		return gender;
	}

	public void setGender(char gender) {
		this.gender = gender;
	}

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

	public String getMaritalStatus() {
		return maritalStatus;
	}

	public void setMaritalStatus(String maritalStatus) {
		this.maritalStatus = maritalStatus;
	}

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

	public byte[] getIdentityDoc() {
		return identityDoc;
	}

	public void setIdentityDoc(byte[] identityDoc) {
		this.identityDoc = identityDoc;
	}

	public String getStatus() {
		return status;
	}

	public void setStatus(String status) {
		this.status = status;
	}

	public String getComments() {
		return comments;
	}

	public void setComments(String comments) {
		this.comments = comments;
	}
	
	public LocalDateTime getApplyDate() {
		return applyDate;
	}

	public void setApplyDate(LocalDateTime applyDate) {
		this.applyDate = applyDate;
	}

	public Account getAccount() {
		return account;
	}

	public void setAccount(Account account) {
		this.account = account;
	}

	public AccountApplication() {
		
	}

	public AccountApplication(Customer customer) {
		this.name = customer.getName();
		this.email = customer.getEmail();
		this.contactNo = customer.getContactNo();
		this.gender = customer.getGender();
		this.salutation = customer.getSalutation();
		this.identityNumber = customer.getIdentityNumber();
		this.nationality = customer.getNationality();
		this.race = customer.getRace();
		this.industry = customer.getIndustry();
		this.occupation = customer.getOccupation();
		this.birthdate = customer.getBirthdate();
		this.maritalStatus = customer.getMaritalStatus();
		if (customer.getAddress() != null) {
			this.addressLine1 = customer.getAddress().getAddressLine1();
			this.addressLine2 = customer.getAddress().getAddressLine2();
			this.addressLine3 = customer.getAddress().getAddressLine3();
			this.postalCode = customer.getAddress().getPostalCode();
			this.country = customer.getAddress().getCountry();
		}
	}

	public AccountApplication(String id, @NotBlank(message = "Please enter name.") String name,
			@NotBlank(message = "Please enter email.") @Email(message = "Please enter valid email.") String email,
			@Pattern(regexp = "^[689]\\d{7}$", message = "Please enter valid Singapore phone number.") String contactNo,
			@NotNull(message = "Please select gender.") char gender,
			@NotBlank(message = "Please select your salutation.") String salutation, String identityNumber,
			@NotBlank(message = "Please select your nationality.") String nationality,
			@NotBlank(message = "Please select your race.") String race,
			@NotBlank(message = "Please select your industry.") String industry,
			@NotBlank(message = "Please enter your occupation.") String occupation,
			@NotNull(message = "Please enter your birthdate.") LocalDate birthdate,
			@NotBlank(message = "Please select your marital status.") String maritalStatus,
			@NotBlank(message = "Please enter your adderess.") String addressLine1, String addressLine2,
			String addressLine3, @NotBlank(message = "Please enter your postalCode.") String postalCode,
			@NotBlank(message = "Please select your country.") String country,
			@NotNull(message = "Please upload your identity card or passport (front and back) in pdf format. (Max 5MB)") @Size(min = 1, max = 5242880, message = "Please upload your identity card or passport (front and back) in pdf format. (Max 5MB)") byte[] identityDoc,
			LocalDateTime applyDate, String status, String comments, Account account) {
		this.id = id;
		this.name = name;
		this.email = email;
		this.contactNo = contactNo;
		this.gender = gender;
		this.salutation = salutation;
		this.identityNumber = identityNumber;
		this.nationality = nationality;
		this.race = race;
		this.industry = industry;
		this.occupation = occupation;
		this.birthdate = birthdate;
		this.maritalStatus = maritalStatus;
		this.addressLine1 = addressLine1;
		this.addressLine2 = addressLine2;
		this.addressLine3 = addressLine3;
		this.postalCode = postalCode;
		this.country = country;
		this.identityDoc = identityDoc;
		this.applyDate = applyDate;
		this.status = status;
		this.comments = comments;
		this.account = account;
	}

	@Override
	public String toString() {
		return "AccountApplication [id=" + id + ", name=" + name + ", email=" + email + ", contactNo=" + contactNo
				+ ", gender=" + gender + ", salutation=" + salutation + ", identityNumber=" + identityNumber
				+ ", nationality=" + nationality + ", race=" + race + ", industry=" + industry + ", occupation="
				+ occupation + ", birthdate=" + birthdate + ", maritalStatus=" + maritalStatus + ", addressLine1="
				+ addressLine1 + ", addressLine2=" + addressLine2 + ", addressLine3=" + addressLine3 + ", postalCode="
				+ postalCode + ", country=" + country + ", applyDate=" + applyDate + ", status=" + status
				+ ", comments=" + comments + ", account=" + account + "]";
	}
}
