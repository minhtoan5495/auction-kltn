package hvcntt.org.shoppingweb.controller;

import hvcntt.org.shoppingweb.service.CityService;
import hvcntt.org.shoppingweb.service.DistrictService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;

/**
 * Created by toannguyen on 24/04/2017.
 */
@Controller
public class AddressController {

    @Autowired
    DistrictService districtService;

    @Autowired
    CityService cityService;

}
