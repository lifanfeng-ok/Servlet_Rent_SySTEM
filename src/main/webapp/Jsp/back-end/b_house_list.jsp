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


                    <div class="frm_submit_block">
                        <h4>House Management</h4>
                    </div>

                    <div class="row">


                        <c:forEach items="${houses}" var="c">
                            <!-- Single Property -->
                            <div class="col-lg-4 col-md-6 col-sm-12">
                                <div class="dashboard_property_list">
                                    <div class="dashboard_property_list_thumb">
                                        <img src="/final/${c.thumbnailUrl}" class="img-fluid" alt="" style="width:255px; height:177px"/>
                                        <c:choose>
                                            <c:when test="${c.status == 1}">
                                                <span class="dashboard_pr_status">Renting Out</span>
                                            </c:when>
                                            <c:when test="${c.status == 0}">
                                                <span class="dashboard_pr_status published">Rented Out</span>
                                            </c:when>
                                            <c:when test="${c.status == -1}">
                                                <span class="dashboard_pr_status expire">Removed</span>
                                            </c:when>
<%--                                             <c:when test="${c.status == -2}">
                                                <span class="dashboard_pr_status expire">待审核</span>
                                            </c:when>
                                            <c:when test="${c.status == -3}">
                                                <span class="dashboard_pr_status expire">审核驳回</span>
                                            </c:when>
                                            <c:otherwise>
                                                <span class="dashboard_pr_status ">未知状态</span>
                                            </c:otherwise> --%>
                                        </c:choose>
                                    </div>
                                    <div class="dashboard_property_list_content">
                                        <h4>${c.title}</h4>
                                        <span><i class="ti-location-pin"></i>${c.address}</span>
                                    </div>
                                    <div class="dashboard_property_list_footer">
                                        <a href="/final//House_detail?id=${c.id}" data-toggle="tooltip" title="See Detail"><i
                                                class="ti-eye"></i></a>

                                    </div>
                                </div>
                            </div>
                        </c:forEach>

                    </div>
                    <!-- row -->

                   

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
