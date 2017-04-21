package hvcntt.org.shoppingweb.dao.dto;

import hvcntt.org.shoppingweb.dao.entity.Product;

public class CartItem {

    private int quantity;

    private Product product;

    public CartItem() {
    }

    public CartItem(int quantity, Product product) {
        super();
        this.quantity = quantity;
        this.product = product;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public Product getProduct() {
        return product;
    }

    public void setProduct(Product product) {
        this.product = product;
    }
}
