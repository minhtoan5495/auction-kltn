package hvcntt.org.shoppingweb.utils;

import hvcntt.org.shoppingweb.dao.dto.AuctionStatus;
import hvcntt.org.shoppingweb.dao.dto.Constant;
import hvcntt.org.shoppingweb.dao.dto.InvoiceStatus;
import hvcntt.org.shoppingweb.dao.dto.UserDto;
import org.springframework.mail.SimpleMailMessage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public class Helper {

    public static String getRememberMeTargetUrlFromSession(HttpServletRequest request) {
        String targetUrl = "";
        HttpSession session = request.getSession(false);
        if (session != null) {
            targetUrl = session.getAttribute("targetUrl") == null ? ""
                    : session.getAttribute("targetUrl").toString();
        }
        return targetUrl;
    }

    public static AuctionStatus getAuctionStatus(String auctionStatus) {
        switch (auctionStatus){
            case "PENDING":
                return AuctionStatus.PENDING;
            case "AUCTIONING":
                return AuctionStatus.AUCTIONING;
            default:
                return AuctionStatus.ENDED;
        }
    }

    public static InvoiceStatus getInvoiceStatus(String invoiceStatus) {
        switch (invoiceStatus){
            case "PENDING":
                return InvoiceStatus.PENDING;
            case "SHIPPING":
                return InvoiceStatus.SHIPPING;
            case "DONE":
                return InvoiceStatus.DONE;
            default:
                return InvoiceStatus.CANCELED;
        }
    }

    public static SimpleMailMessage constructResetTokenEmail(final HttpServletRequest request, final String token, final UserDto userDto) {
        StringBuilder url = new StringBuilder(Constant.CONTENT);
        url.append(getAppUrl(request));
        url.append(Constant.URL);
        url.append(Constant.USERNAME_PARAMETER);
        url.append(userDto.getUsername());
        url.append(Constant.TOKEN_PARAMETER);
        url.append(token).toString();
        return constructEmail(Constant.MAIL_SUBJECT, url.toString(), userDto);
    }

    public static SimpleMailMessage constructEmail(String subject, String body, UserDto userDto) {
        final SimpleMailMessage email = new SimpleMailMessage();
        email.setSubject(subject);
        email.setText(body);
        email.setTo(userDto.getEmail());
        return email;
    }

    public static String getAppUrl(HttpServletRequest request) {
        return Constant.PROTOCOL + request.getServerName() + ":" + request.getServerPort() + request.getContextPath();
    }
}
