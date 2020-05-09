<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page trimDirectiveWhitespaces="true"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:if test="${cookie.ezenPopup.value != 'Y'}">
    <!-- 이젠 팝업 공지 -->
    <div id='ezen-notice-popup' style='position: absolute; left: 50%; top: 50%; padding: 30px 50px; margin-left: -215px; margin-top: -250px; background-color: rgb(43, 43, 43); color: #fff; font-size: 16px; width: 400px; z-index: 9999999;'>
        <h1 style='border-bottom: 1px solid #eee; font-size: 24px'>학생 포트폴리오 입니다.</h1>
        <p>
            이 사이트는 "
            <a href="http://it.ezenac.co.kr/" target="_blank" style='color: #fff; display: inline'>이젠IT아카데미</a>
            "에서 진행된 "사물인터넷(IoT) 시스템 개발자" 수료생들의 취업을 위한 포트폴리오 사이트 입니다.
        </p>
        <p>실제 운영을 위한 사이트가 아님에 착오 없으시기 바랍니다.</p>
        <p style='text-align: right'>
            <a href='#' style='color: white' onclick="document.cookie = 'ezenPopup=Y;path=/'; $('#ezen-notice-popup').hide()">[다시보지않음]</a>
        </p>
    </div>
</c:if>
</body>
</html>