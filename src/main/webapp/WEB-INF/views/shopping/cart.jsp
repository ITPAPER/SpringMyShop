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
                    <div class="text-center" style='padding-top: 100px; padding-bottom: 200px;'>장바구니가 비었습니다.</div>
                </c:when>
                <c:otherwise>
                    <form id="cart-form" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/shopping/order">
                        <table class='table'>
                            <colgroup>
                                <col width="30" />
                                <col width="110" />
                                <col />
                                <col width="150" />
                                <col width="100" />
                                <col width="70" />
                                <col width="120" />
                                <col width="120" />
                                <col width="30" />
                            </colgroup>
                            <thead>
                                <tr>
                                    <th class='text-center'><input type="checkbox" name="all_check" id="all_check" checked /></th>
                                    <th class='text-center'>-</th>
                                    <th class='text-center'>제품명</th>
                                    <th class='text-center'>옵션</th>
                                    <th class='text-center'>단가</th>
                                    <th class='text-center'>수량</th>
                                    <th class='text-center'>합계</th>
                                    <th class='text-center'>결제금액</th>
                                    <th class='text-center'>-</th>
                                </tr>
                            </thead>
                            <c:forEach var="item" items="${output}" varStatus="status">
                                <tr class="cart-item cart-item-${item.id}">
                                    <td class='text-center' rowspan="${fn:length(item.orderOption)}">
                                        <input type='checkbox' name='cart_id[]' class="cart_id" value="${item.id}" checked />
                                    </td>
                                    <td class='text-center' rowspan="${fn:length(item.orderOption)}">
                                        <a href="${pageContext.request.contextPath}/product/detail/${item.productId}">
                                            <img src="${item.titleImg.thumbnailUrl}" width="50" />
                                        </a>
                                    </td>
                                    <td class='text-center' rowspan="${fn:length(item.orderOption)}">
                                        <a href="${pageContext.request.contextPath}/product/detail/${item.productId}">${item.name}</a>
                                    </td>
                                    <c:forEach var="option" items="${item.orderOption}" varStatus="optionStatus">
                                        <c:if test="${optionStatus.index > 0}">
                                            <tr class="cart-item-${item.id}">
                                        </c:if>
                                        <td class='text-center'>${option.name}</td>
                                        <td class='text-center'>
                                            <span class='price' data-value="${option.price}">
                                                <fmt:formatNumber value="${option.price}" pattern="#,###" />
                                            </span>
                                            <span>원</span>
                                        </td>
                                        <td class='text-center'>${option.qty}</td>
                                        <td class='text-center text-primary'>
                                            <span class='total' data-value="${option.total}">
                                                <fmt:formatNumber value="${option.total}" pattern="#,###" />
                                            </span>
                                            <span>원</span>
                                        </td>
                                        <c:if test="${optionStatus.index == 0}">
                                            <td class="text-center">
                                                <strong class='text-warning'><span class='order-price' data-value="${item.orderPrice}">
                                                        <fmt:formatNumber value="${item.orderPrice}" pattern="#,###" />
                                                    </span>원</strong>
                                            </td>
                                            <td class="text-center">
                                                <button class="btn-cart-remove btn btn-danger btn-xs" data-cart-id="${item.id}" data-product-name="${item.name}">
                                                    <i class="fa fa-trash"></i>
                                                </button>
                                            </td>
                                        </c:if>
                                    </tr>
                                </c:forEach>
                            </c:forEach>
                        </table>
                        <hr />
                        <div class="text-center">
                            <button type="submit" class="btn btn-primary">선택항목 주문하기</button>
                            <button type="button" class="btn btn-warning" id="check-delete">선택항목 삭제하기</button>
                        </div>
                    </form>
                </c:otherwise>
            </c:choose>
        </div>
    </div>
</div>
<!--// ========== 컨텐츠 영역 끝 ========== -->
<script>
$(function() {
    $(".btn-cart-remove").click(function(e) {
        e.preventDefault();
        const current = $(this);
        const cartId = current.data('cart-id');
        const productName = current.data('product-name');
        
        swal({
            title: '확인',
            text: '정말 ' + productName + '(을)를 삭제하시겠습니까?', 
            type: "question",
            showCancelButton: true
        }).then(function(result) {
            if (result.value) {
                $.delete(ROOT_URL + "/rest/shopping/cart", {
                    cart_id: [cartId] // 배열로 묶어서 전송
                }, function(json) {
                    $('.cart-item-' + cartId).remove();
                });
            }
        });
    });
    
    $("#all_check").change(function() {
        $(".cart_id").prop('checked', $(this).is(':checked'));
    });
    
    $("#check-delete").click(function() {
        const cartId = [];
        const obj = $(".cart_id:checked");
        
        if (obj.length < 1) {
            swal('알림', '선택된 항목이 없습니다.');
            return false;
        }
        
        swal({
            title: '확인',
            text: '정말 ' + obj.length + '개의 항목을 삭제하시겠습니까?', 
            type: "question",
            showCancelButton: true
        }).then(function(result) {
            if (result.value) {
                obj.each(function(i, v) {
                    cartId.push($(v).val());
                });
                
                $.delete(ROOT_URL + "/rest/shopping/cart", {
                    cart_id: cartId
                }, function(json) {
                    swal({
                        title: '확인',
                        text: '삭제되었습니다.'
                    }).then(function(result) {
                        obj.each(function(i, v) {
                            $('.cart-item-' + $(v).val()).remove();
                        });
                        $('html, body').animate({scrollTop : 0}, 400);
                    });
                });
            }
        });
    });
});
</script>
<%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
