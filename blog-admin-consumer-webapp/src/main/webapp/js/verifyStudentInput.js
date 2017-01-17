$(document).ready(function() {
	var return_login_flag = new Array();
	var return_regis_flag = new Array();

	//非空验证
	$(".form-control").focusout(function() {
		if($(this).val().length == 0) {
			$(this).val("");
			$(this).attr("placeholder", "内容不能为空");
			$(this).addClass("invalid");
			return_regis_flag[0] = 0;
		} else {
			$(this).removeClass("invalid");
			return_regis_flag[0] = 1;
		}
	});
	//验证输入的周期
	$("#stu_learning_period").focusout(function() {
		var reg = /^[0-9]$/;
		var mobile_val = $(this).val();
		if(reg.test(mobile_val) == false) {
			$(this).val("");
			$(this).attr("placeholder", "请输入0-9的阿拉伯数字");
			$(this).addClass("invalid");
			return_regis_flag[4] = 0;
		} else {
			$(this).removeClass("invalid");
			return_regis_flag[4] = 1;
		}
	});
	//通过登录表单和注册表单触发验证事件
	$("#studentForm").submit(function() {
		//submits(return_login_flag);
		return (submits(return_login_flag));
	})
})