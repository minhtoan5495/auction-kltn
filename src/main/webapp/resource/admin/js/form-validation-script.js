$(document).ready(function () {
    var dateToday = new Date();
    $("#startDate").datetimepicker({
        value: new Date(),
        format: "HH:ii - yyyy-mm-dd",
        autoclose: true,
        todayBtn: true,
        minuteStep: 10,
        minDate: dateToday,
    });
    $('#endDate').datetimepicker({
        format: "HH:ii - yyyy-mm-dd",
        autoclose: true,
        todayBtn: true,
        minuteStep: 10,
    });
});