<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/_inc/top.jsp" %>

<!-- ========== 컨텐츠 영역 시작 ========== -->
<div class="container">
    <div class="best">
        <div class="page-header clearfix">
            <div class="pull-left">
                <h2>Best Item <small>인기폭주 베스트 아이템</small></h2>
            </div>
            <div class="pull-right">
                <a href="#" class="btn btn-xs btn-link">more</a>
            </div>
        </div>
        <c:set var="_productList" value="${bestList}"/>
        <c:set var="_productItemUrl" value="${pageContext.request.contextPath}/product/best" />
        <%@ include file="/WEB-INF/views/_inc/product_list.jsp" %>
    </div>
    
    <div class="new">
        <div class="page-header clearfix">
            <div class="pull-left">
                <h2>New Item <small>트랜디한 신상품</small></h2>
            </div>
            <div class="pull-right">
                <a href="#" class="btn btn-xs btn-link">more</a>
            </div>
        </div>
        <c:set var="_productList" value="${newList}"/>
        <c:set var="_productItemUrl" value="${pageContext.request.contextPath}/product/new" />
        <%@ include file="/WEB-INF/views/_inc/product_list.jsp" %>
    </div>
    
    <div class="vote">
        <div class="page-header clearfix">
            <div class="pull-left">
                <h2>Vote Item <small>좋은 것만 모아서 추천상품</small></h2>
            </div>
            <div class="pull-right">
                <a href="#" class="btn btn-xs btn-link">more</a>
            </div>
        </div>
        <c:set var="_productList" value="${voteList}"/>
        <c:set var="_productItemUrl" value="${pageContext.request.contextPath}/product/vote" />
        <%@ include file="/WEB-INF/views/_inc/product_list.jsp" %>
    </div>
</div>
<!--// ========== 컨텐츠 영역 끝 ========== -->

<%@ include file="/WEB-INF/views/_inc/bottom.jsp" %>
