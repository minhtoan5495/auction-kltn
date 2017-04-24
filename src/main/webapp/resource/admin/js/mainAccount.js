/**
 * Created by toannguyen on 24/04/2017.
 */
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
                $('<option>').val(value).text(value.districtName).appendTo(select);
            });
        }
    });
}