package admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class updateaprv extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pw = null;
	m_updatepw up = new m_updatepw();

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		this.pw = response.getWriter();
		
		String aid = request.getParameter("aid");
		String aprv_to = request.getParameter("aprv_to");
		
		Integer result = this.up.aprvok(aid, aprv_to);
		
		
		
		if(result==0) {	//변경 성공시 
			this.pw.write("<script>" 
					+ "alert('변경 실패');" 
					+ "history.go(-1);" 
					+ "</script>");
		}else {			//변경 실패시 
			if(aprv_to.equals("Y")) {
				this.pw.write("<script>" 
						+ "alert('가입 승인으로 변경 완료');" 
						+ "location.href = './admin_list.do';" 
						+ "</script>");
			}else{
				this.pw.write("<script>" 
						+ "alert('가입 미승인으로 변경 완료');" 
						+ "history.go(-1);" 
						+ "</script>");
			}
		}
	}
}