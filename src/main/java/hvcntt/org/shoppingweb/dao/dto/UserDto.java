package hvcntt.org.shoppingweb.dao.dto;


import hvcntt.org.shoppingweb.validator.Email;
import hvcntt.org.shoppingweb.validator.Phone;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Transient;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

public class UserDto implements Serializable {

    private static final long serialVersionUID = 7907931692605937196L;

    @Size(min = 3, max = 30)
    private String name;

    @Size(min = 6, max = 12)
    private String username;

    private String confirmPassword;

//    @Email
    private String email;

    @Size(max = 20, min = 6)
    private String password;

    @Phone
    private String phone;

    public UserDto() {
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public UserDto(String name, String username, String email, String password, String phone) {
        this.name = name;
        this.username = username;
        this.email = email;
        this.password = password;
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    @Transient
    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }
}
