<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
HttpSession hs = request.getSession();
String aid = (String)hs.getAttribute("aid");
String aname = (String)hs.getAttribute("aname");
String aemail = (String)hs.getAttribute("aemail");
String atel = (String)hs.getAttribute("atel");
String dept = (String)hs.getAttribute("dept");
String rspofc = (String)hs.getAttribute("rspofc");
String adate = (String)hs.getAttribute("adate");
%>
<header class="headercss">
    <div class="header_div">
        <p><img src="./img/logo.png" class="logo_sm"> ADMINISTRATOR</p>
        <p><%=aname%> 관리자 <a href="#">[개인정보 수정]</a> <a href="./logout.jsp">[로그아웃]</a></p>
    </div>
</header>
<nav class="navcss">
    <div class="nav_div">
        <ol>
            <li title="쇼핑몰 관리자 리스트"><a>쇼핑몰 관리자 리스트</a></li>
           <li title="쇼핑몰 상품관리"><a>쇼핑몰 상품관리</a></li>
            <li title="쇼핑몰 기본설정"><a>쇼핑몰 기본설정</a></li>
            <li title="쇼핑몰 공지사항"><a href='./notice_list.jsp'>쇼핑몰 공지사항</a></li>
        </ol>
    </div>
</nav>