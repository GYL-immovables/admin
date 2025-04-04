package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class notice_view extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		// 사용자가 클릭한 게시글 번호 받기
		String nid = request.getParameter("nidx");

		// 게시글 번호 유효성 체크
		if (nid == null || nid.equals("")) {
			response.sendRedirect("notice_list.do");
			return;
		}

		int nidx = Integer.parseInt(nid);

		// Model: 조회수 증가 및 데이터 조회
		m_noticeview mv = new m_noticeview();
		ArrayList<String> notice_v = mv.view(nidx);  // ✅ view() 메서드 사용

		// JSP로 전달할 데이터 셋팅
		request.setAttribute("notice_v", notice_v);
		request.setAttribute("nidx", nidx);  // 필요 시 삭제/수정에 사용
		// View 연결
		RequestDispatcher rd = request.getRequestDispatcher("./notice_view.jsp");
		rd.forward(request, response);
	}
}
