<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="/WEB-INF/views/_inc/top.jsp"%>

<!-- ========== 컨텐츠 영역 시작 ========== -->
<div class="container">
    <div class="visible-xs visible-sm">
        <div class="page-header">
            <h1>${output.name}</h1>
        </div>
        <p>${output.description}</p>
    </div>
    <div class="row">
        <div class="col-lg-7 col-md-7 col-sm-12 col-xs-12">
            <img src="${output.titleImg.fileUrl}" width="100%" alt="${output.name}" style="margin-top: 40px" />
        </div>
        <div class="col-lg-5 col-md-5 col-sm-12 col-xs-12">
            <div class="visible-md visible-lg">
                <div class="page-header">
                    <h1>${output.name}</h1>
                </div>
                <p>${output.description}</p>
            </div>
        </div>
    </div>
</div>
<!--// ========== 컨텐츠 영역 끝 ========== -->

<%@ include file="/WEB-INF/views/_inc/bottom.jsp"%>
