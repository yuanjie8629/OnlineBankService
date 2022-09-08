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
@Table(name="loan")
public class Loan {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@NotBlank(message="Please select loan type.")
	private String type;
	
	@NotBlank(message="Please enter title for the loan.")
	private String title;
	
	@NotBlank(message="Please enter description for the loan.")
	private String description;
	
	@Column(name="interest_rate")
	@NotNull(message="Please enter interest rate for the loan.")
	@Min(value=0, message="Interest rate must be positive number.")
	@Max(value=100, message="Interest rate must be less than 100.")
	private double interestRate;
	
	@Min(value=0, message="Down Payment must be positive number.")
	@NotNull(message="Please enter the required down payment in percentage for the loan.")
	private double downpayment;
	
	@Lob
	@Column(name = "thumbnail", columnDefinition="MEDIUMBLOB")
	@NotNull(message="Please upload thumbnail image for the loan.")
	@Size(min=1, max=5242880, message="Please upload thumbnail image for the card.(Max 5MB)")
	private byte[] thumbnail;
	
	@Column(name="is_deleted", nullable = false, columnDefinition = "TINYINT(1) default 0")
	private boolean isDeleted;
	
	@OneToMany(mappedBy="loan", cascade = { CascadeType.MERGE })
	private Set<CustLoan> custLoans;
	
	@OneToMany(mappedBy="loan", cascade = { CascadeType.MERGE })
	private Set<LoanApplication> loanApplications;
	
	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
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

	public double getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(double interestRate) {
		this.interestRate = interestRate;
	}

	public double getDownpayment() {
		return downpayment;
	}

	public void setDownpayment(double downpayment) {
		this.downpayment = downpayment;
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
	
	public Set<CustLoan> getCustLoans() {
		return custLoans;
	}

	public void setCustLoans(Set<CustLoan> custLoans) {
		this.custLoans = custLoans;
	}

	public Set<LoanApplication> getLoanApplications() {
		return loanApplications;
	}

	public void setLoanApplications(Set<LoanApplication> loanApplications) {
		this.loanApplications = loanApplications;
	}

	public Loan() {
		
	}

	public Loan(int id, @NotBlank(message = "Please select loan type.") String type,
			@NotBlank(message = "Please enter title for the loan.") String title,
			@NotBlank(message = "Please enter description for the loan.") String description,
			@NotNull(message = "Please enter interest rate for the loan.") @Min(value = 0, message = "Interest rate must be positive number.") @Max(value = 100, message = "Interest rate must be less than 100.") double interestRate,
			@Min(value = 0, message = "Down Payment must be positive number.") @NotNull(message = "Please enter the required down payment in percentage for the loan.") double downpayment,
			@NotNull(message = "Please upload thumbnail image for the loan.") @Size(min = 1, max = 5242880, message = "Please upload thumbnail image for the card.(Max 5MB)") byte[] thumbnail,
			boolean isDeleted, Set<CustLoan> custLoans) {
		this.id = id;
		this.type = type;
		this.title = title;
		this.description = description;
		this.interestRate = interestRate;
		this.downpayment = downpayment;
		this.thumbnail = thumbnail;
		this.isDeleted = isDeleted;
		this.custLoans = custLoans;
	}

	@Override
	public String toString() {
		return "LoanType [id=" + id + ", type=" + type + ", title=" + title + ", description=" + description
				+ ", interestRate=" + interestRate + ", downpayment=" + downpayment + ", isDeleted=" + isDeleted + "]";
	}
}
