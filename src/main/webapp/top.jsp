<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
HttpSession hs = request.getSession();
String aid = (String)hs.getAttribute("aid");		//아이디 
String aname = (String)hs.getAttribute("aname");	//이름 
String aemail = (String)hs.getAttribute("aemail");	//이메일 
String atel = (String)hs.getAttribute("atel");		//연락처 
String dept = (String)hs.getAttribute("dept");		//부서 
String aprv = (String)hs.getAttribute("aprv");		//직책
String rspofc = (String)hs.getAttribute("rspofc");	//가입승인 
String adate = (String)hs.getAttribute("adate");	//가입날짜
%>
<header class="headercss">
    <div class="header_div">
        <p><img src="./img/logo.png" class="logo_sm"> <a href="./admin_list.do">ADMINISTRATOR</a></p>
        <p><%=aname%> 관리자 <a href="./add_master.jsp">[개인정보 수정]</a> <a href="./logout.jsp">[로그아웃]</a></p>
    </div>
</header>
<nav class="navcss">
    <div class="nav_div">
        <ol>
            <li title="쇼핑몰 상품관리"><a href="./admin_list.do">쇼핑몰 관리자 리스트</a></li>
            <li title="쇼핑몰 상품관리">쇼핑몰 상품관리</li>
            <li title="쇼핑몰 기본설정">쇼핑몰 기본설정</li>
            <li title="쇼핑몰 공지사항">쇼핑몰 공지사항</li>
        </ol>
    </div>
</nav>