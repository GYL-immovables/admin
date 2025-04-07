<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<String> views = (ArrayList<String>) request.getAttribute("notice_v");
String filename = null;
if (views != null && views.size() > 5) {
    filename = views.get(5);
}
%>
<script src="./notice_view.js"></script>
<main class="maincss">
<section>
    <p>공지사항 확인 페이지</p>
<div class="write_view">
<ul>
    <li>공지사항 제목</li>
    <li>
       <%= views.get(1)%>
    </li>
</ul>
<ul>
    <li>글쓴이</li>
    <li>
     <%= views.get(2)%>
    </li>
</ul>
<ul>
    <li>첨부파일</li>
    <%
    if (views.get(5) != null && !views.get(5).trim().equals("")) {
    %>
        <li>
            <a href="./notice_file/<%= views.get(5)%>" target="_blank">
                <%= views.get(5) %>
            </a>
        </li>
    <%
    } else {
    %>
        <li>첨부파일 없음</li>
    <%
    }
    %>
</ul>

<ul class="ul_height">
    <li>공지내용</li>
    <li>
        <div class="notice_input3" style="overflow-y: auto;"><%= views.get(3)%></div>
    </li>
</ul>
</div>
<div class="board_btn">
    <button class="border_del" onclick="notice_info(1)">공지목록</button>
    <button class="border_add" onclick="notice_info(2)">공지수정</button>
    <button class="border_modify" style="margin-left: 8px;" onclick="notice_info(3)">공지삭제</button>
</div>
</section>
</main>
<form id="deleteForm" method="post" action="./notice_del.do">
    <input type="hidden" name="nidx" value="<%= request.getParameter("nidx") %>">
</form>