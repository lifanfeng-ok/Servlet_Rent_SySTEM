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
                            <h4>Announcements <a href="/final/Annouc_publish" class="btn btn-theme bg-2 btn-sm">Publish Notices</a></h4>
                        </div>


                        <table class="property-table-wrap responsive-table">

                            <tbody>
                            <tr>
                                <th>Title</th>
                                <th>Time</th>
                                <th>Action</th>
                            </tr>
                            <c:forEach items="${notices}" var="c">
                                <tr>
                                    <td style="padding-left:15px">${c.title}</td>
                                    <td>
                                        <fmt:formatDate pattern="yyyy-MM-dd" value="${c.createTime}"/>
                                    </td>
                                    <td class="action">
                                        <a href="/final/Annouc_publish?id=${c.id}" class="delete text-blue" style="margin-left:2px">Edit</a>
                                        <a href="javascript:void(0)" class="delete text-danger" onclick="deleteNews(${c.id})">Delete</a>
                                    </td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>


                    </div>

                    <!-- Pagination 分页 -->
<%--                     <div class="row">
                        <div class="col-lg-12 col-md-12 col-sm-12">
                            <%@ include file="../common/page.jsp" %>

                        </div>
                    </div> --%>
                    <!-- row -->

                </div>
            </div>
        </div>
    </div>
</section>
<!-- ============================ User Dashboard End ================================== -->


<%@ include file="../common/footer.jsp" %>
<script>
function deleteNews(id) {	
    $.ajax({
        type: 'POST',
        url: '/final/Announc_delete',
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
