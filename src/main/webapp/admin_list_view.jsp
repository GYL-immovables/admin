<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
//최근가입순 관리자 리스트
//0아이디 1이름 2이메일 3전화번호 4부서 5직책 6가입승인 7가입날짜
ArrayList<ArrayList<String>> alladmin = (ArrayList<ArrayList<String>>)request.getAttribute("alladmin");
%>
<section>
    <p>신규등록 관리자</p>
    <ol class="new_admin_title2">
        <li>NO</li>
        <li>관리자명</li>
        <li>아이디</li>
        <li>전화번호</li>
        <li>이메일</li>
        <li>담당부서</li>
        <li>담당직책</li>
        <li>가입일자</li>
        <li>승인여부</li>
    </ol>
<%
int i = 0;
int no = alladmin.size();
if(alladmin.size() == 0){	//관리자 없을때 
%>
    <ol class="new_admin_none">
        <li>신규 등록된 관리자가 없습니다.</li>
    </ol>
<%
		
}
else{	//관리자 있을때
	%>
        <form id="aprv_frm" method="get" action="./updateaprv.do">
    	<input type="hidden" name="aid" value="">
        <input type="hidden" name="aprv_to" value="">	
	<%
	
//0아이디 1이름 2이메일 3전화번호 4부서 5직책 6가입승인 7가입날짜
	while(i < alladmin.size()){
%>
    <ol class="new_admin_lists2">
        <li><%= no %></li>
        <li><%= alladmin.get(i).get(1) %></li>
        <li><%= alladmin.get(i).get(0) %></li>
        <li><%= alladmin.get(i).get(3) %></li>
        <li><%= alladmin.get(i).get(2) %></li>
        <li><%= alladmin.get(i).get(4) %></li>
        <li><%= alladmin.get(i).get(5) %></li>
        <li><%= alladmin.get(i).get(7).substring(0,10)%></li>
        <li>
        <!-- select 쿼리문에 사용할 관리자아이디와 가입여부를 무엇으로 변경할지 hidden에 담아 보냄 -->
    
        	<%
        	if(alladmin.get(i).get(6).equals("Y")){
        		%>
            <input type="button" value="미승인" class="new_addbtn2" title="미승인" onclick="aprv_btn('<%= alladmin.get(i).get(0) %>','N')">
        		<%
        	}else{
        		%>
            <input type="button" value="승인" class="new_addbtn1" title="승인" onclick="aprv_btn('<%= alladmin.get(i).get(0) %>','Y')">
        		<%
        	}
        	%>
        </form>
        </li>
    </ol>	
<%
		
	no--;
	i++;
	}
}
%>
    
</section>
<section></section>
<section></section>
<script>
function aprv_btn(id,e){
	aprv_frm.aid.value = id;
	aprv_frm.aprv_to.value = e;
	aprv_frm.submit();
}
</script>