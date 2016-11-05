package no.itera.fagdag.java1.repo;

import no.itera.fagdag.java1.model.OrderLine;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by annieaa on 23/01/15.
 */
public interface OrderLineRepo extends JpaRepository<OrderLine, Long> {


}
