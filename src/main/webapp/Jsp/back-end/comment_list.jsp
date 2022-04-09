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
                            <h4>Comments Management</h4>
                        </div>


                        <table class="property-table-wrap responsive-table">

                            <tbody>
                            <tr>
                                <th  style="width: 10%;">User</th>
                                <th>Title</th>
                                <th>Content</th>
                            <!--     <th>Time</th> -->
                                <th>Action</th>
                            </tr>
                            <c:forEach items="${comments}" var="c">
                                <tr>
                                    <td align="center">${c.user.userDisplayName}</td>
                                    <td>
                                        <a href="/final/Post_detail?id=${c.post.id}" target="_blank" class="delete text-blue">${c.post.title}</a>
                                    </td>
                                    <td>
                                        ${c.content}
                                    </td>
                                 <%--    <td>
                                        <fmt:formatDate pattern="yyyy-MM-dd" value="${c.createTime}"/>
                                    </td> --%>
                                    <td class="action">
                                        <a href="/final/Post_detail?id=${c.post.id}" class="delete text-blue" style="margin-left:2px">See</a>
                                        <a href="javascript:void(0)" class="delete text-danger" onclick="deleteComment(${c.id})">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>


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
function deleteComment(id) {	
    $.ajax({
        type: 'POST',
        url: '/final/Comment_delete',
        async: false,
        data: {
                'id': id,
            },
        success: function (data) {
        	var obj = JSON.parse(data);
            if (obj.status == 0) {
            	alert(obj.message);           	
                return;
            }
            else {
            	alert(obj.message);
            	window.location.reload();
            }
        }
    }); 
}
</script>
</body>
</html>