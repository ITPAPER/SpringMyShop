<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!doctype html>
<html>
<head>
<meta charset="UTF-8" />
<meta name="robots" content="noindex">
<meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no">
<meta name="description" content="이젠IT아카데미와 이젠컴퓨터아카데미에서 진행되는 모든 형태의 개발자 과정 훈련생들의 학습 예제로 활용하기 위해 제작한 샘플 사이트 입니다."/>
<meta name="keywords" content="아이티페이퍼,호쌤,쭈쌤,이젠IT아카데미와 이젠컴퓨터아카데미" />
<meta name="author" content="호쌤,쭈쌤" />
<meta property="og:type" content="website" />
<meta property="og:title" content="SpringMyShop" />
<meta property="og:description" content="이젠IT아카데미와 이젠컴퓨터아카데미에서 진행되는 모든 형태의 개발자 과정 훈련생들의 학습 예제로 활용하기 위해 제작한 샘플 사이트 입니다." />
<meta property="og:image" content="http://itproject.ezenac.co.kr/springmyshop/assets/img/title-img0.jpg" />
<meta property="og:url" content="http://itproject.ezenac.co.kr/springmyshop " />

<title>SpringMyShop</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bs3-multi-columns-row.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css?ver=<%=System.currentTimeMillis()%>" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.min.css" />
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.css" />
<style>
/** 모든 페이지에 적용되는  CSS가 포함됩니다. */
</style>
<script>
    // JS에서 사이트의 ContextPath를 식별하기 위해 변수값을 생성해 둔다.
    const ROOT_URL = "${pageContext.request.contextPath}";
</script>
<script type="text/javascript" src="//code.jquery.com/jquery-3.4.1.min.js"></script>
<script type="text/javascript" src="//stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script type="text/javascript" src="//kit.fontawesome.com/79c58b9006.js"></script>
<script type="text/javascript" src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/sweetalert/sweetalert2.all.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/ajax/ajax_helper.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/validate/jquery.validate.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/validate/additional-methods.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/ajax-form/jquery.form.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/plugins/handlebars/handlebars-v4.0.11.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/assets/js/common.js?ver=<%=System.currentTimeMillis()%>"></script>
</head>
<body>