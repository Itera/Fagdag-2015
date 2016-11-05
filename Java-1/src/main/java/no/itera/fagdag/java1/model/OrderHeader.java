package no.itera.fagdag.java1.model;

import javax.persistence.*;
import java.util.Date;
import java.util.List;

@Entity
@Table(name = "orders")
public class OrderHeader {
	@Id
    @Column(name = "id")
	@GeneratedValue(strategy = GenerationType.SEQUENCE)
	private long id;
	@Column(name = "order_status")
	private String orderStatus;
	@Column(name = "order_date")
	private Date orderDate;
	@Column(name = "finish_date")
	private Date finishDate;

	@OneToMany(mappedBy="orderHeader", fetch = FetchType.EAGER)
	private List<OrderLine> orderLines;
	
	public long getId() {
		return id;
	}

	public void setId(long id) {
		this.id = id;
	}

	public String getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Date getOrderDate() {
		return orderDate;
	}

	public void setOrderDate(Date orderDate) {
		this.orderDate = orderDate;
	}

	public Date getFinishDate() {
		return finishDate;
	}

	public void setFinishDate(Date finishDate) {
		this.finishDate = finishDate;
	}

	public List<OrderLine> getOrderLines() {
		return orderLines;
	}

	public void setOrderLines(List<OrderLine> orderLines) {
		this.orderLines = orderLines;
	}

	public void addOrderLine(OrderLine orderLine) {
		orderLines.add(orderLine);
	}

}
