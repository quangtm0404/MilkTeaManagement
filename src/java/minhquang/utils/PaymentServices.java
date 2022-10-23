package minhquang.utils;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author MinhQuang
 */
import java.util.*;
 
import com.paypal.api.payments.*;
import com.paypal.base.rest.*;
import minhquang.model.order.OrderDTO;
import minhquang.model.user.UserDTO;
 
public class PaymentServices {
    private static final String CLIENT_ID = "AZvMLlvmBX33-cOAQY3e2EsBuZpQQe5FLgicBrBR8X5wPqmLAHO728lEDISKYuar5Lhb8hFsjG62UwsN";
    private static final String CLIENT_SECRET = "EIWXxH60WINb1tYoH2cr3jkD4kri_JHs7X5RRvqzVMNMrCadZw2F0MRWLmWZ5TSQQANREhmhmJXnLZBl";
    private static final String MODE = "sandbox";
 
    public String authorizePayment(OrderDTO orderDetail, UserDTO loginUser)        
            throws PayPalRESTException {       
 
        Payer payer = getPayerInformation(loginUser);
        RedirectUrls redirectUrls = getRedirectURLs();
        List<Transaction> listTransaction = getTransactionInformation(orderDetail);
         
        Payment requestPayment = new Payment();
        requestPayment.setTransactions(listTransaction);
        requestPayment.setRedirectUrls(redirectUrls);
        requestPayment.setPayer(payer);
        requestPayment.setIntent("authorize");
 
        APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
 
        Payment approvedPayment = requestPayment.create(apiContext);
 
        return getApprovalLink(approvedPayment);
 
    }
     
    private Payer getPayerInformation(UserDTO loginUser) {
        Payer payer = new Payer();
    payer.setPaymentMethod("paypal");
     
    PayerInfo payerInfo = new PayerInfo();
    payerInfo
             .setLastName(loginUser.getName())
             .setEmail("sb-5px47t17408635@personal.example.com");
    
     
    payer.setPayerInfo(payerInfo);
     
    return payer;
    }
     
    private RedirectUrls getRedirectURLs() {
        RedirectUrls redirectUrls = new RedirectUrls();
    redirectUrls.setCancelUrl("http://localhost:8080/MilkTeaManagement/cancel.html");
    redirectUrls.setReturnUrl("http://localhost:8080/MilkTeaManagement/review_payment");
     
    return redirectUrls;
    }
     
    private List<Transaction> getTransactionInformation(OrderDTO orderDetail) {
        Details details = new Details();
        double usTotal = Math.ceil(orderDetail.getTotal() / 22000 * 100) / 100;
    details.setShipping(String.format("%.2f", 1.0));
    details.setSubtotal(String.format("%.2f", 1.0));
    details.setTax(String.format("%.2f", ((float)usTotal - (float)2 )));
 
    Amount amount = new Amount();
    amount.setCurrency("USD");
    amount.setTotal(String.format("%.2f", (float)usTotal));
    amount.setDetails(details);
 
    Transaction transaction = new Transaction();
    transaction.setAmount(amount);
    transaction.setDescription("TBTS Receipt");
     
    ItemList itemList = new ItemList();
    List<Item> items = new ArrayList<>();
     
    Item item = new Item();
    item.setCurrency("USD");
    item.setName("Tra Sua");
    item.setPrice(String.format("%.2f",(float)1));
    item.setTax(String.format("%.2f",((float)usTotal - (float)2)));
    item.setQuantity("1");
     
    items.add(item);
    itemList.setItems(items);
    transaction.setItemList(itemList);
 
    List<Transaction> listTransaction = new ArrayList<>();
    listTransaction.add(transaction);  
     
    return listTransaction;
    }
     
    private String getApprovalLink(Payment approvedPayment) {
        List<Links> links = approvedPayment.getLinks();
    String approvalLink = null;
     
    for (Links link : links) {
        if (link.getRel().equalsIgnoreCase("approval_url")) {
            approvalLink = link.getHref();
            break;
        }
    }      
     
    return approvalLink;
    }
    
    public Payment getPaymentDetails(String paymentId) throws PayPalRESTException {
		APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
		return Payment.get(apiContext, paymentId);
	}
    
    public Payment executePayment(String paymentId, String payerId)
        throws PayPalRESTException {
    PaymentExecution paymentExecution = new PaymentExecution();
    paymentExecution.setPayerId(payerId);
 
    Payment payment = new Payment().setId(paymentId);
 
    APIContext apiContext = new APIContext(CLIENT_ID, CLIENT_SECRET, MODE);
 
    return payment.execute(apiContext, paymentExecution);
}
}