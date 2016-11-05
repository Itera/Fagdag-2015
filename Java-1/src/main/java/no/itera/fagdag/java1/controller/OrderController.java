package no.itera.fagdag.java1.controller;

import java.util.List;

import javax.servlet.http.HttpServletResponse;

import no.itera.fagdag.java1.model.OrderHeader;
import no.itera.fagdag.java1.model.OrderLine;
import no.itera.fagdag.java1.service.OrderService;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

@Controller
@RequestMapping(value = "/api")
public class OrderController {
	private static Logger log = LoggerFactory.getLogger(OrderController.class);
	// Pathvars
	public final static String ORDER_ID_PATHVAR = "orderId";
	public final static String ORDER_LINE_ID_PATHVAR = "orderLineId";
	// Paths
	public final static String ORDERS_PATH = "/orders";
	public final static String ORDER_PATH = ORDERS_PATH + "/{" + ORDER_ID_PATHVAR + "}";
	public final static String ORDER_LINES_PATH = ORDER_PATH + "/orderlines";
	public final static String ORDER_LINE_PATH = ORDER_LINES_PATH + "/{" + ORDER_LINE_ID_PATHVAR + "}";
	
	@Autowired
	OrderService orderService;
	
	@ResponseBody
	@RequestMapping(value=ORDERS_PATH, method=RequestMethod.GET)
	public List<OrderHeader> getOrders() {
		log.info("OrderController getOrders()");
		return orderService.getOrders();
	}

	@ResponseBody
	@RequestMapping(value=ORDER_PATH, method=RequestMethod.GET)
	public void getOrderById(@PathVariable long orderId) {
		log.info("OrderController getOrderById(id)");
		orderService.getOrderById(orderId);
	}
	
	@ResponseBody
	@RequestMapping(value=ORDERS_PATH, method=RequestMethod.POST)
	public OrderHeader createOrder(@RequestBody OrderHeader orderHeader,
								   HttpServletResponse response) {
		log.info("OrderController createOrder(orderHeader)");
		return orderService.createOrder(orderHeader);
	}

	@ResponseBody
	@RequestMapping(value=ORDER_LINE_PATH, method=RequestMethod.POST)
	public OrderLine createOrderLine(@RequestBody OrderLine orderLine,
									 @PathVariable long orderId,
								   HttpServletResponse response) {
		log.info("OrderController createOrderLine(orderLine)");
		return orderService.createOrderLine(orderLine, orderId);
	}

	@ResponseBody
	@RequestMapping(value=ORDER_PATH, method=RequestMethod.DELETE)
	public void deleteOrder(@PathVariable long orderId) {
		log.info("OrderController deleteOrder(id)");
		orderService.deleteOrder(orderId);
	}


	@ResponseBody
	@RequestMapping(value=ORDER_PATH, method=RequestMethod.PUT)
	public OrderHeader updateOrder(@RequestBody OrderHeader orderHeader,
								   HttpServletResponse response) {
		log.info("OrderController updateOrder(orderHeader)");
		try {
			return orderService.updateOrder(orderHeader);
		}
		catch (IllegalArgumentException iaex) {
			response.setStatus(400);
			return null;
		}
	}

	/*@ResponseBody
	@RequestMapping(value=ORDER_LINES_PATH, method=RequestMethod.GET)
	public List<OrderLine> getOrderLines(@PathVariable long id) {
		log.info("OrderController getOrders()");
		return orderService.getOrderLines(id);
	}*/










}
