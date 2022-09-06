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
@Table(name="account_type")
public class AccountType {
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

	@OneToMany(mappedBy="type", cascade = CascadeType.ALL)
	private List<Account> account;
	
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

	public List<Account> getAccount() {
		return account;
	}

	public void setAccount(List<Account> account) {
		this.account = account;
	}

	public boolean isDeleted() {
		return isDeleted;
	}

	public void setDeleted(boolean isDeleted) {
		this.isDeleted = isDeleted;
	}
	
	public AccountType() {
		
	}

	@Override
	public String toString() {
		final int maxLen = 10;
		return "AccountType [id=" + id + ", title=" + title + ", type=" + type + ", description=" + description
				+ ", interestRate=" + interestRate + ", minAmount=" + minAmount + ", account="
				+ (account != null ? account.subList(0, Math.min(account.size(), maxLen)) : null) + ", isDeleted="
				+ isDeleted + "]";
	}
}
