package hvcntt.org.shoppingweb.validator;

import hvcntt.org.shoppingweb.dao.dto.UserDto;
import hvcntt.org.shoppingweb.dao.entity.User;
import hvcntt.org.shoppingweb.exception.UserNotFoundException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.ValidationUtils;
import org.springframework.validation.Validator;

import hvcntt.org.shoppingweb.service.UserService;

@Component
public class UserValidator implements Validator {

	@Autowired
	UserService userService;

	public boolean supports(Class<?> aClass) {
        return User.class.equals(aClass);
    }

	public void validate(Object o, Errors errors) {
        UserDto userDto = (UserDto) o;
        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "username", "NotEmptyUsername");
        if (userDto.getUsername().length() < 6 || userDto.getUsername().length() > 32) {
            errors.rejectValue("username", "Size.userForm.username");
        }
        try {
            if (userService.findByUsername(userDto.getUsername()) != null) {
                errors.rejectValue("username", "Duplicate.userForm.username");
            }
        } catch (UserNotFoundException e) {
            e.getMessage();
        }

        if(userService.findByEmail(userDto.getEmail()) != null){
            errors.rejectValue("username", "Duplicate.userForm.email");
        }

        if(userService.findByPhone(userDto.getPhone()) != null){
            errors.rejectValue("username", "Duplicate.userForm.phone");
        }

        ValidationUtils.rejectIfEmptyOrWhitespace(errors, "password", "NotEmptyPassword");
        if (userDto.getPassword().length() < 8 || userDto.getPassword().length() > 32) {
            errors.rejectValue("password", "Size.userForm.password");
        }

        if (!userDto.getConfirmPassword().equals(userDto.getPassword())) {
            errors.rejectValue("passwordConfirm", "Diff.userForm.passwordConfirm");
        }
	}
}
