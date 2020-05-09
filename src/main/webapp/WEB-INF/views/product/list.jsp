<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/_inc/top.jsp" %>

<!-- ========== 컨텐츠 영역 시작 ========== -->
<div class="container">
    <div class="${category}">
        <div class="page-header clearfix">
            <h2><strong class='title'>${categoryName}</strong> <small>${categoryDesc}</small></h2>
        </div>
        <c:set var="_productList" value="${productList}"/>
        <c:set var="_productItemUrl" value="${pageContext.request.contextPath}/product/${category}/detail" />
        <%@ include file="/WEB-INF/views/_inc/product_list.jsp" %>
    </div>
</div>
<!--// ========== 컨텐츠 영역 끝 ========== -->

<%@ include file="/WEB-INF/views/_inc/bottom.jsp" %>
