package hvcntt.org.shoppingweb.dao.entity;

import com.fasterxml.jackson.annotation.JsonManagedReference;

import java.io.Serializable;
import javax.persistence.*;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "supplier")
@NamedQuery(name = "Supplier.findAll", query = "SELECT s FROM Supplier s")
public class Supplier implements Serializable {
    private static final long serialVersionUID = 3069622884326217400L;

    @Id
    @Column(name = "supplier_id")
    private String supplierId;

    @Column(name = "supplier_name")
    private String supplierName;

    @OneToMany(mappedBy = "supplier", fetch = FetchType.EAGER, cascade = CascadeType.ALL)
    @JsonManagedReference
    private List<Product> products;

    @Column(name = "logo")
    private String logo;

    public Supplier() {
        setSupplierId(UUID.randomUUID().toString());
    }

    public String getSupplierId() {
        return this.supplierId;
    }

    public void setSupplierId(String supplierId) {
        this.supplierId = supplierId;
    }

    public String getSupplierName() {
        return this.supplierName;
    }

    public void setSupplierName(String supplierName) {
        this.supplierName = supplierName;
    }

    public List<Product> getProducts() {
        return this.products;
    }

    public void setProducts(List<Product> products) {
        this.products = products;
    }

    public Product addProduct(Product product) {
        getProducts().add(product);
        product.setSupplier(this);

        return product;
    }

    public Product removeProduct(Product product) {
        getProducts().remove(product);
        product.setSupplier(null);

        return product;
    }

    public String getLogo() {
        return logo;
    }

    public void setLogo(String logo) {
        this.logo = logo;
    }

}