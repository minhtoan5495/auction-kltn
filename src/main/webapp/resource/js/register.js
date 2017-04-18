$.validate({
    validateOnBlur : false, // disable validation when input looses focus
    errorMessagePosition : 'top', // Instead of 'inline' which is default
    scrollToTopOnError : false // Set this property to true on longer forms
});
function Validate() {
    var password = document.getElementById("password").value;
    var confirmPassword = document.getElementById("confirmPassword").value;
    if (password != confirmPassword) {
        alert("Nhập lại mật khẩu không chính xác !");
        return false;
    }
    return true;
}
