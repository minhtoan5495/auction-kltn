package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.entity.TransactionType;
import hvcntt.org.shoppingweb.dao.repository.TransactionTypeRepository;
import hvcntt.org.shoppingweb.service.TransactionTypeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class TransactionTypeServiceImpl implements TransactionTypeService {
	@Autowired
	TransactionTypeRepository transactionRepo;
	@Override
	public TransactionType findByName(String name) {
		// TODO Auto-generated method stub
		return transactionRepo.findByTransactionTypeName(name);
	}

}
