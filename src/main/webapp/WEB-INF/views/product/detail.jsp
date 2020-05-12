<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/top.jsp"%>
<!-- ========== 컨텐츠 영역 시작 ========== -->
<div class="container product-detail ${category}" data-pid="${output.id}">
    <div class="visible-xs visible-sm detail-title m">
        <div class="page-header">
            <h1>${output.name}</h1>
        </div>
        <p>${output.description}</p>
    </div>
    <div class="row">
        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
            <img src="${output.titleImg.fileUrl}" width="100%" alt="${output.name}" class="title-img" />
        </div>
        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12 product-info-container">
            <div class="visible-md visible-lg detail-title">
                <div class="page-header">
                    <h1>${output.name}</h1>
                </div>
                <p>${output.description}</p>
            </div>
            <dl class="row product-option-info">
                <c:choose>
                    <c:when test="${output.salePrice > 0}">
                        <dt class="col-xs-3 col-sm-4">
                            <span>판매가격</span>
                        </dt>
                        <dd class="col-xs-9 col-sm-8">
                            <span class="price cancel">
                                <fmt:formatNumber value="${output.price}" pattern="#,###" />
                                원
                            </span>
                        </dd>
                        <dt class="col-xs-3 col-sm-4">
                            <span>할인가격</span>
                        </dt>
                        <dd class="col-xs-9 col-sm-8">
                            <span class="price sale" id="real-price" data-value="${output.salePrice}">
                                <fmt:formatNumber value="${output.salePrice}" pattern="#,###" />
                                원
                            </span>
                        </dd>
                    </c:when>
                    <c:otherwise>
                        <dt class="col-xs-3 col-sm-4">
                            <span>판매가격</span>
                        </dt>
                        <dd class="col-xs-9 col-sm-8">
                            <span class="price" id="real-price" data-value="${output.price}">
                                <fmt:formatNumber value="${output.price}" pattern="#,###" />
                                원
                            </span>
                        </dd>
                    </c:otherwise>
                </c:choose>
                <c:if test="${output.productOption != null}">
                    <c:forEach var="item" items="${output.productOption}" varStatus="status">
                        <dt class="col-xs-3 col-sm-4 product-option-name">
                            <span>${item.name}</span>
                        </dt>
                        <dd class="col-xs-9 col-sm-8 product-option-value">
                            <select name="product_option" class="form-control input-sm product-option" data-index="${status.index}">
                                <option value="">----- 옵션선택 -----</option>
                                <c:if test="${item.value != null}">
                                    <c:forEach var="v" items="${item.value}">
                                        <option value="${v}">${v}</option>
                                    </c:forEach>
                                </c:if>
                            </select>
                        </dd>
                    </c:forEach>
                </c:if>
            </dl>
            <div id="product-option-choice" style="display: none"></div>
            <div class="panel">
                <div class="panel-body text-right">
                    총 구매금액 <strong class="text-danger total-price" data-value="0">0</strong>원
                </div>
            </div>
            <div class="row">
                <div class="col-xs-12 mb10">
                    <button class="btn btn-block btn-primary" id="btn-order">
                        <i class="fa fa-shopping-bag"></i> 주문하기
                    </button>
                </div>
                <div class="col-xs-6">
                    <button class="btn btn-block btn-success" id="btn-cart">
                        <i class="fa fa-cart-arrow-down"></i> 장바구니
                    </button>
                </div>
                <div class="col-xs-6">
                    <button class="btn btn-block btn-success" id="btn-fav">
                        <i class="fa fa-heart"></i> 찜하기
                    </button>
                </div>
            </div>
        </div>
    </div>
    <div class="product-content">
        <ul class="nav nav-tabs nav-justified">
            <li role="presentation" class="active">
                <a href="#content" data-toggle="tab">상세정보</a>
            </li>
            <li role="presentation">
                <a href="#delivery" data-toggle="tab">배송안내</a>
            </li>
            <li role="presentation">
                <a href="#comment" data-toggle="tab">구매후기</a>
            </li>
            <li role="presentation">
                <a href="#qna" data-toggle="tab">상품문의</a>
            </li>
        </ul>
        <!-- Tab panes -->
        <div class="tab-content">
            <div class="tab-pane fade in active" id="content">${output.content}</div>
            <div class="tab-pane" id="delivery">
                <img src="${pageContext.request.contextPath}/assets/img/shopp_guide.jpg" />
            </div>
            <div class="tab-pane" id="comment">
                <h3 class='text-danger'>
                    학습예제 버전에서는 <b>구매후기</b> 기능을 지원하지 않습니다.
                </h3>
            </div>
            <div class="tab-pane" id="qna">
                <h3 class='text-danger'>
                    학습예제 버전에서는 <b>상품문의</b> 기능을 지원하지 않습니다.
                </h3>
            </div>
        </div>
    </div>
</div>
<!--// ========== 컨텐츠 영역 끝 ========== -->
<script id="option-item-template" type="text/x-handlebars-template">
    <dl class="row product-option-info product-option-tmpl mb0" data-option-name="{{option_name}}" data-price="{{price}}" data-total-price="{{price}}">
        <dt class="col-xs-4"><span>{{option_name}}</span></dt>
        <dd class="col-xs-4">
            <div class="input-group input-group-sm">
                <input type="num" class="form-control" value="1" min="1" style="ime-mode: disabled; vertical-align: middle">
                <span class="input-group-btn">
                    <a href="#" class="qty-up btn btn-success" data-value="+1"><i class="fa fa-caret-up"></i></a>
                </span>
                <span class="input-group-btn">
                    <a href="#" class="qty-down btn btn-success" data-value="-1"><i class="fa fa-caret-down"></i></a>
                </span>
            </div>
        </dd>
        <dd class="col-xs-4 text-right">
            <span>
                <strong class='product-price'>{{price_value}}원</strong>
                <a href="#" class='btn btn-xs btn-danger btn-option-remove'>
                    <i class="fa fa-remove"></i>
                </a>
            </span>
        </dd>
    </dl>
</script>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/product-detail.js?ver=<%=System.currentTimeMillis()%>"></script>
<%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
