package com.annotation;

import java.lang.annotation.ElementType;  
import java.lang.annotation.Retention;  
import java.lang.annotation.RetentionPolicy;  
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.validator.CustIdentityNumValidator;

@Constraint(validatedBy = CustIdentityNumValidator.class)
@Target({ ElementType.METHOD, ElementType.FIELD })
@Retention(RetentionPolicy.RUNTIME)
public @interface IdentityNum {
	
	public String message() default "Duplicate Identity Numbert found.";
	
	public Class<?>[] groups() default {};
	
	public Class<? extends Payload>[] payload() default {};
}