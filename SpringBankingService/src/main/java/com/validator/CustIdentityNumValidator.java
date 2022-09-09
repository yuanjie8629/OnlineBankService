package com.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.annotation.IdentityNum;
import com.bean.Customer;
import com.dao.CustomerDao;

@Component
public class CustIdentityNumValidator implements ConstraintValidator<IdentityNum, String>{
	
	private CustomerDao custDao;
	
	public void setCustDao(CustomerDao custDao) {
		this.custDao = custDao;
	}
	
	public CustIdentityNumValidator() {
		
	}

	public CustIdentityNumValidator(CustomerDao custDao) {
		this.custDao = custDao;
	}

	@Override
	public boolean isValid(String identityNum, ConstraintValidatorContext cvc) {
		Customer cust = custDao.getCustomerByIdentityNum(identityNum);
		if (cust == null)
			return false;
		return true;
	}
}
