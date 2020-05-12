<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/top.jsp"%>
<!-- ========== 컨텐츠 영역 시작 ========== -->

<div class="container">

    <div class="row">
        <div class="col-md-10 col-md-offset-1">
            <div class="page-header">
                <h1>장바구니</h1>
            </div>
            <c:choose>
                <c:when test="${output == null || fn:length(output) == 0}">
                    <div class="text-center" style='padding-top: 100px; padding-bottom: 200px;'>
                        장바구니가 비었습니다.
                    </div>
                </c:when>
                <c:otherwise>
                    <form id="join-form" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/shopping/order">
                        <table class='table'>
                            <thead>
                                <tr>
                                    <th class='text-center'>-</th>
                                    <th class='text-center'>-</th>
                                    <th class='text-center'>제품명</th>
                                    <th class='text-center'>옵션</th>
                                    <th class='text-center'>단가</th>
                                    <th class='text-center'>수량</th>
                                    <th class='text-center'>합계</th>
                                </tr>
                            </thead>
                            <c:forEach var="item" items="${output}" varStatus="status">
                                <tr>
                                    <td class='text-center' rowspan="${fn:length(item.options)}">
                                        <input type='checkbox' name='cart_id' value="${item.id}" checked />
                                    </td>
                                    <td>
                                        <img src="${item.listImg.thumbnailUrl}" width="150" />
                                    </td>
                                    <td>${item.name}</td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                </tr>
                            </c:forEach>
                        </table>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </div>

</div>


<!--// ========== 컨텐츠 영역 끝 ========== -->
<%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
