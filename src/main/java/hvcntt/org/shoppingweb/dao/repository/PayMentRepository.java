package hvcntt.org.shoppingweb.dao.repository;

import hvcntt.org.shoppingweb.dao.entity.InvoiceDetail;
import org.springframework.data.jpa.repository.JpaRepository;

public interface PayMentRepository extends JpaRepository<InvoiceDetail, String> {

}
