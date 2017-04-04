package hvcntt.org.shoppingweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hvcntt.org.shoppingweb.model.ShippingInfor;

public interface AddressShippingRepository extends JpaRepository<ShippingInfor, String> {

}
