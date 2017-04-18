package hvcntt.org.shoppingweb.validator;

import javax.validation.ConstraintValidator;
import javax.validation.ConstraintValidatorContext;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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
        Pattern pattern = Pattern.compile("^[A-Z0-9._%+-]+@[A-Z0-9.-]+\\.[A-Z]{2,6}$");
        Matcher matcher = pattern.matcher(emailStr);
        if(matcher.matches()) return false;
        else return true;
    }
}
