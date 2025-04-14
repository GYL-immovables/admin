<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
ArrayList<String> views = (ArrayList<String>) request.getAttribute("notice_v");
String filename = null;
String nidx = request.getParameter("nidx");
if (views != null && views.size() > 5) {
    filename = views.get(5);
}
%>
<main class="maincss">
<script src="./notice_modify.js?v=1"></script>
<section>
    <p>공지사항 수정페이지</p>
    <form id="frm" method="post" action="./notice_modifyok.do" enctype="multipart/form-data">
        <input type="hidden" name="nidx" value="<%= nidx %>">
        <div class="write_view">
            <ul>
                <li>공지사항 여부</li>
                <li>
                    <label class="label_notice">
                        <em class="cbox">
                            <input type="checkbox" id="ncheck" name="ncheck" <%= "Y".equals(views.get(0)) ? "checked" : "" %>>
                        </em> 공지 출력
                    </label> 
                    ※ 공지출력을 체크할 시 해당 글 내용은 최상단에 노출 되어 집니다.
                </li>
            </ul>
            <ul>
                <li>공지사항 제목</li>
                <li>
                    <input type="text" class="notice_input1" id="nsubject" name="nsubject" value="<%= views.get(1) %>"> 
                    ※ 최대 150자까지 입력이 가능
                </li>
            </ul>
            <ul>
                <li>글쓴이</li>
                <li>
                    <input type="text" class="notice_input2" id="writer" name="writer" readonly value="<%= views.get(2) %>"> 
                    ※ 관리자 이름이 노출 됩니다.       
                </li>
            </ul>
            <ul>
                <li>첨부파일</li>
                <li>
                    <input type="file" id="nfile" name="nfile"> 
                    <% if (filename != null && !filename.trim().equals("")) { %>
                        <div>기존 첨부파일: <%= filename %></div>
                    <% } else { %>
                        <div>첨부파일 없음</div>
                    <% } %>
                </li>
            </ul>
            <ul class="ul_height">
                <li>공지내용</li>
                <li>
                    <textarea class="notice_input3" placeholder="공지내용을 입력하세요!" id="ntext" name="ntext"><%= views.get(3) %></textarea>
                </li>
            </ul>
        </div>
        <div class="board_btn">
            <button type="button" class="border_del" onclick="goNoticeList()">공지목록</button>
            <button type="button" class="border_add" onclick="file_send()">공지수정</button>
        </div>
    </form>
</section>
</main>
