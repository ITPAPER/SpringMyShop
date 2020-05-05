<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/top.jsp"%>
<!-- ========== 컨텐츠 영역 시작 ========== -->
<div class="container">
    <div class="row">
        <div class="col-md-8 col-md-offset-2">
            <div class="page-header">
                <h1>회원가입</h1>
            </div>
            <form id="join-form" class="form-horizontal" method="post" action="${pageContext.request.contextPath}/rest/account/join">
                <div class="form-group">
                    <label for="user_id" class="col-sm-2 control-label">아이디</label>
                    <div class="col-sm-10">
                        <div class="input-group">
                            <input type="text" name="user_id" class="form-control" id="user_id" placeholder="영문,숫자조합 최대 30글자">
                            <span class="input-group-btn">
                                <button type="button" id="id-unique-check" class="btn btn-success">중복검사</button>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_pw" class="col-sm-2 control-label">비밀번호</label>
                    <div class="col-sm-10">
                        <input type="password" name="user_pw" class="form-control" id="user_pw" placeholder="영문,숫자,특수문자 조합 최대 30글자" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_pw_confirm" class="col-sm-2 control-label">비밀번호 확인</label>
                    <div class="col-sm-10">
                        <input type="password" name="user_pw_confirm" class="form-control" id="user_pw" placeholder="영문,숫자,특수문자 조합 최대 30글자" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_name" class="col-sm-2 control-label">이름</label>
                    <div class="col-sm-10">
                        <input type="text" name="user_name" class="form-control" id="user_name" placeholder="한글, 최대 30글자" />
                    </div>
                </div>
                <div class="form-group">
                    <label for="email" class="col-sm-2 control-label">이메일</label>
                    <div class="col-sm-10">
                        <div class="input-group">
                            <input type="text" name="email" class="form-control" id="email" />
                            <span class="input-group-btn">
                                <button type="button" id="email-unique-check" class="btn btn-success">중복검사</button>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="phone" class="col-sm-2 control-label">연락처</label>
                    <div class="col-sm-10">
                        <input type="text" name="phone" class="form-control" id="phone" placeholder="`-`없이 숫자만 입력" />
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
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender1" value="M" checked> 남자
                        </label>
                        <label class="radio-inline">
                            <input type="radio" name="gender" id="gender1" value="F"> 여자
                        </label>
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_id" class="col-sm-2 control-label">주소</label>
                    <div class="col-sm-4">
                        <div class="input-group">
                            <input type="text" name="postcode" class="form-control" id="postcode" maxlength="5" readonly>
                            <span class="input-group-btn">
                                <button type="button" class="btn btn-info postcode-finder" data-postcode="#postcode" data-addr1="#addr1" data-addr2="#addr2" data-frame="#postcode-frame">우편번호검색</button>
                            </span>
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-10 col-sm-offset-2">
                        <input type="text" name="addr1" class="form-control" id="addr1" readonly />
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-10 col-sm-offset-2">
                        <input type="text" name="addr2" class="form-control" id="addr2" placeholder="나머지 주소" />
                    </div>
                </div>
                <div class="form-group" style="margin-bottom: 0">
                    <div class="col-sm-10 col-sm-offset-2">
                        <div id="postcode-frame" style="display: none; border: 1px solid; width: 100%; height: 300px; margin: 5px 0; position: relative">
                            <img src="//t1.daumcdn.net/postcode/resource/images/close.png" id="btnFoldWrap" style="cursor: pointer; position: absolute; right: 0px; top: -1px; z-index: 1" onclick="foldPostcode(this)" alt="접기 버튼">
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <label for="user_id" class="col-sm-2 control-label">프로필 사진</label>
                    <div class="col-sm-10">
                        <div class="image-upload">
                            <label for="photo" class='preview-btn' style="width: 150px; height: 150px;"></label>
                            <input id="photo" type="file" name="photo" accept="image/jpg, image/gif, image/png" />
                        </div>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-10 col-sm-offset-2 text-center">
                        <button type="submit" class="btn btn-primary">회원가입</button>
                        <button type="reset" class="btn btn-warning">다시작성</button>
                    </div>
                </div>
            </form>
        </div>
    </div>
</div>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/account-join.js?ver=<%=System.currentTimeMillis()%>"></script>
<!--// ========== 컨텐츠 영역 끝 ========== -->
<%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
