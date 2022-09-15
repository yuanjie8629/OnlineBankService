package com.bean;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;
import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

@Entity
@Table(name="feedback")
public class Feedback {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@NotBlank(message="Please enter your full name.")
	private String name;
	
	@Column(name="contact_no")
	@NotBlank(message="Please enter valid phone number.")
	private String contactNo;
	
	@NotBlank(message="Please select the type of feedback.")
	private String type;
	
	@NotBlank(message="Please enter email.")
	@Email(message="Please enter valid email.")
	private String email;
	
	@Column(name="message", columnDefinition="text")
	@NotBlank(message="Please enter your message to us.")
	private String message;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getContactNo() {
		return contactNo;
	}

	public void setContactNo(String contactNo) {
		this.contactNo = contactNo;
	}

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public Feedback() {
		
	}

	public Feedback(int id, @NotBlank(message = "Please enter your full name.") String name,
			@Pattern(regexp = "^[689]\\d{7}$", message = "Please enter valid Singapore phone number.") String contactNo,
			@NotBlank(message = "Please select the type of feedback.") String type,
			@NotBlank(message = "Please enter email.") @Email(message = "Please enter valid email.") String email,
			@NotBlank(message = "Please enter your message to us.") String message) {
		super();
		this.id = id;
		this.name = name;
		this.contactNo = contactNo;
		this.type = type;
		this.email = email;
		this.message = message;
	}
}
