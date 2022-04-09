<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="../common/head.jsp" %>


<!-- ============================ Hero Banner Start================================== -->
<div class="image-cover hero_banner" style="background:#334aca url(/final/assets/img/final_banner.jpg) no-repeat;"
     data-overlay="1">
    <div class="container" >

        <h1 class="big-header-capt mb-0">Start a good life From LZLR！</h1>
        <p class="text-center mb-5" style="margin-bottom:50px!important;">Search what you want！</p>
        <!-- Type -->
        <div class="full_search_box nexio_search lightanic_search hero_search-radius modern">
            <div class="search_hero_wrapping">
                <form action="/final/House_list">

                    <div class="row">

                        <div class="col-lg-3 col-md-3 col-sm-12">
                            <div class="form-group">
                                <label>Area</label>
                                <div class="input-with-icon">
                                    <input type="text" name="address" class="form-control">
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-12">
                            <div class="form-group">
                                <label>Region Name</label>
                                <div class="input-with-icon">
                                    <select id="region" name="region" class="form-control">
                                        <option value=""></option>
                                        <option value="Central">Central Region</option>
                                        <option value="North">North Region</option>
                                        <option value="East">East Region</option>
                                        <option value="West">West Region</option>
                                        <option value="North-East">North-East Region</option>
                                    </select>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-2 col-md-2 col-sm-12">
                            <div class="form-group">
                                <label>Type of Rental</label>
                                <div class="input-with-icon">
                                    <select id="RentType" name="rentType" class="form-control">
                                        <option value="">Any</option>
                                        <option value="whole">Whole</option>
                                        <option value="share">Share</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-3 col-md-3 col-sm-12">
                            <div class="form-group">
                                <label>Monthly rent range</label>
                                <div class="input-with-icon">
                                    <select id="Price" class="form-control" name="priceRange">
                                        <option value="">不限</option>
                                        <option value="0;999">Under 1000</option>
                                        <option value="1000;1999">1000-1999</option>
                                        <option value="2000;3999">2000-3999</option>
                                        <option value="4000;5999">4000-5999</option>
                                        <option value="6000;7999">6000-7999</option>
                                        <option value="8000;9999">8000-9999</option>
                                        <option value="10000;14999">10000-14999</option>
                                        <option value="15000;19999">15000-19999</option>
                                    </select>
                                </div>
                            </div>
                        </div>

                        <div class="col-lg-2 col-md-2 col-sm-12 small-padd">
                            <div class="form-group none">
                                <button type="submit" class="btn search-btn">Search</button>
                            </div>
                        </div>

                    </div>
                </form>


            </div>
        </div>
    </div>
</div>
<!-- ============================ Hero Banner End ================================== -->

<!-- ============================ Whole Start ================================== -->
<section class="gray-simple" style="padding:50px 0">
    <div class="container">

        <div class="row justify-content-center">
            <div class="col-lg-7 col-md-8">
                <div class="sec-heading center">
                    <h2>Latest whole rental housing information</h2>
                </div>
            </div>
        </div>

        <div class="row">            
            <c:forEach items="${wh_houses}" var="c">
                <!-- Single Property -->
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="single_property_style property_style_2 modern">

                        <div class="listing_thumb_wrapper">
                            <div class="property_gallery_slide-thumb">
                                <a href="/final/House_detail?id=${c.id}">
                                    <img src="/final/${c.thumbnailUrl}" class="img-fluid mx-auto" alt=""></a>
                            </div>
                        </div>

                        <div class="property_caption_wrappers pb-0">
                            <div class="property_short_detail">
                                <div class="pr_type_status">
                                    <h4 class="pr-property_title mb-1">
                                        <a href="/final/House_detail?id=${c.id}">
                                                ${c.title}
                                        </a>
                                    </h4>
                                    <div class="listing-location-name">
                                        <a href="/final/House_detail?id=${c.id}">
                                                ${c.address}
                                        </a>
                                    </div>
                                </div>
                                <div class="property-real-price">
                                    <a href="/house/detail/${c.id}" class="cl-blue">
                                        S$ ${c.monthRent}<span class="price_status">/Month</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="modern_property_footer">
                            <div class="property-lists flex-1">
                                <ul>
                                    <li><span class="flatcons"><img src="/final/assets/img/bed.svg"
                                                                    alt=""></span>${c.bedroomNum} Bedroom
                                    </li>
                                    <li><span class="flatcons"><img src="/final/assets/img/bath.svg"
                                                                    alt=""></span>${c.toiletNum} Washroom
                                    </li>
                                </ul>
                            </div>
                            <div class="fp_types"><a href="javascript:void(0)" class="markHouse" data-id="${c.id}"
                                                     onclick="submitMark(${c.id})">Favorite</a></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                <a href="/final/House_list?rentType=whole" class="btn btn-theme arrow-btn bg-2"> Learn More
                    <span><i class="ti-arrow-right"></i></span>
                </a>
            </div>
        </div>

    </div>
</section>
<div class="clearfix"></div>
<!-- ============================ Whole End ================================== -->


<!-- ============================ Share Start ================================== -->
<section class="gray-simple" style="padding:20px 0 50px 0">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-7 col-md-8">
                <div class="sec-heading center">
                    <h2>Latest share house information</h2>
                </div>
            </div>
        </div>

        <div class="row">            
            <c:forEach items="${sh_houses}" var="c">
                <!-- Single Property -->
                <div class="col-lg-4 col-md-6 col-sm-12">
                    <div class="single_property_style property_style_2 modern">

                        <div class="listing_thumb_wrapper">
                            <div class="property_gallery_slide-thumb">
                                <a href="/final/House_detail?id=${c.id}">
                                    <img src="/final/${c.thumbnailUrl}" class="img-fluid mx-auto" alt=""></a>
                            </div>
                        </div>

                        <div class="property_caption_wrappers pb-0">
                            <div class="property_short_detail">
                                <div class="pr_type_status">
                                    <h4 class="pr-property_title mb-1">
                                        <a href="/final/House_detail?id=${c.id}">
                                                ${c.title}
                                        </a>
                                    </h4>
                                    <div class="listing-location-name">
                                        <a href="/final/House_detail?id=${c.id}">
                                                ${c.address}
                                        </a>
                                    </div>
                                </div>
                                <div class="property-real-price">
                                    <a href="/final/House_detail?id=${c.id}" class="cl-blue">
                                        S$ ${c.monthRent}<span class="price_status">/Month</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="modern_property_footer">
                            <div class="property-lists flex-1">
                                <ul>
                                    <li><span class="flatcons">
                                        <img src="/final/assets/img/bed.svg" alt=""></span>${c.bedroomNum} Bedroom
                                    </li>
                                    <li><span class="flatcons">
                                        <img src="/final/assets/img/bath.svg"
                                             alt=""></span>${c.toiletNum} Washroom
                                    </li>
                                </ul>
                            </div>
                            <div class="fp_types"><a href="javascript:void(0)" class="markHouse" data-id="${c.id}"
                                                     onclick="submitMark(${c.id})">Favorite</a></div>
                        </div>
                    </div>
                </div>
            </c:forEach>
        </div>

        <div class="row">
            <div class="col-lg-12 col-md-12 col-sm-12 text-center">
                <a href="/final/House_list?rentType=share" class="btn btn-theme arrow-btn bg-2">Learn More
                    <span><i class="ti-arrow-right"></i></span>
                </a>
            </div>
        </div>

    </div>
</section>
<div class="clearfix"></div>

<!-- ============================ Share End ================================== -->


<%@ include file="../common/footer.jsp" %>
<script>
    $('#region').select2({
        //当没有选择数据时,显示内容
        placeholder: 'Region',
        //当存在数据时,显示清楚按钮
        allowClear: true
    });
    $('#RentType').select2({
        //当没有选择数据时,显示内容
        placeholder: 'RentType',
        //当存在数据时,显示清楚按钮
        allowClear: true
    });
    $('#Price').select2({
        //当没有选择数据时,显示内容
        placeholder: 'Price Range',
        //当存在数据时,显示清楚按钮
        allowClear: true
    });
    let openLogin = "${openLogin}";
    if (openLogin == 'Y') {
        $('#gotoLogin').click();
    }
    
    function submitMark(houseId) {
        $.ajax({
            type: 'POST',
            url: '/final/Collecting',
            async: false,
            data: {
                "houseId": houseId // 以表单格式传参数
            },
            success: function (data) {
            	var obj = JSON.parse(data)
            	
                if ( obj.status == 0) {
                	alert(obj.message);
                    $('#gotoLogin').click();
                    return;
                }
                else if (obj.status == 1) {
                	alert(obj.message); 
                }
                else if(obj.status == 2) {
                	alert(obj.message); 
                	window.location.reload();
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