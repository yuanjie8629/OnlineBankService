package com.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;

import com.annotation.IdentityNum;
import com.bean.Customer;
import com.dao.CustomerDao;

public class CustIdentityNumValidator implements ConstraintValidator<IdentityNum, String>{

	@Autowired
	CustomerDao custDao;
	
	@Override
	public boolean isValid(String s, ConstraintValidatorContext cvc) {
		Customer cust = custDao.getCustomerByIdentityNum(s);
		if (cust == null)
			return false;
		return true;
	}
}
