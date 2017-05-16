package hvcntt.org.shoppingweb.validator;

import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import hvcntt.org.shoppingweb.dao.entity.UserAuction;

@Component
public class AuctionValidator implements Validator{

	@Override
	public boolean supports(Class<?> clazz) {
			return UserAuction.class.equals(clazz);
	}

	@Override
	public void validate(Object target, Errors errors) {
		UserAuction userAuction= (UserAuction) target;
		ValidationUtils.rejectIfEmptyOrWhitespace(errors, "price", "NotEmptyPrice");
		if(userAuction.getPrice()<userAuction.getAuction().getProduct().getPrice()){
			errors.rejectValue("price", "Size.AuctionForm.price");
		}
	}

}
