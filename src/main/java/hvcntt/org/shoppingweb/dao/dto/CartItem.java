package hvcntt.org.shoppingweb.dao.dto;

import hvcntt.org.shoppingweb.dao.entity.Image;
import hvcntt.org.shoppingweb.dao.entity.Product;

public class CartItem {

    private Image image;

    private int quantity;

    private Product product;

    public CartItem() {
    }

    public CartItem(int quantity, Product product, Image image) {
        super();
        this.quantity = quantity;
        this.product = product;
        this.image = image;
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

    public Image getImage() {
        return image;
    }

    public void setImage(Image image) {
        this.image = image;
    }
}
