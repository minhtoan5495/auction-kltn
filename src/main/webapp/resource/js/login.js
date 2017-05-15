/**
 *
 */
$.validate({
    validateOnBlur : true, // disable validation when input looses focus
});
$(function() {
    // setTimeout() function will be fired after page is loaded
    // it will wait for 5 sec. and then will fire
    // $("#successMessage").hide() function
    setTimeout(function() {
        $("#message").hide('blind', {}, 500)
    }, 1000);
});

$(function() {
    // setTimeout() function will be fired after page is loaded
    // it will wait for 5 sec. and then will fire
    // $("#successMessage").hide() function
    setTimeout(function() {
        $("#error").hide('blind', {}, 500)
    }, 1000);
});