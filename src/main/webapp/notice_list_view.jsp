<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<ArrayList<String>> notice = (ArrayList<ArrayList<String>>)request.getAttribute("result");

String total_page = notice.get(0).get(5);
int pg = 1;
if(total_page != null || !total_page.equals(null)){
	float pg2 = Integer.parseInt(total_page) / 10f;
	pg = (int)Math.ceil(pg2); 
}

String pno = request.getParameter("pageno");
if(pno == null || pno.equals("1")){
	pno = "1";
}

int currentPage = Integer.parseInt(pno);
int totalPage = pg;

int prevPage = 1;
if(currentPage > 1){
    prevPage = currentPage - 1;
}

int nextPage = totalPage;
if(currentPage < totalPage){
    nextPage = currentPage + 1;
}
%>
<main class="maincss">
<section>
    <p>공지사항 관리페이지</p>
    <div class="subpage_view">
    <ul>
        <li><input type="checkbox"></li>
        <li>NO</li>
        <li>제목</li>
        <li>글쓴이</li>
        <li>날짜</li>
        <li>조회</li>
    </ul>
    <%
	int f;
	//리스트 출력 번호를 총 데이터 갯수로 처리
	//총 데이터 갯수 - ((페이지번호 - 1) * 한페이지당 출력갯수)
	int total = Integer.parseInt(total_page) - ((Integer.parseInt(pno)-1) * 3);	
	for(f=0; f<notice.size(); f++){
%>
    <ol>
        <li><input type="checkbox"></li>
        <li><%=notice.get(f).get(0)%></li>
        <li onclick="notice_view('<%=notice.get(f).get(0)%>')"><%=notice.get(f).get(1)%></li>
        <li><%=notice.get(f).get(2)%></li>
        <li><%=notice.get(f).get(3)%></li>
        <li><%=notice.get(f).get(4)%></li>
    </ol>
    <%
	total--;
	}
	if (notice.size() == 0) {
%>	
    <ol class="none_text">
        <li>등록된 공지 내용이 없습니다.</li>
    </ol>
<%
	}
%>
    </div>
    <div class="board_btn">
        <button class="border_del" onclick="notice_info()">공지삭제</button>
        <button class="border_add" onclick="location.href='notice_write.jsp'">공지등록</button>
    </div>
    <div class="border_page">
		<ul class="pageing">
		    <li onclick="movePage(1)">
		        <img src="./ico/double_left.svg">
		    </li>
		    <li onclick="movePage(<%=prevPage%>)">
		        <img src="./ico/left.svg">
		    </li>
		
		    <% for (int i = 1; i <= totalPage; i++) { %>
		        <li onclick="movePage(<%=i%>)"
		            style="<%= (i == currentPage) ? "background:#222; color:#fff;" : "" %>">
		            <%=i%>
		        </li>
		    <% } %>
		
		    <li onclick="movePage(<%=nextPage%>)">
		        <img src="./ico/right.svg">
		    </li>
		    <li onclick="movePage(<%=totalPage%>)">
		        <img src="./ico/double_right.svg">
		    </li>
		</ul>
    </div>
</section>
</main>
