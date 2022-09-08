package com.generator;

import java.io.Serializable;
import java.util.Random;

import javax.persistence.Query;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

public class AccountNumGenerator implements IdentifierGenerator {
	@Override
	public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
		int count = 0;
		String accNo = null;
		do {
			accNo = this.generateID();
			Query query = session.createQuery("select count(*) from CustAccount a where a.accNo = :accNo");
			query.setParameter("accNo", accNo);
			count = ((Long) query.getSingleResult()).intValue();
		} while(count > 0);
		return accNo;
	}
	
	public String generateID() {
		Random rand = new Random();
		
		// Generate random 10 digits
		long drand = (long)(rand.nextDouble() * 10000000000L);
		return Long.toString(drand);
	}
}
