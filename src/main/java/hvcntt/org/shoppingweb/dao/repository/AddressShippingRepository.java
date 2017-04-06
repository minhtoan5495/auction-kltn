package hvcntt.org.shoppingweb.dao.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hvcntt.org.shoppingweb.dao.entity.ShippingInfor;

public interface AddressShippingRepository extends JpaRepository<ShippingInfor, String> {

}
