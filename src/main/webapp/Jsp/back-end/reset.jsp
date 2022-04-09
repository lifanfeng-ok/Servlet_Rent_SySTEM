<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>


<!-- ============================ User Dashboard ================================== -->
<section class="gray p-0">
    <div class="container-fluid p-0">
        <div class="row">
            <%@ include file="../common/admin-left.jsp" %>
            <div class="col-lg-9 col-md-12 col-sm-12">
                <div class="dashboard-body">
                    <div class="dashboard-wraper">
                        <!-- Basic Information -->
                        <div class="frm_submit_block">
                            <h4>Reset Password</h4>
                            <div class="frm_submit_wrap">
                                <form id="passwordForm">
                                    <div class="form-row">
                                        <div class="col-md-6">
                                            <div class="form-group col-md-12">
                                                <label>Old Password</label>
                                                <input type="password" class="form-control" id ="oldPassword"  name="oldPassword">
                                            </div>

                                            <div class="form-group col-md-12">
                                                <label>New Password</label>
                                                <input type="password" class="form-control" id ="newPassword" name="newPassword">
                                            </div>

                                            <div class="form-group col-md-12">
                                                <label>Confirm </label>
                                                <input type="password" class="form-control" id ="conPassword" name="confirmPassword">
                                            </div>


                                            <div class="form-group col-lg-12 col-md-12">
                                                <button class="btn btn-theme bg-2" type="button"
                                                        onclick="submitPassword()">
                                                    Finish
                                                </button>
                                            </div>
                                        </div>

                                    </div>
                                </form>
                            </div>
                        </div>

                    </div>
                    <!-- row -->

                </div>
            </div>

        </div>
    </div>
</section>
<!-- ============================ User Dashboard End ================================== -->


<%@ include file="../common/footer.jsp" %>
<script>
function submitPassword(){
	var newpassword = document.getElementById("newPassword");
	var oldpassword = document.getElementById("oldPassword");
	var conpassword = document.getElementById("conPassword");
	if (oldpassword.value != ${user.userPass}) {
		alert('Incurrect password');
		return;
	}
	if (newpassword.value == '') {
		alert('please input your new password')
		return;
	}else {
		if (!(/^\d{7,12}$/.test(newpassword.value))) {
			alert('please input 7-12 digits password')
			return;
		}
	}
	if (newpassword.value != conpassword.value) {
		alert('password not same')
		return;
	}
    $.ajax({
        type: 'POST',
        url: '/final/Reset',
        async: false,
        data: $("#passwordForm").serialize(), // 获取该表单下的所有参数
        success: function (data) {
        	var obj = JSON.parse(data);      
            if (obj.message == 'Successed') {
            	alert('Saved Successfully!');
                window.location.reload();
            }
        }
    });
}
</script>
</body>
</html>