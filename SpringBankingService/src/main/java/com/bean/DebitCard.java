package com.bean;

import javax.persistence.Entity;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.PrimaryKeyJoinColumn;
import javax.persistence.Table;

@Entity
@Table(name="debit_card")
@PrimaryKeyJoinColumn(name="card_num")  
public class DebitCard extends Card {
	@ManyToOne()
	@JoinColumn(name="accNum")
	private Account account;
}
