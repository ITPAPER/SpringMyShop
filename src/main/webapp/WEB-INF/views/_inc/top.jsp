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
                data-target="#menu-container" aria-expanded="false">
                <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            <a class="navbar-brand" href="#">SpringMyShop</a>
        </div>
        <!-- /.navbar-collapse -->

        <div class="collapse navbar-collapse" id="menu-container">
            <ul class="nav navbar-nav navbar-left">
                <li><a href="#">Link</a></li>
                <li><a href="#">Link</a></li>
            </ul>
            <ul class="nav navbar-nav navbar-right">
                <li><a href="#" title="로그인"><i class="fas fa-sign-in-alt"></i><span class="hidden-md hidden-lg">&nbsp;로그인</span></a></li>
                <li><a href="#" title="회원가입"><i class="fas fa-user-plus"></i><span class="hidden-md hidden-lg">&nbsp;회원가입</span></a></li>
                <li><a href="#" title="장바구니"><i class="fas fa-shopping-cart"></i><span class="hidden-md hidden-lg">&nbsp;장바구니</span></a></li>
                <li><a href="#" title="주문조회"><i class="fas fa-shopping-bag"></i><span class="hidden-md hidden-lg">&nbsp;주문조회</span></a></li>
            </ul>
        </div>
    </div>
    <!-- /.container-fluid -->
</nav>
<!--// ========== 상단 공통 영역 끝 ========== -->

