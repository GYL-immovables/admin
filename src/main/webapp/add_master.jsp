<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
HttpSession hs = request.getSession();

String aid = (hs.getAttribute("aid") != null) ? hs.getAttribute("aid").toString() : "";
String aname = (hs.getAttribute("aname") != null) ? hs.getAttribute("aname").toString() : "";
String aemail = (hs.getAttribute("aemail") != null) ? hs.getAttribute("aemail").toString() : "";

//String aid = (String)hs.getAttribute("aid");		//아이디 
//String aname = (String)hs.getAttribute("aname");	//이름 
//String aemail = (String)hs.getAttribute("aemail");	//이메일 
String atel = (String)hs.getAttribute("atel");		//연락처 
String dept = (String)hs.getAttribute("dept");		//부서 
String aprv = (String)hs.getAttribute("aprv");		//직책
String rspofc = (String)hs.getAttribute("rspofc");	//가입승인 
String adate = (String)hs.getAttribute("adate");	//가입날짜
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>관리자 등록 페이지</title>
    <link rel="stylesheet" type="text/css" href="./css/basic.css">
    <link rel="stylesheet" type="text/css" href="./css/login.css?v=1">
    <link rel="icon" href="./img/logo.png" sizes="128x128">
    <link rel="icon" href="./img/logo.png" sizes="64x64">
    <link rel="icon" href="./img/logo.png" sizes="32x32">
    <link rel="icon" href="./img/logo.png" sizes="16x16">
</head>
<body>
	<!-- 상단 로고 & 메뉴 -->
    <header class="admin_title_add">
        <p><img src="./img/logo.png" class="logo_sm"> ADMINISTRATOR ADD</p>
    </header>
    <!-- 상단 로고 & 메뉴 -->
    <!-- 관리자 등록 -->
    <section class="admin_bgcolor_add">
    	<%@include file="./add_master_view.jsp" %>
   	</section>
    <!-- 관리자 등록 -->
    <!-- 카피라이터 및 하단 -->
    <footer class="admin_copy">
        <div>
            Copyright ⓒ 2024 shopbag All rights reserved.
        </div>
    </footer>
    <!-- 카피라이터 및 하단 -->
</body>
</html>