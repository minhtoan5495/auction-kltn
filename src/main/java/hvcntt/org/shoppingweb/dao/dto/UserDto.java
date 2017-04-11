package hvcntt.org.shoppingweb.dao.dto;


import hvcntt.org.shoppingweb.validator.Email;
import hvcntt.org.shoppingweb.validator.Phone;
import org.hibernate.validator.constraints.NotBlank;

import javax.persistence.Transient;
import java.io.Serializable;
import java.util.Date;

public class UserDto implements Serializable {

    private static final long serialVersionUID = 7907931692605937196L;

    @NotBlank
    private String address;

    private String passwordConfirm;

    @Email
    private String email;

    @NotBlank
    private Date birthday;

    @NotBlank
    private String password;

    @Phone
    private String phone;

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    @Transient
    public String getPasswordConfirm() {
        return passwordConfirm;
    }

    public void setPasswordConfirm(String passwordConfirm) {
        this.passwordConfirm = passwordConfirm;
    }

    public UserDto() {
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public UserDto(String address, Date birthday, String email, String password, String phone, String username, String confirmPassword) {
        this.address = address;
        this.birthday = birthday;
        this.email = email;
        this.password = password;
        this.phone = phone;
        this.username = username;
        this.confirmPassword = confirmPassword;
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

    public String getConfirmPassword() {
        return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {
        this.confirmPassword = confirmPassword;
    }

    private String username;

    private String confirmPassword;

}
