<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/top.jsp"%>
<div class="container">
    <div class="page-header">
        <h1>여기까지 입니다.</h1>
    </div>
    <p>이 사이트는 포트폴리오에 도움을 주고자 준비한 예제입니다.</p>
    <p>더이상의 기능구현은 스스로 사냥하는 방법을 알려주는데 방해가 된다는 판단이 되어 여기까지만 제시하겠습니다.</p>
    <p>소스코드가 모두 공개되는 만큼 스스로 내용을 분석하고 파악할 수 있도록 해 봅시다.</p> 
    <hr />
    
    
    <h2>주문할 상품 데이터 조회 내역</h2>
    <ul class="list-group">
        <c:forEach var="item" items="${output}" varStatus="status">
            <li class="list-group-item">
                <pre>${item}</pre>
            </li>
        </c:forEach>
    </ul>
</div>
<%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>