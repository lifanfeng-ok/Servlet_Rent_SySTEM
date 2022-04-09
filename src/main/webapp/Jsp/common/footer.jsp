<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!-- ============================ Footer Start ================================== -->
<footer class="dark-footer skin-dark-footer style-2" style="padding-top: 0;">
    <div class="footer-bottom" >
        <div class="container">
            <div class="row align-items-center">

                <div class="col-lg-12 col-md-12">
                    <p class="mb-0" style="text-align:center">© 2021 LZLR</p>
                </div>

            </div>
        </div>
    </div>
</footer>
<!-- ============================ Footer End ================================== -->

<!-- 登录弹出框 Modal -->
<div class="modal fade" id="login" tabindex="-1" role="dialog" aria-labelledby="registermodal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered login-pop-form" role="document">
        <header class="modal_content_header">
            <div class="hm_nav">
                <h3 class="hm_nav_title">Log In</h3>
                <span class="mod-close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></span>
            </div>
        </header>
        <div class="modal-content" id="registermodal">
            <div class="modal-body">
                <div class="login-form">
                    <form id="loginForm">

                        <div class="form-group">
                            <label>Account Name</label>
                            <div class="input-with-icon">
                                <input type="text" class="form-control" name="userName" placeholder="account name">
                                <i class="ti-user"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <label>Password</label>
                            <div class="input-with-icon">
                                <input type="password" class="form-control" name="userPass" placeholder="*******">
                                <i class="ti-unlock"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <button type="button" onclick="submitLogin()" class="btn btn-md full-width pop-login bg-2">Log In</button>
                        </div>

                    </form>
                </div>

                <div class="text-center">
                    <p class="mt-3"><i class="ti-user mr-1"></i>Forget? <a  class="link">Tap Here</a></p>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- End Modal -->

<!-- 注册 Modal -->
<div class="modal fade" id="signup" tabindex="-1" role="dialog" aria-labelledby="sign-up" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered login-pop-form" role="document">
        <header class="modal_content_header">
            <div class="hm_nav">
                <h3 class="hm_nav_title">Sign Up</h3>
                <span class="mod-close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></span>
            </div>
        </header>
        <div class="modal-content" id="sign-up">
            <div class="modal-body">
                <div class="login-form">
                    <form id="registerForm">

                        <div class="row">

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>Name</label>
                                    <div class="input-with-icon">
                                        <input type="text" id="userName" name="userName" class="form-control" placeholder="username">
                                        <i class="ti-user"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>Email</label>
                                    <div class="input-with-icon">
                                        <input type="email" id="email" name="email" class="form-control" placeholder="email">
                                        <i class="ti-email"></i>
                                    </div>
                                </div>
                            </div>
                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>Phone</label>
                                    <div class="input-with-icon">
                                        <input type="text" id="phone" name="phone" class="form-control" placeholder="phone">
                                        <i class="ti-mobile"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>Display_name</label>
                                    <div class="input-with-icon">
                                        <input type="text" id="userDisplayName" name="userDisplayName" class="form-control" placeholder="display-name">
                                        <i class="ti-user"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>Password</label>
                                    <div class="input-with-icon">
                                        <input type="password" id="userPass" name="userPass" class="form-control" placeholder="your password">
                                        <i class="ti-unlock"></i>
                                    </div>
                                </div>
                            </div>

                            <div class="col-lg-12 col-md-12">
                                <div class="form-group">
                                    <label>Role</label>
                                    <div class="simple-input">
                                        <select  name="role" class="form-control">
                                            <option value="customer">Renter</option>
                                            <option value="owner">Landlord</option>
                                        </select>
                                       
                                    </div>
                                </div>
                            </div>

                        </div>

                        <div class="form-group">
                            <button type="button" onclick="submitRegister()" class="btn btn-md full-width pop-login bg-2">Create New Account</button>
                        </div>

                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- End Modal -->

<!-- 找回密码弹出框 Modal -->
<div class="modal fade" id="forget" tabindex="-1" role="dialog" aria-labelledby="forgetmodal" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered login-pop-form" role="document">
        <header class="modal_content_header">
            <div class="hm_nav">
                <h3 class="hm_nav_title">找回密码</h3>
                <span class="mod-close" data-dismiss="modal" aria-hidden="true"><i class="ti-close"></i></span>
            </div>
        </header>
        <div class="modal-content">
            <div class="modal-body">
                <div class="login-form">
                    <form id="forgetForm">

                        <div class="form-group">
                            <label>Acount Name</label>
                            <div class="input-with-icon">
                                <input type="text" class="form-control" name="userName" placeholder="账号">
                                <i class="ti-user"></i>
                            </div>
                        </div>
                        <div class="form-group">
                            <label>Email Address</label>
                            <div class="input-with-icon">
                                <input type="email" class="form-control" name="email" placeholder="注册时填写的电子邮箱地址">
                                <i class="ti-unlock"></i>
                            </div>
                        </div>

                        <div class="form-group">
                            <button type="button" onclick="submitForget()" class="btn btn-md full-width pop-login bg-2">Reset Password</button>
                        </div>

                    </form>
                </div>

                <div class="text-center">
                    <p class="mt-3"><i class="ti-user mr-1"></i>We will send an email to your mailbox, please check it!</p>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- End Modal -->

<!-- End Video Modal -->
<a id="back2Top" class="top-scroll" title="Back to top" href="#"><i class="ti-arrow-up"></i></a>


</div>
<!-- ============================================================== -->
<!-- End Wrapper -->
<!-- ============================================================== -->

<!-- ============================================================== -->
<!-- All Jquery -->
<!-- ============================================================== -->

<script src="/final/assets/js/jquery.min.js"></script>
<script src="/final/assets/js/popper.min.js"></script>
<script src="/final/assets/js/bootstrap.min.js"></script>
<script src="/final/assets/js/ion.rangeSlider.min.js"></script>
<script src="/final/assets/js/select2.min.js"></script>
<script src="/final/assets/js/jquery.magnific-popup.min.js"></script>
<script src="/final/assets/js/slick.js"></script>
<script src="/final/assets/js/slider-bg.js"></script>
<script src="/final/assets/js/lightbox.js"></script>
<script src="/final/assets/js/imagesloaded.js"></script>
<script src="/final/assets/js/daterangepicker.js"></script>
<script src="/final/assets/js/custom.js"></script> 

<script>
function submitLogin() {
    $.ajax({
        type: 'POST',
        url: '/final/Login',
        async: false,
        data: $("#loginForm").serialize(), // 获取该表单下的所有参数
        success: function (data) {
        	var obj = JSON.parse(data)
            // 提示信息
            alert(obj.message);
            // 如果登录成功，刷新页面
            if (obj.message == 'Successed') {
                window.location.reload();
            }
        }
    });
}
function submitRegister() {
	var uname = document.getElementById("userName");
	var email = document.getElementById("email");
	var phone = document.getElementById("phone");
	var d_name = document.getElementById("userDisplayName");
	var password = document.getElementById("userPass");
	if (uname.value == '') {
		alert('please input your userName');
		return;
	}
	else if (email.value == '') {
		alert('please input your email')
		return;
	}
	else {
		var myreg = /^([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+@([a-zA-Z0-9]+[_|\_|\.]?)*[a-zA-Z0-9]+\.[a-zA-Z]{2,3}$/;
        if(!myreg.test(email.value))
        {
             alert('please input the right email');
             return;
        }
	}
	if (phone.value == '') {
		alert('please input your phone');
		return;
	}
	else {
		if (!(/^\d{8}$/.test(phone.value))) {
            alert("please input correct phone number");
            return;
        }
	}
	if (d_name.value == '') {
		alert('please input your d_name')
		return;
	}
	else if (password.value == '') {
		alert('please input password')
		return;
	}
	else {
		if (!(/^\d{7,12}$/.test(password.value))) {
			alert('please input 7-12 digits password')
			return;
		}
	}
    $.ajax({
        type: 'POST',
        url: '/final/Register',
        async: false,
        data: $("#registerForm").serialize(), // 获取该表单下的所有参数
        success: function (data) {
        	var obj = JSON.parse(data);
            if (obj.message == 'Successed') {
            	alert('Registered Successfully, please Login again!');
            	window.location.reload();
            }
            else if(obj.message =='userName already exists') 
            {
               alert('userName already exists');	
            }
        }
    });
}

</script>