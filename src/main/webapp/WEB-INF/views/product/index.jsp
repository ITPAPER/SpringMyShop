<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/top.jsp"%>
<!-- ========== 컨텐츠 영역 시작 ========== -->
<div class="container">
    <div class="${category}">
        <div class="page-header clearfix product-list-title">
            <div class="pull-left">
                <h2>
                    <strong class='title'>${categoryName}</strong> <small>${categoryDesc}</small>
                </h2>
            </div>
            <div class="pull-right">
                총 <strong class="text-danger"><fmt:formatNumber value="${pageData.totalCount}" /></strong>개의 상품이 있습니다.
                <span class="text-muted">(${pageData.nowPage}/${pageData.totalPage}Pages.)</span>
            </div>
        </div>
        <form name="search-form" class="form" method="get" action="${pageContext.request.contextPath}/product/${category}">
            <div class="form-group">
                <label class="sr-only" for="keyword">검색어 입력</label>
                <div class="input-group">
                    <input type="search" name="keyword" id="keyword" class="form-control" value="${keyword}" />
                    <span class="input-group-btn">
                        <button type="submit" class="btn btn-primary">
                            <i class="fa fa-search"><span class="sr-only">검색</span></i>
                        </button>
                    </span>
                </div>
            </div>
        </form>
        <!-- 상품목록 -->
        <section>
            <c:set var="_productList" value="${productList}" />
            <c:set var="_productItemUrl" value="${pageContext.request.contextPath}/product/${category}/detail" />
            <c:set var="_keyword" value="${keyword}" />
            <%@ include file="/WEB-INF/views/_inc/product_list.jsp"%>
        </section>
        <!-- 페이지번호 구현 -->
        <nav>
            <c:set var="_pageData" value="${pageData}" />
            <c:url var="_listUrl" value="${pageContext.request.contextPath}/product/${category}" context="/">
                <c:if test="${keyword != null && keyword != ''}">
                    <c:param name="keyword" value="${keyword}"></c:param>
                </c:if>
            </c:url>
            <%@ include file="/WEB-INF/views/_inc/pagenation.jsp"%>
        </nav>
    </div>
</div>
<!--// ========== 컨텐츠 영역 끝 ========== -->
<%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
