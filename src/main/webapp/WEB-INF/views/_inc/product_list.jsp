<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<div class="row multi-columns-row product-list">
    <c:choose>
        <c:when test="${_productList != null && fn:length(_productList) > 0}">
            <c:forEach var="item" items="${_productList}" varStatus="status">
                <div class="product-item col-lg-3 col-md-3 col-sm-4 col-xs-6">
                    <a href="${_productItemUrl}/${item.id}">
                        <div class="title-img" style="background-image: url(${item.listImg.fileUrl})">
                            <span class='sr-only'>이미지</span>
                        </div>
                        <h3>${item.name}</h3>
                        <p class='price'>
                            <c:choose>
                                <c:when test="${item.salePrice > 0}">
                                    <span class='cancel-price'>
                                        <fmt:formatNumber value="${item.price}" pattern="#,###" />
                                        원
                                    </span>
                                    <span class='sale-price'>
                                        <fmt:formatNumber value="${item.salePrice}" pattern="#,###" />
                                        원
                                    </span>
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