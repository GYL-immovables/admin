<%@page import="admin.dto_setting"%>
<%@page import="java.util.ArrayList"%>
<%@page import="admin.m_copyright"%> <%-- 여기에 추가 --%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
    // application 범위에서 값이 없으면 DB에서 강제로 가져옴
    ArrayList<dto_setting> copyright =
        (ArrayList<dto_setting>) application.getAttribute("copyright");

    if (copyright == null || copyright.isEmpty()) {
        // 강제로 DB에서 조회해서 application에 저장
        m_copyright cp = new m_copyright();
        copyright = cp.cpdata();
        if (!copyright.isEmpty()) {
            application.setAttribute("copyright", copyright);
        }
    }

    if (copyright != null && !copyright.isEmpty()) {
        dto_setting data = copyright.get(0);
%>
<footer class="main_copyright">
    <div>
        대표 : <%= data.getCeo_nm() %> |
        사업자등록번호 : <%= data.getBusiness_no() %> |
        번호 : <%= data.getTel() %> |
        통신판매업신고번호 : <%= data.getCom_no() %> |
        통신사업자번호 : <%= data.getAdd_no() %> |
        우편번호 : <%= data.getAddr_no() %> |
        주소 : <%= data.getCom_addr() %> |
        정보관리책임자 : <%= data.getInfo_nm() %> |
        책임자이메일 : <%= data.getInfo_email() %>
        <br>
        Copyright ⓒ 2024 <%= data.getComp_nm() %> |
        All rights reserved.
    </div>
</footer>
<%
    } else {
%>
<footer class="main_copyright">
    <div>
        Copyright ⓒ 2024 | 등록된 회사 정보가 없습니다.
    </div>
</footer>
<%
    }
%>
