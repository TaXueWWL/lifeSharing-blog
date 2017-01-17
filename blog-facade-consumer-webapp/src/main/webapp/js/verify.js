$(document).ready(function() {
	var return_login_flag = new Array();
	var return_regis_flag = new Array();
	//登录表单验证——邮箱验证
	$("#user_login_email").focusout(function() {
		var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		var email_val = $(this).val();
		if(reg.test(email_val) == false) {
			$(this).val("");
			$(this).attr("placeholder", "邮箱格式不符合要求");
			$(this).addClass("invalid");
			return_login_flag[0] = 0;
		} else {
			$(this).removeClass("invalid");
			return_login_flag[0] = 1;
		}
	});
	//登录表单验证——用户密码验证
	$("#user_login_pwd").focusout(function() {
		var word_reg = /^[a-zA-Z]+$/; //不能全是字母
		var flag_reg = /^[_#@]+$/; //不能全是符号
		var num_reg = /.{6,12}/; //长度为6到12位
		if(!num_reg.test($(this).val())) {
			$(this).val("");
			$(this).attr("placeholder", "密码长度为6到12位");
			$(this).addClass("invalid");
			return_login_flag[1] = 0;
		} else if(flag_reg.test($(this).val())) {
			$(this).val("");
			$(this).attr("placeholder", "不能全是特殊字符");
			$(this).addClass("invalid");
			return_login_flag[1] = 0;
		} else if(word_reg.test($(this).val())) {
			$(this).val("");
			$(this).attr("placeholder", "不能全是字母");
			$(this).addClass("invalid");
			return_login_flag[1] = 0;
		} else if(!isNaN($(this).val())) {
			$(this).val("");
			$(this).attr("placeholder", "不能全是数字");
			$(this).addClass("invalid");
			return_login_flag[1] = 0;
		} else {
			$(this).removeClass("invalid");
			return_login_flag[1] = 1;
		}
	});

	//注册表单验证——用户昵称验证
	$("#user_regis_id").focusout(function() {
		if($(this).val().length < 2 || $(this).val().length > 13) {
			$(this).val("");
			$(this).attr("placeholder", "用户昵称长度为2到13位");
			$(this).addClass("invalid");
			return_regis_flag[0] = 0;
		} else {
			$(this).removeClass("invalid");
			return_regis_flag[0] = 1;
		}
	});
	//注册表单验证——用户密码验证
	$("#user_regis_pwd").focusout(function() {
		var word_reg = /^[a-zA-Z]+$/; //不能全是字母
		var flag_reg = /^[_#@]+$/; //不能全是符号
		var num_reg = /.{6,12}/; //长度为6到12位
		if(!num_reg.test($(this).val())) {
			$(this).val("");
			$(this).attr("placeholder", "密码长度为6到12位");
			$(this).addClass("invalid");
			return_regis_flag[1] = 0;
		} else if(flag_reg.test($(this).val())) {
			$(this).val("");
			$(this).attr("placeholder", "不能全是特殊字符");
			$(this).addClass("invalid");
			return_regis_flag[1] = 0;
		} else if(word_reg.test($(this).val())) {
			$(this).val("");
			$(this).attr("placeholder", "不能全是字母");
			$(this).addClass("invalid");
			return_regis_flag[1] = 0;
		} else if(!isNaN($(this).val())) {
			$(this).val("");
			$(this).attr("placeholder", "不能全是数字");
			$(this).addClass("invalid");
			return_regis_flag[1] = 0;
		} else {
			$(this).removeClass("invalid");
			return_regis_flag[1] = 1;
		}
	});
	//注册表单验证——用户密码一致性验证
	$("#reuser_regis_pwd").focusout(function() {
		if($(this).val() != $("#user_regis_pwd").val()) {
			$(this).val("");
			$(this).attr("placeholder", "两次密码输入不一致");
			$(this).addClass("invalid");
			return_regis_flag[2] = 0;
		} else {
			$(this).removeClass("invalid");
			return_regis_flag[2] = 1;
		}
	});
	//注册表单验证——用户注册邮箱验证
	$("#user_regis_email").focusout(function() {
		var reg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
		var email_val = $(this).val();
		if(reg.test(email_val) == false) {
			$(this).val("");
			$(this).attr("placeholder", "邮箱格式不符合要求");
			$(this).addClass("invalid");
			return_regis_flag[3] = 0;
		} else {
			$(this).removeClass("invalid");
			return_regis_flag[3] = 1;
		}
	});
	//注册表单验证——用户手机号验证
	$("#user_regis_mobile").focusout(function() {
		var reg = /^[1][358][0-9]{9}$/;
		var mobile_val = $(this).val();
		if(reg.test(mobile_val) == false) {
			$(this).val("");
			$(this).attr("placeholder", "手机号格式不符合要求");
			$(this).addClass("invalid");
			return_regis_flag[4] = 0;
		} else {
			$(this).removeClass("invalid");
			return_regis_flag[4] = 1;
		}
	});
	//表单合法性验证函数
	function submits(arr) {
		//此处只可以使用arr.length，不可以使用arr.size
		//foreach中，i代表下标
		if(arr.length != 2 && arr.length != 5) {
			return false;
		} else {
			for(var i in arr) {
				if(arr[i] == 0) {
					return false;
				}
			}
			return true;
		}
	}
	//通过登录表单和注册表单触发验证事件
	$("#loginform").submit(function() {
		//submits(return_login_flag);
		return (submits(return_login_flag));
	})
	$("#regisform").submit(function() {
		//submits(return_regis_flag);
		return (submits(return_regis_flag));
	})
})