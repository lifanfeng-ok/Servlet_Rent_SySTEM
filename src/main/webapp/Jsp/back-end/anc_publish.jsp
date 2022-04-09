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


                <!-- ============================ Submit Property Start ================================== -->
                <section style="padding:20px 0">

                    <div class="container">
                        <div class="row">

                            <!-- Submit Form -->
                            <div class="col-lg-12 col-md-12">

                                <div class="submit-page form-simple">

                                    <!-- Basic Information -->
                                    <div class="frm_submit_block">
                                        <h3>Publish Notice</h3>
                                        <div class="frm_submit_wrap">
                                            <form action="" id="newsForm">
                                                <div class="form-row">

                                                    <input type="hidden" name="id" value="${news.id}">
                                                    <div class="form-group col-md-12" style="padding-left: 5px ">
                                                        <label>Title</label>
                                                        <input id="title" type="text" name="title" value="${news.title}"
                                                               class="form-control">
                                                    </div>
                                                    <div class="form-group col-md-12" style="padding-left: 5px ">
                                                        <label>Summary</label>
                                                        <textarea id="summary" class="form-control h-240" name="summary"
                                                                  style="min-height: 100px;">${news.summary}</textarea>
                                                    </div>

                                                    <div class="form-group col-md-12" style="padding-left: 5px ">
                                                        <label>Content</label>
                                                        <textarea id="content" class="form-control h-240" name="content"
                                                                  style="min-height: 300px;">${news.content}</textarea>
                                                    </div>


                                                    <div class="form-group" style="padding-left:5px ">
                                                        <div class="col-lg-12 col-md-12" style="padding-left:5px ">
                                                            <button class="btn btn-theme bg-2" type="button"
                                                                    onclick="submitNews()">Publish
                                                            </button>
                                                        </div>
                                                    </div>

                                                </div>
                                            </form>
                                        </div>
                                    </div>


                                </div>
                            </div>

                        </div>
                    </div>

                </section>
                <!-- ============================ Submit Property End ================================== -->

            </div>
        </div>
    </div>
</section>
<!-- ============================ User Dashboard End ================================== -->


<%@ include file="../common/footer.jsp" %>
<script>
function submitNews() {
	var title = document.getElementById("title");
	var summary = document.getElementById("summary");
	var content = document.getElementById("content");
	if (title.value == '') {
		alert('please input title');
		return;
	}
	else if (summary.value == '') {
		alert('please input summary')
		return;
	}
	else if (content.value =='') {
		alert('please input content')
		return;
	}
    $.ajax({
        type: 'POST',
        url: '/final/Annouc_submit',
        async: false,
        data: $("#newsForm").serialize(), 
        success: function (data) {
        	var obj = JSON.parse(data);
            // 如果反馈成功，刷新页面
            if (obj.status == 0) {
            	alert(obj.message);           	
                return;
            }
            else {
            	alert(obj.message);
            	window.location.href="/final/Annouc_list";
            }
        }
    }); 
}
</script>
</body>
</html>
