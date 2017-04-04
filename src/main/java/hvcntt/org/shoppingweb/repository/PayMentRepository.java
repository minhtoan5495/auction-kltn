package hvcntt.org.shoppingweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hvcntt.org.shoppingweb.model.Invoice_Detail;

public interface PayMentRepository extends JpaRepository<Invoice_Detail, String> {

}
