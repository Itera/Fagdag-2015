package no.itera.fagdag.java1.repo;

import no.itera.fagdag.java1.model.OrderHeader;

import org.springframework.data.jpa.repository.JpaRepository;

public interface OrderRepo extends JpaRepository<OrderHeader, Long>{

}
