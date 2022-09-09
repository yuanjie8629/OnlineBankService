package com.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.annotation.CardNum;
import com.bean.CustCard;
import com.dao.CustCardDao;


@Component
public class CardNumValidator implements ConstraintValidator<CardNum, String>{
	@Autowired
	CustCardDao custCardDao;
	
	@Override
	public boolean isValid(String cardNum, ConstraintValidatorContext cvc) {
		return custCardDao.checkCardByCardNum(cardNum);
	}
}
