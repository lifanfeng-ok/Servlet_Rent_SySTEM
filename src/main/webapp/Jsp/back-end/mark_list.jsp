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
                            <h4>My Favorites</h4>
                        </div>

                        <table class="property-table-wrap responsive-table bkmark">

                            <tbody>
                            <tr>
                                <th><i class="fa fa-file-text"></i> Favorites List</th>
                                <th></th>
                            </tr>

                            <c:forEach items="${house}" var="c">
                                <tr>
                                    <td class="dashboard_propert_wrapper">
                                        <img src="/final/${c.thumbnailUrl}" alt="">
                                        <div class="title">
                                            <h4><a href="/final/House_detail?id=${c.id}" target="_blank">${c.title}</a></h4>
                                            <span>${c.address}</span>
                                            <span class="table-property-price">S$${c.monthRent} / Month</span>
                                        </div>
                                    </td>
                                    <td class="action">
                                        <a href="javascript:void(0)" class="delete" onclick="cancelMark(${c.id})"><i class="ti-close"></i>Cancel</a>
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
function cancelMark(id) {	
    $.ajax({
        type: 'POST',
        url: '/final/Mark_delete',
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
