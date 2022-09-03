package com.utils;

import java.io.Serializable;
import java.util.Random;

import javax.persistence.Query;

import org.hibernate.HibernateException;
import org.hibernate.engine.spi.SharedSessionContractImplementor;
import org.hibernate.id.IdentifierGenerator;

public class CardNumGenerator implements IdentifierGenerator {
	@Override
	public Serializable generate(SharedSessionContractImplementor session, Object object) throws HibernateException {
		int count = 0;
		String cardNum = null;
		do {
			cardNum = this.generateID();
			Query query = session.createQuery("select count(*) from Card c where c.cardNum = :cardNum");
			query.setParameter("cardNum", cardNum);
			count = (int) query.getSingleResult();
		} while(count > 0);
		return cardNum;
	}
	
	public String generateID() {
		Random rand = new Random();
		
		// Generate random 16 digits
		long drand = (long)(rand.nextDouble() * 10000000000000000L);
		return Long.toString(drand);
	}
}
