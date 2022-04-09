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
                            <h4>Post Management <a href="/final/Post_publish" class="btn btn-theme bg-2 btn-sm">Publish Post</a></h4>
                        </div>


                        <table class="property-table-wrap responsive-table">

                            <tbody>
                            <tr>
                                <th style="width: 10%;">User</th>
                                <th>Title</th>
                                <th style="width: 20%">Time</th>
                               <!--  <th style="width: 20%">Action</th> -->
                            </tr>
                            <c:forEach items="${posts}" var="c">
                                <tr>
                                    <td align="center">${c.user.userDisplayName}</td>
                                    <td>
                                        <a href="/final/Post_detail?id=${c.id}"  target="_blank" class="delete text-blue">${c.title}</a>
                                    </td>
                                    <td>
                                        <fmt:formatDate pattern="yyyy-MM-dd" value="${c.createTime}"/>
                                    </td>
                                  <!--   <td class="action">                                   
                                        <a style="margin-left:5px; cursor:default" href="javascript:void(0)" class="delete text-danger"  >Delete</a>
                                    </td> -->
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
</body>
</html>
