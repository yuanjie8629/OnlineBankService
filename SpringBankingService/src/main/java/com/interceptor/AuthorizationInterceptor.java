package com.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.HandlerInterceptor;

import com.bean.Admin;
import com.bean.Customer;
import com.bean.User;

public class AuthorizationInterceptor implements HandlerInterceptor {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		User user = (User) request.getSession().getAttribute("user");
		String url = request.getRequestURI().toString();
		String splittedUrl = url.split("/")[2];
		if (splittedUrl.contains("admin") && !(user instanceof Admin) || splittedUrl.contains("customer") && !(user instanceof Customer)) {
			System.out.println("User Type: " + (user instanceof Admin ? "Admin" : user instanceof Customer ? "Customer" : "Null"));
			System.out.println("Access Denied to " + url + "\n");
			response.sendRedirect(request.getContextPath());
			return false;
		}
		return true;
	}
}
