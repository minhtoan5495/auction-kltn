package hvcntt.org.shoppingweb.dao.dto;

public class CartItem {

	private int idcartitem;

	private int quantity;

	private float totalprice;

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
	
	public int getIdcartitem() {
		return idcartitem;
	}
	public void setIdcartitem(int idcartitem) {
		this.idcartitem = idcartitem;
	}
	public float getTotalprice() {
		return totalprice;
	}
	public void setTotalprice(float totalprice) {
		this.totalprice = totalprice;
	}
	@Override
	public String toString() {
		return "CartItem [idcartitem=" + idcartitem + ", quantity=" + quantity + ", totalprice=" + totalprice
				+ ", product=" + product + "]";
	}
	
	
}
