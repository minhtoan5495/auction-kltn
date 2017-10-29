package hvcntt.org.shoppingweb.dao.dto;

import hvcntt.org.shoppingweb.validator.Email;
import hvcntt.org.shoppingweb.validator.Phone;

import javax.persistence.Transient;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

public class ProfileDto implements Serializable{

    private static final long serialVersionUID = -2327723362419116278L;

    @Size(min = 3, max = 30)
    private String name;

    @Phone
    private String phone;

    private String address;

    private String cityId;

    private String districtId;

    private Date birthday;

    public ProfileDto() {
    }

    public ProfileDto(String name, String phone, String address, String cityId, String districtId, Date birthday) {
        this.name = name;
        this.phone = phone;
        this.address = address;
        this.cityId = cityId;
        this.districtId = districtId;
        this.birthday = birthday;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getCityId() {
        return cityId;
    }

    public void setCityId(String cityId) {
        this.cityId = cityId;
    }

    public String getDistrictId() {
        return districtId;
    }

    public void setDistrictId(String districtId) {
        this.districtId = districtId;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }


}
