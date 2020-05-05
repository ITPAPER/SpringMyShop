<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/_inc/top.jsp" %>

<!-- ========== 컨텐츠 영역 시작 ========== -->
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="page-header">
                <h1>회원가입</h1>
            </div>
            
            <form id="join-form" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/api/account/join">
                <div class="form-group">
                    <label for="user_id" class="col-sm-2 control-label">아이디</label>
                    <div class="col-sm-10">
                        <div class="input-group">
                            <input type="text" name="user_id" class="form-control" id="user_id" placeholder="영문,숫자조합 최대 30글자">
                            <span class="input-group-btn">
                                <button type="button" id="id-unique-check" class="btn btn-primary">중복검사</button>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_pw" class="col-sm-2 control-label">비밀번호</label>
                    <div class="col-sm-10">
                        <input type="text" name="user_pw" class="form-control" id="user_pw" placeholder="영문,숫자,특수문자 조합 최대 30글자" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_pw_confirm" class="col-sm-2 control-label">비밀번호 확인</label>
                    <div class="col-sm-10">
                        <input type="text" name="user_pw_confirm" class="form-control" id="user_pw" placeholder="영문,숫자,특수문자 조합 최대 30글자" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_name" class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-10">
                        <input type="text" name="user_name" class="form-control" id="user_name" placeholder="최대 30글자" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">이메일</label>
                    <div class="col-sm-10">
                        <div class="input-group">
                            <input type="text" name="email" class="form-control" id="email" />
                            <span class="input-group-btn">
                                <button type="button" id="id-unique-check" class="btn btn-primary">중복검사</button>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="birthday" class="col-sm-2 control-label">생년월일</label>
                    <div class="col-sm-10">
                        <input type="date" name="birthday" class="form-control" id="birthday" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="gender1" class="col-sm-2 control-label">성별</label>
                    <div class="col-sm-10">
                        <input type="date" name="birthday" class="form-control" id="birthday" />
                    </div>
                </div>
            </form>
        </div>
    </div>
    
</div>
<!--// ========== 컨텐츠 영역 끝 ========== -->

<%@ include file="/WEB-INF/views/_inc/bottom.jsp" %>
