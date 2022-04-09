<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>


<!-- ============================ Page Title Start================================== -->
<div class="page-title" style="background:#f4f4f4 url(/final/assets/img/banner-3.jpg);" data-overlay="5">
    <div class="container">
        <div class="row">
            <div class="col-lg-12 col-md-12">

                <div class="breadcrumbs-wrap">
                    <ol class="breadcrumb">
                        <li class="active" aria-current="page" style="font-weight:700;font-size:30px; color:#fff; text-align:center">Announcements</li>
                    </ol>
                    <h2 class="breadcrumb-title" style="font-size:20px;text-align:center" >Details of Announcements</h2>
                </div>

            </div>
        </div>
    </div>
</div>
<!-- ============================ Page Title End ================================== -->

<!-- ============================ Agency List Start ================================== -->
<section class="gray-simple" style="padding: 30px 0">

    <div class="container">

        <!-- row Start -->
        <div class="row">

            <c:forEach items="${Notices}" var="c">
                <div class="col-lg-12 col-md-12">

                    <!-- Single Block Wrap -->
                    <div class="property_block_wrap style-2" style="margin-top:10px">

                        <div class="property_block_wrap_header">
                            <a  href="/final/Announc_detail?id=${c.id}" >
                                <h4 class="property_block_title" style="font-size:20px">${c.title}</h4>
                            </a>
                        </div>
                        <div id="clOne" class="panel-collapse collapse show" aria-expanded="true">
                            <div class="block-body" >
                                    ${c.summary}
                                    <p style="margin-top: 5px; color:#e79caa">Published Time：<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${c.createTime}" /></p>
                                    
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>
        <!-- /row -->


    </div>

</section>
<!-- ============================ Agency List End ================================== -->


<%@ include file="../common/footer.jsp" %>


</body>
</html>