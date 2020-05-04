<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/_inc/header.jsp"%>

<!-- ========== 상단 공통 영역 시작 ========== -->
<nav class="navbar navbar-inverse">
    <div class="container">
        <!-- Brand and toggle get grouped for better mobile display -->
        <div class="navbar-header">
            <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">SpringMySite</a>
        </div>
        <!-- /.navbar-collapse -->

        <ul class="nav navbar-nav navbar-left">
            <li><a href="#">Link</a></li>
            <li><a href="#">Link</a></li>
        </ul>
        <ul class="nav navbar-nav navbar-right">
            <li class="dropdown">
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">Dropdown <span class="caret"></span></a>
                <ul class="dropdown-menu">
                    <li><a href="#">회원가입</a></li>
                    <li><a href="#">로그인</a></li>
                    <li><a href="#">장바구니</a></li>
                    <li><a href="#">주문확인</a></li>
                </ul>
            </li>
        </ul>
    </div>
    <!-- /.container-fluid -->
</nav>
<!--// ========== 상단 공통 영역 끝 ========== -->

