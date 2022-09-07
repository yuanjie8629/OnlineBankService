package com.bean;

import java.util.List;

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
@Table(name="account")
public class Account {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@NotBlank(message="Please enter title for the account.")
	private String title;
	
	@NotBlank(message="Please select account type.")
	private String type;
	
	@NotBlank(message="Please enter description for the account.")
	private String description;
	
	@Lob
	@Column(name = "thumbnail", columnDefinition="MEDIUMBLOB")
	@NotNull(message="Please upload thumbnail image for the account.")
	@Size(min=1, max=5242880, message="Please upload thumbnail image for the account.(Max 5MB)")
	private byte[] thumbnail;
	
	@Column(name="interest_rate")
	@NotNull(message="Please enter interest rate for the account.")
	@Min(value=0, message="Interest rate must be positive number.")
	@Max(value=100, message="Interest rate must be less than 100.")
	private double interestRate;
	
	@Column(name="min_amount")
	@Min(value=0, message="Minimum deposit amount must be positive number.")
	@NotNull(message="Please enter minimum deposit amount for the account.")
	private double minAmount;

	@OneToMany(mappedBy="account", cascade = CascadeType.ALL)
	private List<CustAccount> custAccounts;
	
	@Column(name="is_deleted", nullable = false, columnDefinition = "TINYINT(1) default 0")
	private boolean isDeleted;

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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getDescription() {
		return description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public byte[] getThumbnail() {
		return thumbnail;
	}

	public void setThumbnail(byte[] thumbnail) {
		this.thumbnail = thumbnail;
	}
	
	public String getBase64Thumbnail() {
		return FileUtils.toBase64(thumbnail);
	}

	public double getInterestRate() {
		return interestRate;
	}

	public void setInterestRate(double interestRate) {
		this.interestRate = interestRate;
	}

	public double getMinAmount() {
		return minAmount;
	}

	public void setMinAmount(double minAmount) {
		this.minAmount = minAmount;
	}

	public List<CustAccount> getAccount() {
		return custAccounts;
	}

	public void setAccount(List<CustAccount> custAccounts) {
		this.custAccounts = custAccounts;
	}

	public boolean isDeleted() {
		return isDeleted;
	}

	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}
	
	public Account() {
		
	}

	public Account(int id, @NotBlank(message = "Please enter title for the account.") String title,
			@NotBlank(message = "Please select account type.") String type,
			@NotBlank(message = "Please enter description for the account.") String description,
			@NotNull(message = "Please upload thumbnail image for the account.") @Size(min = 1, max = 5242880, message = "Please upload thumbnail image for the account.(Max 5MB)") byte[] thumbnail,
			@NotNull(message = "Please enter interest rate for the account.") @Min(value = 0, message = "Interest rate must be positive number.") @Max(value = 100, message = "Interest rate must be less than 100.") double interestRate,
			@Min(value = 0, message = "Minimum deposit amount must be positive number.") @NotNull(message = "Please enter minimum deposit amount for the account.") double minAmount,
			List<CustAccount> custAccounts, boolean isDeleted) {
		super();
		this.id = id;
		this.title = title;
		this.type = type;
		this.description = description;
		this.thumbnail = thumbnail;
		this.interestRate = interestRate;
		this.minAmount = minAmount;
		this.custAccounts = custAccounts;
		this.isDeleted = isDeleted;
	}

	@Override
	public String toString() {
		final int maxLen = 10;
		return "AccountType [id=" + id + ", title=" + title + ", type=" + type + ", description=" + description
				+ ", interestRate=" + interestRate + ", minAmount=" + minAmount + ", account="
				+ (custAccounts != null ? custAccounts.subList(0, Math.min(custAccounts.size(), maxLen)) : null) + ", isDeleted="
				+ isDeleted + "]";
	}
}
