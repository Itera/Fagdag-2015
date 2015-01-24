package no.itera.fagdag.java1.service;

import java.util.Date;
import java.util.List;

import no.itera.fagdag.java1.model.OrderHeader;
import no.itera.fagdag.java1.model.OrderLine;
import no.itera.fagdag.java1.model.OrderStatus;
import no.itera.fagdag.java1.repo.OrderLineRepo;
import no.itera.fagdag.java1.repo.OrderRepo;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class OrderService {
	
	@Autowired
	OrderRepo orderRepo;
	@Autowired
	OrderLineRepo orderLineRepo;

	public OrderHeader createOrder(OrderHeader orderHeader) {
		orderHeader.setOrderStatus(OrderStatus.Created.getName());
		orderHeader.setOrderDate(new Date());
		orderHeader = orderRepo.save(orderHeader);
		return orderHeader;
	}
	
	public List<OrderHeader> getOrders() {
		return orderRepo.findAll();
	}

	public void deleteOrder(long orderId) {
		orderRepo.delete(orderId);
	}

	public OrderHeader getOrderById(long orderId) {
		return orderRepo.findOne(orderId);
	}

	public OrderHeader updateOrder(OrderHeader orderHeader) {
		OrderStatus orderStatus = OrderStatus.fromName(orderHeader.getOrderStatus());
		if (orderStatus == null) {
			throw new IllegalArgumentException("Incorrect order status");
		}
		orderHeader = orderRepo.save(orderHeader);
		return orderHeader;
	}

	public OrderLine createOrderLine(OrderLine orderLine, long orderId) {
		OrderHeader orderHeader = orderRepo.findOne(orderId);
		orderLine = orderLineRepo.save(orderLine);
		orderHeader.getOrderLines().add(orderLine);
		orderRepo.save(orderHeader);
		return orderLine;
	}

	/*
	public List<OrderLine> getOrderLines(long id) {
		return orderRepo.findOne(id).getOrderLines();
	}*/
}
