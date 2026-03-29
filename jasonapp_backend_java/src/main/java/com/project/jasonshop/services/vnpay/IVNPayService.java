package com.project.jasonshop.services.vnpay;

import com.project.jasonshop.dtos.payment.PaymentDTO;
import com.project.jasonshop.dtos.payment.PaymentQueryDTO;
import com.project.jasonshop.dtos.payment.PaymentRefundDTO;
import jakarta.servlet.http.HttpServletRequest;

import java.io.IOException;

public interface IVNPayService {
    String createPaymentUrl(PaymentDTO paymentRequest, HttpServletRequest request);
    String queryTransaction(PaymentQueryDTO paymentQueryDTO, HttpServletRequest request) throws IOException;
    String refundTransaction(PaymentRefundDTO refundDTO) throws IOException;
}
