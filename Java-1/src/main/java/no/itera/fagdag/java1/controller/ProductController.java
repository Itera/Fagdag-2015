package no.itera.fagdag.java1.controller;

import no.itera.fagdag.java1.model.Product;
import no.itera.fagdag.java1.service.ProductService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletResponse;
import java.util.List;

/**
 * Created by annieaa on 23/01/15.
 */

@Controller
@RequestMapping(value = "/api")
public class ProductController {

    private static Logger log = LoggerFactory.getLogger(ProductController.class);
    // Pathvars
    public final static String PRODUCT_ID_PATHVAR = "productId";
    // Paths
    public final static String PRODUCTS_PATH = "/products";
    public final static String PRODUCT_PATH = PRODUCTS_PATH + "/{" + PRODUCT_ID_PATHVAR + "}";

    @Autowired
    ProductService productService;

    @ResponseBody
    @RequestMapping(value=PRODUCTS_PATH, method= RequestMethod.GET)
    public List<Product> getProducts() {
        log.info("ProductController getProducts()");
        return productService.getProducts();
    }

    /*
    @ResponseBody
    @RequestMapping(value=PRODUCT_PATH, method= RequestMethod.GET)
    public Product getProductById(@PathVariable long id) {
        log.info("ProductController getProductById(id)");
        return productService.getProductById(id);
    }*/

    @ResponseBody
    @RequestMapping(value=PRODUCT_PATH, method= RequestMethod.GET)
    public Product getProductByProductId(@PathVariable long productId) {
        log.info("ProductController getProductByProductId(productId)");
        return productService.getProductByProductId(productId);
    }

    @ResponseBody
    @RequestMapping(value=PRODUCTS_PATH, method=RequestMethod.POST)
    public Product createProduct(@RequestBody Product product,
                                   HttpServletResponse response) {
        log.info("ProductController createProduct(product)");
        return productService.createProduct(product);
    }

    @ResponseBody
    @RequestMapping(value=PRODUCT_PATH, method=RequestMethod.DELETE)
    public void deleteProduct(@PathVariable long id) {
        log.info("ProductController deleteProduct(id)");
        productService.deleteProduct(id);
    }

    @ResponseBody
    @RequestMapping(value=PRODUCT_PATH, method=RequestMethod.PUT)
    public Product updateOrder(@RequestBody Product product,
                                   @PathVariable long id) {
        log.info("ProductController updateProduct(product, id)");
        return productService.updateProduct(product, id);
    }




}
