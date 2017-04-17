/**
 *
 */
$(document).ready(function () {
    $("#saveLogin").validate({
        rules: {
            "username": {
                required: true,
                minlength: 6,
                maxlength: 40
            },
            "password": {
                required: true,
                minlength: 6,
                maxlength: 30

            }
        },
        messages: {
            "username": {
                required: "Tên đăng nhập không bỏ trống",
                minlength: "Tên đăng nhập phải lớn hơn 6 ký tự",
                maxlength: "Tên đăng nhập không vượt quá 40 ký tự"
            },
            "password": {
                required: "Mật khẩu không bỏ trống",
                minlength: "Mật khẩu phải lớn hơn 6 ký tự",
                maxlength: "Mật khẩu không vượt quá 40 ký tự"
            }
        },
    });
});