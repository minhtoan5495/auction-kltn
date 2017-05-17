$(document).ready(function () {
    var dateToday = new Date();
    $("#startDate").datetimepicker({
        value: new Date(),
        format: "hh:ii - yyyy-mm-dd",
        autoclose: true,
        todayBtn: true,
        minuteStep: 10,
        minDate: dateToday,
    });
    $('#endDate').datetimepicker({
        format: "hh:ii - yyyy-mm-dd",
        autoclose: true,
        todayBtn: true,
        minuteStep: 10,
    });
});