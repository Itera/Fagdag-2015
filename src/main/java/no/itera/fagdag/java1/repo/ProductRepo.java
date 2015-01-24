package no.itera.fagdag.java1.repo;

import no.itera.fagdag.java1.model.Product;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 * Created by annieaa on 23/01/15.
 */
public interface ProductRepo extends JpaRepository<Product, Long> {

    public Product findByProductId(long productId);
    public void deleteByProductId(long productId);


}
