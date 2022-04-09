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
                            <h4>Personal Information</h4>
                            <div class="frm_submit_wrap">
                                <form id="profileForm">
                                    <div class="form-row">
                                        <div class="form-group col-md-6">
                                            <label>Account Name</label>
                                            <input type="text" class="form-control" id="userName2" name="userName" value="${user.userName}" disabled>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>Name</label>
                                            <input type="text" class="form-control" id="userDisplayName2" name="userDisplayName" value="${user.userDisplayName}">
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>Email Address</label>
                                            <input type="email" class="form-control" id="email2" name="email" value="${user.email}">
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>Contact Number</label>
                                            <input type="text" class="form-control" id="phone2" name="phone" value="${user.phone}">
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>Sex</label>
                                            <select id="sex2" name="sex" class="form-control">
                                                <option value="Other" <c:if test="${user.sex == 'Other'}">selected</c:if>>
                                                    Other
                                                </option>
                                                <option value="Male" <c:if test="${user.sex == 'Male'}">selected</c:if>>
                                                    Male
                                                </option>
                                                <option value="Female" <c:if test="${user.sex == 'Female'}">selected</c:if>>
                                                    Female
                                                </option>
                                            </select>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>Career</label>
                                            <select id="job2" name="job" class="form-control">
                                                <option value="Other" <c:if test="${user.job == 'Other'}">selected</c:if>>Other</option>
                                                <option value="Computing" <c:if test="${user.job == 'Computing'}">selected</c:if>>Computing</option>
                                                <option value="Manufacturing" <c:if test="${user.job == 'Manufacturing'}">selected</c:if>>Manufacturing</option>
                                                <option value="Education" <c:if test="${user.job == 'Education'}">selected</c:if>>Education</option>
                                                <option value="Finance" <c:if test="${user.job == 'Finance'}">selected</c:if>>Finance</option>
                                                <option value="Insurance" <c:if test="${user.job == 'Insurance'}">selected</c:if>>Insurance</option>
                                                <option value="Media" <c:if test="${user.job == 'Media'}">selected</c:if>>Media</option>                         
                                                <option value="Service" <c:if test="${user.job == 'Service'}">selected</c:if>>Service</option>
                                                <option value="Student" <c:if test="${user.job == 'Student'}">selected</c:if>>Student</option>
                                            </select>
                                        </div>
                                        
                                        <div class="form-group col-md-6">
                                            <label>Region/Country</label>
                                            <select id="country2" name="country" class="form-control">
                                                <option value="Singapore" <c:if test="${user.country == 'Singapore'}">selected</c:if>>Singapore</option>
                                                <option value="China" <c:if test="${user.country == 'China'}">selected</c:if>>China</option>
                                                <option value="The United States" <c:if test="${user.job == 'The United States'}">selected</c:if>>The United States</option>
                                                <option value="Russia" <c:if test="${user.country == 'Russia'}">selected</c:if>>Russia</option>
                                                <option value="France" <c:if test="${user.country == 'France'}">selected</c:if>>France</option>
                                                <option value="British" <c:if test="${user.country == 'British'}">selected</c:if>>British</option>
                                                <option value="Germany" <c:if test="${user.country == 'Germany'}">selected</c:if>>Germany</option>                         
                                                <option value="Greek" <c:if test="${user.country == 'Greek'}">selected</c:if>>Greek</option>
                                                <option value="Japan" <c:if test="${user.country == 'Japan'}">selected</c:if>>Japan</option>
                                                <option value="South Korea" <c:if test="${user.country == 'South Korea'}">selected</c:if>>South Korea</option>
                                                <option value="Other" <c:if test="${user.country == 'Other'}">selected</c:if>>Other</option>
                                            </select>
                                        </div>

                                        <div class="form-group col-md-6">
                                            <label>Hobby</label>
                                            <input type="text" class="form-control" id="hobby2" name="hobby" value="${user.hobby}">
                                        </div>

                                        <div class="form-group col-md-12">
                                            <label>Personal Description</label>
                                            <textarea class="form-control" id="userDesc2" name="userDesc">${user.userDesc}</textarea>
                                        </div>

                                        <div class="form-group col-lg-12 col-md-12">
                                            <button class="btn btn-theme bg-2" type="button" onclick="submitProfile()">
                                                Save
                                            </button>
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
function submitProfile() {
	var email = document.getElementById("email2");
	var phone = document.getElementById("phone2");
	var d_name = document.getElementById("userDisplayName2");
	var country = document.getElementById("country2");
	var job = document.getElementById("job2");
	var sex = document.getElementById("sex2");
	var hobby = document.getElementById("hobby2");
	console.log(phone.value);
	if (email.value == '') {
		alert('please input your email address');
		return;
	}else {
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
    $.ajax({
        type: 'POST',
        url: '/final/Change',
        async: false,
        data: $("#profileForm").serialize(), // 获取该表单下的所有参数
        success: function (data) {
        	var obj = JSON.parse(data)
            if (obj.message == 'Successed') {
            	alert('Saved Successfully!');
                window.location.href="/final/Profile";
            }
        }
    });
}
 </script>
</body>
</html>