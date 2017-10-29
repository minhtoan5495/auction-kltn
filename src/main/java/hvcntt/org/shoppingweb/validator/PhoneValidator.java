package hvcntt.org.shoppingweb.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

public class PhoneValidator implements ConstraintValidator<Phone,String>{
    @Override
    public void initialize(Phone paramA) {

    }

    @Override
    public boolean isValid(String phoneNo, ConstraintValidatorContext ctx) {
        if (phoneNo == null){
            return false;
        }

        //validate phone numbers of format "1234567890"
        if (phoneNo.matches("\\d{10,11}")) return true;
            //validating phone number with -, . or spaces
        else return false;
    }
}
