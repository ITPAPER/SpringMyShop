<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/top.jsp"%>
<!-- 캐러셀 -->
<div id="index-carousel" class="carousel slide" data-ride="carousel">
    <!-- Indicators -->
    <ol class="carousel-indicators">
        <li data-target="#index-carousel" data-slide-to="0" class="active"></li>
        <li data-target="#index-carousel" data-slide-to="1"></li>
        <li data-target="#index-carousel" data-slide-to="2"></li>
    </ol>
    <!-- Wrapper for slides -->
    <div class="carousel-inner" role="listbox">
        <div class="item active">
        <div class="bg" style="background-image: url(${pageContext.request.contextPath}/assets/img/title-img0.jpg)">
                <div class="carousel-caption">
                    <h1>최고만 엄선한 Best 상품 컬렉션</h1>
                    <a href="${pageContext.request.contextPath}/product/best" class="btn btn-warning">Go shopping</a>
                </div>
                </div>
        </div>
        <div class="item">
        <div class="bg" style="background-image: url(${pageContext.request.contextPath}/assets/img/title-img1.jpg)">
            <div class="carousel-caption">
                <h1>봄을 부르는 신상품 모음전</h1>
                <a href="${pageContext.request.contextPath}/product/new" class="btn btn-warning">Go shopping</a>
            </div>
            </div>
        </div>
        <div class="item">
        <div class="bg" style="background-image: url(${pageContext.request.contextPath}/assets/img/title-img2.jpg)">
            <div class="carousel-caption">
                <h1>추천상품 노마진 기획전</h1>
                <a href="${pageContext.request.contextPath}/product/vote" class="btn btn-warning">Go shopping</a>
            </div>
            </div>
        </div>
    </div>
</div>
<!-- ========== 컨텐츠 영역 시작 ========== -->
<div class="container">
    <div class="best">
        <div class="page-header clearfix product-list-title">
            <div class="pull-left">
                <h2>
                    <strong class='title'>Best Item</strong> <small>인기폭주 베스트 아이템</small>
                </h2>
            </div>
            <div class="pull-right">
                <a href="${pageContext.request.contextPath}/product/best" class="btn btn-xs btn-link">more</a>
            </div>
        </div>
        <c:set var="_productList" value="${bestList}" />
        <c:set var="_productItemUrl" value="${pageContext.request.contextPath}/product/best/detail" />
        <%@ include file="/WEB-INF/views/_inc/product_list.jsp"%>
    </div>
    <div class="new">
        <div class="page-header clearfix product-list-title">
            <div class="pull-left">
                <h2>
                    <strong class='title'>New Item</strong> <small>트랜디한 신상품</small>
                </h2>
            </div>
            <div class="pull-right">
                <a href="${pageContext.request.contextPath}/product/new" class="btn btn-xs btn-link">more</a>
            </div>
        </div>
        <c:set var="_productList" value="${newList}" />
        <c:set var="_productItemUrl" value="${pageContext.request.contextPath}/product/new/detail" />
        <%@ include file="/WEB-INF/views/_inc/product_list.jsp"%>
    </div>
    <div class="vote">
        <div class="page-header clearfix product-list-title">
            <div class="pull-left">
                <h2>
                    <strong class='title'>Vote Item</strong> <small>좋은 것만 모아서 추천상품</small>
                </h2>
            </div>
            <div class="pull-right">
                <a href="${pageContext.request.contextPath}/product/vote" class="btn btn-xs btn-link">more</a>
            </div>
        </div>
        <c:set var="_productList" value="${voteList}" />
        <c:set var="_productItemUrl" value="${pageContext.request.contextPath}/product/vote/detail" />
        <%@ include file="/WEB-INF/views/_inc/product_list.jsp"%>
    </div>
</div>
<!--// ========== 컨텐츠 영역 끝 ========== -->
<%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
