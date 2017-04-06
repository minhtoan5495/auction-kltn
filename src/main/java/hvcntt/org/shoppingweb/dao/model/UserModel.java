package hvcntt.org.shoppingweb.dao.model;


import java.io.Serializable;
import java.util.Date;

public class UserModel implements Serializable {

    private static final long serialVersionUID = 7907931692605937196L;

    private String address;

    private Date birthday;

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    private String email;

    public UserModel() {
    }

    private String password;

    private String phone;

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public UserModel(String address, Date birthday, String email, String password, String phone, String username, String confirmPassword) {
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
