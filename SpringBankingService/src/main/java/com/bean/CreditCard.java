package com.bean;

import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Lob;
import javax.persistence.OneToMany;
import javax.persistence.Table;
import javax.validation.constraints.Max;
import javax.validation.constraints.Min;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import com.utils.FileUtils;

@Entity
@Table(name="credit_card")
public class CreditCard {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@NotBlank(message="Please enter title for the card.")
	private String title;
	
	@NotBlank(message="Please enter description for the card.")
	private String description;
	
	@Column(name="annual_fee")
	@Min(value=0, message="Annual fee must be positive number.")
	@NotNull(message="Please enter annual fee for the card.")
	private double annualFee;
	
	@Column(name="interest_rate")
	@NotNull(message="Please enter interest rate for the card.")
	@Min(value=0, message="Interest rate must be positive number.")
	@Max(value=100, message="Interest rate must be less than 100.")
	private double interestRate;

	@Column(name="min_income")
	@Min(value=0, message="Minimum income amount must be positive number.")
	@NotNull(message="Please enter minimum required income amount for the card.")
	private double minIncome;
	
	@Lob
	@Column(name = "thumbnail", columnDefinition="MEDIUMBLOB")
	@NotNull(message="Please upload thumbnail image for the card.")
	@Size(min=1, max=5242880, message="Please upload thumbnail image for the card.(Max 5MB)")
	private byte[] thumbnail;
	
	@Column(name="is_deleted", nullable = false, columnDefinition = "TINYINT(1) default 0")
	private boolean isDeleted;
	
	@OneToMany(mappedBy="creditCard", cascade = {CascadeType.MERGE})
	private Set<CustCreditCard> custCreditCards;
	
	@OneToMany(cascade= {CascadeType.MERGE}, mappedBy="creditCard")
	private Set<CreditCardApplication> creditCardApplication;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public double getAnnualFee() {
		return annualFee;
	}

	public void setAnnualFee(double annualFee) {
		this.annualFee = annualFee;
	}

	public double getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(double interestRate) {
		this.interestRate = interestRate;
	}

	public double getMinIncome() {
		return minIncome;
	}

	public void setMinIncome(double minIncome) {
		this.minIncome = minIncome;
	}

	public byte[] getThumbnail() {
		return thumbnail;
	}
	
	public String getBase64Thumbnail() {
		return FileUtils.toBase64(thumbnail);
	}

	public void setThumbnail(byte[] thumbnail) {
		this.thumbnail = thumbnail;
	}

	public boolean isDeleted() {
		return isDeleted;
	}

	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}
	
	public Set<CustCreditCard> getCustCreditCards() {
		return custCreditCards;
	}

	public void setCustCreditCards(Set<CustCreditCard> custCreditCards) {
		this.custCreditCards = custCreditCards;
	}

	public Set<CreditCardApplication> getCreditCardApplication() {
		return creditCardApplication;
	}

	public void setCreditCardApplication(Set<CreditCardApplication> creditCardApplication) {
		this.creditCardApplication = creditCardApplication;
	}

	public CreditCard() {
		
	}
	
	public CreditCard(int id, @NotBlank(message = "Please enter title for the card.") String title,
			@NotBlank(message = "Please enter description for the card.") String description,
			@Min(value = 0, message = "Annual fee must be positive number.") @NotNull(message = "Please enter annual fee for the card.") double annualFee,
			@NotNull(message = "Please enter interest rate for the card.") @Min(value = 0, message = "Interest rate must be positive number.") @Max(value = 100, message = "Interest rate must be less than 100.") double interestRate,
			@Min(value = 0, message = "Minimum income amount must be positive number.") @NotNull(message = "Please enter minimum required income amount for the card.") double minIncome,
			@NotNull(message = "Please upload thumbnail image for the card.") @Size(min = 1, max = 5242880, message = "Please upload thumbnail image for the card.(Max 5MB)") byte[] thumbnail,
			boolean isDeleted, Set<CustCreditCard> custCreditCards) {
		super();
		this.id = id;
		this.title = title;
		this.description = description;
		this.annualFee = annualFee;
		this.interestRate = interestRate;
		this.minIncome = minIncome;
		this.thumbnail = thumbnail;
		this.isDeleted = isDeleted;
		this.custCreditCards = custCreditCards;
	}

	@Override
	public String toString() {
		return "CardType [id=" + id + ", title=" + title + ", description=" + description
				+ ", annualFee=" + annualFee + ", interestRate=" + interestRate + ", minIncome=" + minIncome
				+ ", isDeleted=" + isDeleted + "]";
	}
}