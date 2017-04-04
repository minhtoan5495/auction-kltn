package hvcntt.org.shoppingweb.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import hvcntt.org.shoppingweb.model.UploadFile;

public interface UploadFileRepository extends JpaRepository<UploadFile, Long> {

}
