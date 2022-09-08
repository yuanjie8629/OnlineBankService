package com.generator;

import java.io.Serializable;
import java.util.Random;

import javax.persistence.Query;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

import com.bean.AccountApplication;
import com.bean.CreditCardApplication;
import com.bean.LoanApplication;

public class ApplicationNumGenerator implements IdentifierGenerator{

	@Override
	public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
		String prefix = "";
		String table = "";
		if (object instanceof AccountApplication) {
			prefix = "A";
			table = "AccountApplication";
		} else if (object instanceof CreditCardApplication) {
			prefix = "C";
			table = "CreditCardApplication";
		} else if (object instanceof LoanApplication) {
			prefix="L";
			table = "LoanApplication";
		}
		
		int count = 0;
		String id = null;
		do {
			id = this.generateID(prefix);
			Query query = session.createQuery("select count(*) from " + table + " a where a.id = :id");
			query.setParameter("id", id);
			count = ((Long) query.getSingleResult()).intValue();
		} while(count > 0);
		
		return id;
	}
	
	public String generateID(String prefix) {
		Random rand = new Random();
		
		// Generate random 10 digits
		long drand = (long)(rand.nextDouble() * 10000000000L);
		return prefix + Long.toString(drand);
	}

}
