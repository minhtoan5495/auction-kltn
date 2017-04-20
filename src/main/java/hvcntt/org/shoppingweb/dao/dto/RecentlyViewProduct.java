package hvcntt.org.shoppingweb.dao.dto;

import hvcntt.org.shoppingweb.dao.entity.Product;

public class RecentlyViewProduct {
	private Product product;
	public RecentlyViewProduct() {
		
	}
	
	public RecentlyViewProduct(Product product) {
		super();
		this.product = product;
	}

	public Product getProduct() {
		return product;
	}
	public void setProduct(Product product) {
		this.product = product;
	}
	
}
