package com.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import javax.validation.Constraint;
import javax.validation.Payload;

import com.validator.CardNumValidator;

@Constraint(validatedBy = CardNumValidator.class)
@Target({ ElementType.METHOD, ElementType.FIELD, ElementType.PARAMETER })
@Retention(RetentionPolicy.RUNTIME)
public @interface CardNum {
	
	public String message() default "Duplicate Card Number found.";
	
	public Class<?>[] groups() default {};
	
	public Class<? extends Payload>[] payload() default {};
}