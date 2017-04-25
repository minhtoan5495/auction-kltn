package hvcntt.org.shoppingweb.service.impl;

import hvcntt.org.shoppingweb.dao.entity.TransactionType;
import hvcntt.org.shoppingweb.dao.repository.TransactionTypeRepository;
import hvcntt.org.shoppingweb.service.TransactionTypeService;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TransactionTypeServiceImpl implements TransactionTypeService {

	@Autowired
	TransactionTypeRepository transactionTypeRepository;

	@Override
	public TransactionType findByName(String name) {
		return transactionTypeRepository.findByTransactionTypeName(name);
	}

	@Override
	public List<TransactionType> getAll() {
		return transactionTypeRepository.findAll();
	}

}
