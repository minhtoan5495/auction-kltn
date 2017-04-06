package hvcntt.org.shoppingweb.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;

/**
 * Created by toannguyen on 06/04/17.
 */
public class EmailValidator implements ConstraintValidator<Email, String>{
    @Override
    public void initialize(Email paramA) {

    }

    @Override
    public boolean isValid(String emailStr, ConstraintValidatorContext ctx) {
        if (emailStr == null){
            return false;
        }

        //validate phone numbers of format "1234567890"
        if (emailStr.matches("^(0[1-9]|1[0-2])\\/(0[1-9]|1\\d|2\\d|3[01])\\/(19|20)\\d{2}$")) return true;

        else return false;
    }
}
