package admin;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class notice_list extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// 사용자가 페이지 번호를 클릭시 해당 값을 받는 역할
		String pageno = request.getParameter("pageno");
		if (pageno == null || pageno.equals("1")) { // 게시판 최초 접속 or 1번 페이지일때 페이지 배열번호 0으로 처리
			pageno = "0";
		}
		// list를 출력하기 위한 Database Table을 로드하는 Model
		m_noticelist nl = new m_noticelist(Integer.parseInt(pageno));
		// 2차 클래스배열로 저장된 Table에 모든 데이터를 셋팅함
		ArrayList<ArrayList<String>> result = nl.db_data();

		// JSP로 2차 클래스 배열 값을 전달(View)
		request.setAttribute("result", result);
		request.setAttribute("pageno", pageno);
				//System.out.println(result);
		RequestDispatcher rd = request.getRequestDispatcher("./notice_list.jsp");
		rd.forward(request, response);
	}

}
