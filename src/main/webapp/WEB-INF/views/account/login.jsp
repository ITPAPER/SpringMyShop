<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/_inc/top.jsp" %>

<!-- ========== 컨텐츠 영역 시작 ========== -->
<div class="container">
    <div class="row">
        <div class="col-md-4 col-md-offset-4">
            <div class="page-header">
                <h1>로그인</h1>
            </div>
            <form id="login-form" class="form" method="post" action="${pageContext.request.contextPath}/rest/account/login">
                <div class="form-group">
                    <label for="user_id" class="sr-only control-label">아이디</label>
                    <input type="text" name="user_id" class="form-control" id="user_id" placeholder="아이디"/>
                </div>
                <div class="form-group">
                    <label for="user_pw" class="sr-only control-label">비밀번호</label>
                    <input type="text" name="user_pw" class="form-control" id="user_pw" placeholder="비밀번호"/>
                </div>
                <div class="form-group">
                    <button type="submit" class="btn btn-primary btn-block">로그인</button>
                </div>
                <div class="form-group">
                    <a href="${pageContext.request.contextPath}/account/join" class="btn btn-success btn-block">회원가입</a>
                </div>
            </form>
        </div>
    </div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/account-login.js?ver=<%=System.currentTimeMillis()%>"></script>
<!--// ========== 컨텐츠 영역 끝 ========== -->

<%@ include file="/WEB-INF/views/_inc/bottom.jsp" %>
