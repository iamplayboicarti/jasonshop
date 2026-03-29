package com.project.jasonshop.services.orders;

import com.project.jasonshop.dtos.OrderDTO;
import com.project.jasonshop.exceptions.DataNotFoundException;
import com.project.jasonshop.models.Order;
import com.project.jasonshop.responses.order.OrderResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface IOrderService {
    Order createOrder(OrderDTO orderDTO) throws Exception;
    Order getOrderById(Long orderId);
    Order updateOrder(Long id, OrderDTO orderDTO) throws DataNotFoundException;
    void deleteOrder(Long orderId);
    List<OrderResponse> findByUserId(Long userId);
    Page<Order> getOrdersByKeyword(String keyword, Pageable pageable);
    // Thêm phương thức cập nhật trạng thái đơn hàng
    Order updateOrderStatus(Long id, String status) throws DataNotFoundException;
}
