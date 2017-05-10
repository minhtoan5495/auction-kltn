<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@page contentType="text/html" pageEncoding="UTF-8" %>
<!-- CONTENT -->
<div class="main-content-contact">
    <div class="header_detail_lg hidden-xs" id="header_detail_scroll">
        <div class="container no-padding">
            <div class="main_header_detail" style="margin-left: 15px">
                <div class="main_header_detail_item">
                    <a href="#" class="main_header_detail_item_link">Trang chủ</a>
                </div>
                <div class="main_header_detail_item">
                    <a href="#" class="main_header_detail_item_link"> > </a>
                </div>
                <div class="main_header_detail_item">
                    <a href="#" class="main_header_detail_item_link">Liên hệ với chúng tôi</a>
                </div>
            </div>
        </div>
    </div>
    <div class="container">
        <div class="row">
            <div class="content-register-title">
                <h2 class="content-paget-title-item" style="border-top: none;text-align: right: ;">

                </h2>
            </div>
            <div class="col-sm-2"></div>
            <div class="col-sm-8">
                <div class="create-account">
                    <form method="POST" class="new-account-form primary-form"
                          action="/sendMail">
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}"/>
                        <h3 class="form-heading">Contact</h3>
                        <div class="form-content">
                            <div class="form-group primary-form-group">
                                <div class="form-group form-contact-item ${status.error ? 'has-error' : ''}">
                                    <div class="lbl-contact">
                                        <label for="from" class="lbl-contact-item">Họ và tên</label>
                                    </div>
                                    <div class="input-contact">
                                        <input class="form-control input-field-contact"
                                               name="name">
                                    </div>
                                </div>
                                <div class="form-group form-contact-item ${status.error ? 'has-error' : ''}">
                                    <div class="lbl-contact">
                                        <label for="from" class="lbl-contact-item">Địa chỉ Email</label>
                                    </div>
                                    <div class="input-contact">
                                        <input class="form-control input-field-contact"
                                               name="email">
                                    </div>
                                </div>
                                <div class="form-group form-contact-item ${status.error ? 'has-error' : ''}">
                                    <div class="lbl-contact">
                                        <label for="from" class="lbl-contact-item">Số điện thoại</label>
                                    </div>
                                    <div class="input-contact">
                                        <input class="form-control input-field-contact"
                                               name="phone">
                                    </div>
                                </div>
                                <div class="form-group form-contact-item ${status.error ? 'has-error' : ''}">
                                    <div class="lbl-contact">
                                        <label for="from" class="lbl-contact-item">Lí do liên lạc</label>
                                    </div>
                                    <div class="input-contact">
                                        <input class="form-control input-field-contact"
                                               name="reason">
                                    </div>
                                </div>
                                <div class="form-group form-contact-item ${status.error ? 'has-error' : ''}">
                                    <div class="lbl-contact">
                                        <label for="from" class="lbl-contact-item">Nội dung liên hệ</label>
                                    </div>
                                    <div class="input-contact">
									<textarea name="content" class="form-control input-field-contact" style="height: 150px;"
                                    ></textarea>
                                    </div>
                                </div>
                                <div class="submit-button-contact">
                                    <button class="btn btn-success btn-submit-contact" type="submit">Xác nhận</button>
                                </div>
                            </div>
                        </div>
                        <input type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}"/>
                        <div class="contact-item-by">
                            <h2 class="contact-item-by-title">Liên hệ trực tiếp với chúng tôi</h2>
                            <p class="contact-item-by-phone">Đặt hàng: 01665102292</p>
                            <p class="contact-item-by-phone">Chăm sóc khách hàng: 01665102292</p>
                            <p class="contact-item-by-phone">Đổi trả sản phẩm: 01665102292</p>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col-sm-2">
            </div>
        </div>
    </div>
</div>
<!-- END CONTENT -->