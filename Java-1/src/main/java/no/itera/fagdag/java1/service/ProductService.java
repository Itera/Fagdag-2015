package no.itera.fagdag.java1.service;

import no.itera.fagdag.java1.model.Product;
import no.itera.fagdag.java1.repo.ProductRepo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

/**
 * Created by annieaa on 23/01/15.
 */
@Service
public class ProductService {

    @Autowired
    ProductRepo productRepo;

    public List<Product> getProducts() {
        return productRepo.findAll();
    }

    public Product getProductById(long id) {
        return productRepo.findOne(id);
    }

    public Product getProductByProductId(long productId) {
        return productRepo.findByProductId(productId);
    }

    public Product createProduct(Product product) {
        return productRepo.save(product);
    }

    public void deleteProduct(long id) {
        productRepo.delete(id);
    }

    public void deleteProductByProductId(long productId) {
        productRepo.deleteByProductId(productId);
    }

    public Product updateProduct(Product product, long id) {
        productRepo.delete(id);
        product = productRepo.save(product);
        return product;
    }



}
