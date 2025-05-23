<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>공지사항 리스트 페이지</title>
    <link rel="stylesheet" type="text/css" href="./css/basic.css?v=2">
    <link rel="stylesheet" type="text/css" href="./css/login.css?v=10">
    <link rel="stylesheet" type="text/css" href="./css/main.css?v=10">
    <link rel="stylesheet" type="text/css" href="./css/notice.css?v=10">
    <link rel="icon" href="./img/logo.png" sizes="128x128">
    <link rel="icon" href="./img/logo.png" sizes="64x64">
    <link rel="icon" href="./img/logo.png" sizes="32x32">
    <link rel="icon" href="./img/logo.png" sizes="16x16">
    <script src="./notice_list.js?v=2"></script>
</head>
<body>
	<!-- 상단 로고 & 메뉴 -->
	<%@include file="./top.jsp" %>
	<!-- 상단 로고 & 메뉴 -->
	<!-- 공지사항 리스트 -->
	<%@include file="./notice_list_view.jsp" %>
	<!-- 공지사항 리스트 -->
	<!-- 카피라이터 및 하단 -->
	<%@include file="./index_footer.jsp" %>
	<!-- 카피라이터 및 하단 -->
</body>
</html>