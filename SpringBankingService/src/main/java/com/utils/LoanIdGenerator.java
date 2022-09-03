package com.utils;

import java.io.Serializable;
import java.util.Random;

import javax.persistence.Query;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

public class LoanIdGenerator implements IdentifierGenerator{
	@Override
	public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
		int count = 0;
		String loanID = null;
		do {
			loanID = this.generateID();
			Query query = session.createQuery("select count(*) from Loan l where l.id = :loanID");
			query.setParameter("loanID", loanID);
			count = (int) query.getSingleResult();
		} while(count > 0);
		return loanID;
	}
	
	public String generateID() {
		Random rand = new Random();
		
		// Generate random 16 digits
		long drand = (long)(rand.nextDouble() * 10000000L);
		return "l" + Long.toString(drand);
	}
	
	
}
