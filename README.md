# Online Banking Service - Web Application
<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->
[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)
<!-- ALL-CONTRIBUTORS-BADGE:END -->

## Overview

This project entitled “Online Banking Service” is a web-based banking application for the bank user to apply for the banking services and conduct financial transactions via the Internet. There are a total of 3 services in this project: Account Service, Credit Card Service and Loan Service.

This site allows the admin (bank managers) to add new account, credit card and loan services launched by the bank so that the user can apply for these services. Besides, the admin can review and approve the user’s application for the banking services. Once the user’s application is approved, the user can register and log into the customer portal to perform financial transactions such as fund transfers and payments. Moreover, the admin can also manage the customer bank services such as deposits or withdraws money from the customers’ accounts, add new payments for the customers’ credit cards and loans as well as activate or deactivate the bank services.

## Features
The features can be divided by 3 modules, which are the user, admin and customer modules.

### User Module
1.	About Us <br>
    The user can view the bank’s story, services provided and the licenses and accreditations of the bank.

2.	Bank Services Application <br>
    The user can apply for bank services such as accounts, credit cards, loans. To apply the bank services, the user is required to fill out the form on the website.

3.	Track Application <br>
    The user can track their application status once they successfully applied for the bank services.

4.	Currency Converter Tool <br>
    The user can check the latest foreign exchange rates and compare the exchange rates between two countries.

5.	Contact Us <br>
    The user can locate the bank’s headquarters and submit their feedback to the bank.

6.	Login  <br>
    The user can login as admin or customer depending on the credentials they have entered.

7.	Register <br>
    The customer who is accessing the bank’s customer portal for the first time are required to register.

8.	Forgot Password <br>
    The customer who has forgotten their password can change their password by filling out the forgot password form.

### Admin Module

1.	Account Management <br>
    The admin can manage the account services of the bank. The admin can view, add, update and delete the account services. In addition, the users can view the accounts added by the admin so that they can proceed for account service application.

2.	Credit Card Management <br>
    The admin can manage the credit card services of the bank. The admin can view, add, update and delete the credit card services. In addition, the users can view the credit cards added by the admin so that they can proceed for credit card service application.

3.	Loan Management <br>
    The admin can manage the loan services of the bank. The admin can view, add, update and delete the loan services. In addition, the users can view the loans added by the admin so that they can proceed for loan service application.

4.	Application Management <br>
    The admin can manage the bank service applications submitted by the users. The admin can view the application forms which include the details of the user and the services they have applied for. Besides, the admin can approve, reject or require further action on the bank service application submitted by the users.

5.	Customer Management <br>
    The admin can manage the customers who have approved bank services. The admin can activate or deactivate the customer or their services. Besides, the admin can view all the transactions and payment history of the customer. The admin can also perform some actions on the customers’ accounts, credit cards, or loans, such as depositing or withdrawing money from a customer’s account, and adding payments on a credit card or loan.

6.	Profile Management <br>
    The admin can update their profile such as their name, email address, contact number and gender. Besides, the admin can also change their password.


### Customer Module

1.	Account <br>
    The customer can view all their accounts under the bank. Besides, the customer can also view the summary and the transaction history of the particular account.

2.	Credit Card <br>
    The customer can view all their credit cards under the bank. Besides, the customer can also view the summary and the transaction history of the particular credit card.

3.	Loan <br>
    The customer can view all their loans under the bank. Besides, the customer can also view the summary and the payment history of the particular loan.

4.	Fund Transfer <br>
    The customer can perform fund transfer. There are two options for the fund transfer, the customer can either choose to transfer to own account or transfer to other accounts under the same bank.

5.	Payment <br>
    The customer can view all the payment statements for their credit cards and loans. Besides, the customer can pay for their credit cards and loans with their accounts under the same bank.

6.	Profile Management <br>
    The customer can update their profile such as their name, email address, contact number and gender. Besides, the customer can also change their password.

## Tech Stack

-	Java 8
-	Spring Framework 5.1.1
-	Hibernate 5.3.1
-	JSP
-	JavaScript
-	CSS
-	Bootstrap 5
-	MySQL 8.0.30
-	Apache Tiles 3.0.5
-	Apache Tomcat 9.0


## System Design

### System Architecture

<img src="previews/SystemArchitecture.png"><br>

### Database Schema Design

<img src="previews/ERD.png"><br>

## Preview

### User Module

1. Home Page <br> <img src="previews/HomePage.jpeg"><br><br>
2. About Us <br> <img src="previews/AboutUs.jpeg"><br><br>
3. Contact Us <br> <img src="previews/ContactUs.jpeg"><br><br>
4. Account Service <br> <img src="previews/Account.jpeg"><br><br>
5. Account Application <br> <img src="previews/AccountApplication.jpeg"><br><br>
6. Credit Card Service <br> <img src="previews/CreditCard.jpeg"><br><br>
7. Credit Card Application <br> <img src="previews/CreditCardApplication.jpeg"><br><br>
8. Loan Service <br> <img src="previews/Loan.jpeg"><br><br>
9. Loan Application <br> <img src="previews/LoanApplication.jpeg"><br><br>
10. Track Application <br> <img src="previews/TrackApplication.jpeg"><br><br>
11. Login <br> <img src="previews/Login.jpeg"><br><br>
12. Register <br> <img src="previews/Register.jpeg"><br><br>
13. Forgot Password <br> <img src="previews/ForgotPass.jpeg"><br><br>

### Admin

1. Home Page <br> <img src="previews/AdminHomePage.jpeg"><br><br>
2. Account Management <br> <img src="previews/AdminAccountMgmt.jpeg"><br><br>
3. Card Management <br> <img src="previews/AdminCardMgmt.jpeg"><br><br>
4. Loan Management <br> <img src="previews/AdminLoanMgmt.jpeg"><br><br>
5. Customer Management <br> <img src="previews/AdminCustMgmt.jpeg"><br><br>
6. Customer Account Management <br> <img src="previews/AdminCustAccMgmt.jpeg"><br><br>
7. Customer Credit Card Management <br> <img src="previews/AdminCustCreditCardMgmt.jpeg"><br><br>
8. Customer Loan Management <br> <img src="previews/AdminCustLoanMgmt.jpeg"><br><br>
9. Account Application Management <br> <img src="previews/AdminAccAppMgmt.jpeg"><br><br>
10. Credit Card Application Management <br> <img src="previews/AdminCardAppMgmt.jpeg"><br><br>
11. Loan Application Management <br> <img src="previews/AdminLoanAppMgmt.jpeg"><br><br>
12. Profile Management <br> <img src="previews/AdminProfileMgmt.jpeg"><br><br>


### Customer

1. Home Page <br> <img src="previews/CustHomePage.jpeg"><br><br>
2. View Accounts <br> <img src="previews/CustViewAccounts.jpeg"><br><br>
3. View Account Summary <br> <img src="previews/CustAccSummary.jpeg"><br><br>
4. View Account Transactions <br> <img src="previews/CustAccTransaction.jpeg"><br><br>
5. View Credit Cards <br> <img src="previews/CustViewCreditCards.jpeg"><br><br>
6. View Credit Card Summary <br> <img src="previews/CustCardSummary.jpeg"><br><br>
7. View Credit Card Transactions <br> <img src="previews/CustCardTransaction.jpeg"><br><br>
8. View Loans <br> <img src="previews/CustViewLoans.jpeg"><br><br>
9. View Loan Summary <br> <img src="previews/CustLoanSummary.jpeg"><br><br>
10. Own Account Transfer <br> <img src="previews/CustOwnAccTransfer.jpeg"><br><br>
11. Transfer To Others <br> <img src="previews/CustTransferToOthers.jpeg"><br><br>
12. Credit Card Fund Transfer <br> <img src="previews/CustCreditCardTransfer.jpeg"><br><br>
13. Credit Card Payment <br> <img src="previews/CustCreditCardPayment.jpeg"><br><br>
14. Loan Payment <br> <img src="previews/CustLoanPayment.jpeg"><br><br>

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tbody>
    <tr>
      <td align="center"><a href="https://github.com/yuanjie8629"><img src="https://avatars.githubusercontent.com/u/86699785?v=4?s=100" width="100px;" alt=""/><br /><sub><b>Tan Yuan Jie</b></sub></a><br /><a href="#a11y-yuanjie8629" title="Accessibility">️️️️♿️</a> <a href="#question-yuanjie8629" title="Answering Questions">💬</a> <a href="https://github.com/yuanjie8629/OnlineBankingService/commits?author=yuanjie8629" title="Code">💻</a> <a href="#data-yuanjie8629" title="Data">🔣</a> <a href="#design-yuanjie8629" title="Design">🎨</a> <a href="https://github.com/yuanjie8629/OnlineBankingService/commits?author=yuanjie8629" title="Documentation">📖</a> <a href="#ideas-yuanjie8629" title="Ideas, Planning, & Feedback">🤔</a> <a href="#infra-yuanjie8629" title="Infrastructure (Hosting, Build-Tools, etc)">🚇</a> <a href="#maintenance-yuanjie8629" title="Maintenance">🚧</a> <a href="https://github.com/yuanjie8629/OnlineBankingService/pulls?q=is%3Apr+reviewed-by%3Ayuanjie8629" title="Reviewed Pull Requests">👀</a> <a href="#tool-yuanjie8629" title="Tools">🔧</a></td>
    </tr>
  </tbody>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!