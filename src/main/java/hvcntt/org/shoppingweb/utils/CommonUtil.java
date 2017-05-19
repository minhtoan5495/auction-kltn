package hvcntt.org.shoppingweb.utils;

/**
 * Created by toannguyen on 19/05/2017.
 */

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class CommonUtil {
    private static final String MOBILE_NUMBER_PATTERN = "^[+]\\d{1,3}-\\d{7,15}";
    private static final String EMAIL_PATTERN = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@" + "[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";

    public static boolean validateEmail(final String email) {
        Pattern pattern = Pattern.compile(EMAIL_PATTERN);
        Matcher matcher = pattern.matcher(email);
        return matcher.matches();
    }

    public static boolean validatePhoneNumber(final String phoneNumber) {
        Pattern pattern = Pattern.compile(MOBILE_NUMBER_PATTERN);
        Matcher matcher = pattern.matcher(phoneNumber);
        boolean result = matcher.matches();
        return result;
    }

    public static String convertDateToString(Date date, String format) {
        if (date == null || date.toString().equals("")) {
            return "";
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat(format);
        String dateToString = dateFormat.format(date);
        return dateToString;
    }

}