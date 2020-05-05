<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/_inc/top.jsp" %>

<!-- ========== 컨텐츠 영역 시작 ========== -->
<div class="container">
    <div class="best">
        <div class="page-header">
            <h2>Best Item <small>인기폭주 베스트 아이템</small></h2>
        </div>
        <div class="row product-list">
            <c:choose>
                <c:when test="${bestList != null && fn:length(bestList) > 0}">
                    <c:forEach var="item" items="${bestList}" varStatus="status">
                        <div class="col-md-3 col-sm-4 col-sm-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/product/best/${item.id}">
                                <div class="title-img" style="background-image: url(${item.listImg.fileUrl})"><span class='sr-only'>이미지</span></div>
                                <h3>${item.name}</h3>
                                <p class='price'>
                                    <c:choose>
                                        <c:when test="${item.salePrice > 0}">
                                            <span class='cancel-price'><fmt:formatNumber value="${item.price}" pattern="#,###" />원</span>
                                            <span class='sale-price'><fmt:formatNumber value="${item.salePrice}" pattern="#,###" />원</span>
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber value="${item.price}" pattern="#,###" />원
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                                <p class='desc'>${item.description}</p>
                            </a>
                        </div>
                    </c:forEach>
                </c:when>
            </c:choose>
        </div>
    </div>
    
    <div class="new">
        <div class="page-header">
            <h2>New Item <small>트랜디한 신상품</small></h2>
        </div>
        <div class="row product-list">
            <c:choose>
                <c:when test="${newList != null && fn:length(newList) > 0}">
                    <c:forEach var="item" items="${newList}" varStatus="status">
                        <div class="col-md-3 col-sm-4 col-sm-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/product/new/${item.id}">
                                <div class="title-img" style="background-image: url(${item.listImg.fileUrl})"><span class='sr-only'>이미지</span></div>
                                <h3>${item.name}</h3>
                                <p class='price'>
                                    <c:choose>
                                        <c:when test="${item.salePrice > 0}">
                                            <span class='cancel-price'><fmt:formatNumber value="${item.price}" pattern="#,###" />원</span>
                                            <span class='sale-price'><fmt:formatNumber value="${item.salePrice}" pattern="#,###" />원</span>
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber value="${item.price}" pattern="#,###" />원
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                                <p class='desc'>${item.description}</p>
                            </a>
                        </div>
                    </c:forEach>
                </c:when>
            </c:choose>
        </div>
    </div>
    
    <div class="vote">
        <div class="page-header">
            <h2>Vote Item <small>좋은 것만 모아서 추천상품</small></h2>
        </div>
        <div class="row product-list">
            <c:choose>
                <c:when test="${voteList != null && fn:length(voteList) > 0}">
                    <c:forEach var="item" items="${voteList}" varStatus="status">
                        <div class="col-md-3 col-sm-4 col-sm-4 col-xs-6">
                            <a href="${pageContext.request.contextPath}/product/vote/${item.id}">
                                <div class="title-img" style="background-image: url(${item.listImg.fileUrl})"><span class='sr-only'>이미지</span></div>
                                <h3>${item.name}</h3>
                                <p class='price'>
                                    <c:choose>
                                        <c:when test="${item.salePrice > 0}">
                                            <span class='cancel-price'><fmt:formatNumber value="${item.price}" pattern="#,###" />원</span>
                                            <span class='sale-price'><fmt:formatNumber value="${item.salePrice}" pattern="#,###" />원</span>
                                        </c:when>
                                        <c:otherwise>
                                            <fmt:formatNumber value="${item.price}" pattern="#,###" />원
                                        </c:otherwise>
                                    </c:choose>
                                </p>
                                <p class='desc'>${item.description}</p>
                            </a>
                        </div>
                    </c:forEach>
                </c:when>
            </c:choose>
        </div>
    </div>
</div>
<!--// ========== 컨텐츠 영역 끝 ========== -->

<%@ include file="/WEB-INF/views/_inc/bottom.jsp" %>
