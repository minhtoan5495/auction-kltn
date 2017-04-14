// $(document).ready(function(){
// 	$("#saveRegister").validate({
// 		rules:{
// 			"username":{
// 				required:true,
// 				minlength:6,
// 				maxlength:40
// 			},
// 			"password":{
// 				required:true,
// 				minlength:6,
// 				maxlength:30
//
// 			},
// 			"email":{
// 				required:true,
// 				email:true
// 			},
// 			"passwordConfirm":{
// 				required:true,
// 				minlength:6,
// 				equalTo:"#password"
// 			}
// 		},
// 	messages: {
// 			"username":{
// 				required:"Tên đăng nhập không bỏ trống",
// 				minlength:"Tên đăng nhập phải lớn hơn 6 ký tự",
// 				maxlength:"Tên đăng nhập không vượt quá 40 ký tự"
// 			},
// 		"password":{
// 			required:"Mật khẩu không bỏ trống",
// 			minlength:"Mật khẩu phải lớn hơn 6 ký tự",
// 			maxlength:"Mật khẩu không vượt quá 40 ký tự"
// 		},
// 			"email":{
// 				required:"Email không để trống",
// 				email:"Nhập email không hợp lệ"
// 			},
// 			"passwordConfirm":{
// 				required:"Vui lòng nhập lại mật khẩu",
// 				equalTo:"Xác nhận mật khẩu không đúng",
// 				minlength:"Xác nhận mật khẩu quá ngắn"
// 			}
// 		},
// 	});
// });
angular.module("MyApp",["ui.bootstrap"]).filter('RegisterController', function (){});