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


            <div class="col-lg-9 col-md-8 col-sm-12">
                <div class="dashboard-body">

                    <div class="dashboard-wraper">

                        <!-- Bookmark Property -->
                        <div class="frm_submit_block">
                            <h4>User Management</h4>
                        </div>


                        <table class="property-table-wrap responsive-table">

                            <tbody>
                            <tr>
                                <th style="width: 25%;">User Info</th>
                                <th>Contact Info</th>
                                <th>Other Info</th>
                                <th>Status</th>
                                <th>Action</th>
                            </tr>
                            <c:forEach items="${users}" var="c">
                                <tr>
                                    <td style="padding-left:22px">
                                        <span title="UserName">${c.userName}</span>
                                   
                                    </td>
                                    <td>
                                        <span title="Email">${c.email}</span> <br>
                                        <span title="PHONE">${c.phone}</span> <br>
                                    </td>
                                    <td>
                                        <span title="Hobbey">${c.hobby}</span> <br>
                                        <span title="Job">${c.job}</span>
                                    </td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${c.status == 0}">
                                                <span class="text-success">Normal</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="text-danger">Disabled</span>
                                            </c:otherwise>
                                        </c:choose>
                                    </td>
                                    <td class="action">

                                        <c:choose>
                                            <c:when test="${c.status == 0}">
                                                <a style="margin-left:2px" href="javascript:void(0)" class="delete text-danger"
                                                   onclick="disableUser(${c.id})">Disable</a>
                                            </c:when>
                                            <c:otherwise>
                                                <a style="margin-left:2px" href="javascript:void(0)" class="delete text-success"
                                                   onclick="enableUser(${c.id})">Enable</a>
                                            </c:otherwise>
                                        </c:choose>
                                       <%--  <a style="margin-left:2px" href="javascript:void(0)" class="delete text-danger"
                                           onclick="deleteUser(${c.id})">Delete</a> --%>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>


                    </div>


                </div>
            </div>
        </div>
    </div>
</section>
<!-- ============================ User Dashboard End ================================== -->


<%@ include file="../common/footer.jsp" %>
<script>
function disableUser(id) {	
    $.ajax({
        type: 'POST',
        url: '/final/User_disable',
        async: false,
        data: {
            'id': id,
        },
        success: function (data) {
        	var obj = JSON.parse(data)
            // 如果反馈成功，刷新页面  
            if (obj.status == 1) {
            	alert(obj.message);
            	window.location.reload();
            }
            else {
            	alert(obj.message);
            }
        }
    }); 
}

function enableUser(id) {	
    $.ajax({
        type: 'POST',
        url: '/final/User_enable',
        async: false,
        data: {
            'id': id,
        },
        success: function (data) {
        	var obj = JSON.parse(data)
            // 如果反馈成功，刷新页面  
            if (obj.status == 1) {
            	alert(obj.message);
            	window.location.reload();
            }
            else {
            	alert(obj.message);
            }
        }
    }); 
}
</script> 
</body>
</html>
