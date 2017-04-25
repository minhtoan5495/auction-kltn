$.validate({
    validateOnBlur : false
});
jQuery(function ($) {
    $("#birthday").mask("99/99/9999");
});
function getDistrict() {
    var cityId = $('#city').val();
    $.ajax({
        type: 'GET',
        url: '/admin/getDistrict',
        data: "cityId=" + cityId,
        success: function (response) {
            var select = $('#district');
            select.find('option').remove();
            $.each(response, function (index, value) {
                $('<option>').val(value.districtName).appendTo(select);
            });
        }
    });
}