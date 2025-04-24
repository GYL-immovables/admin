
package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class index_ok extends HttpServlet {
	private static final long serialVersionUID = 1L;
	PrintWriter pw = null;
	ArrayList<String> admindata = null;
	m_selectadmin sa = new m_selectadmin();
	HttpSession session = null;

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=utf-8");
		this.pw = response.getWriter();
		String aid = request.getParameter("aid");
		String apw = request.getParameter("apw");
		try {
			this.admindata = sa.loginselect(aid, apw);
			//System.out.println("인덱스ㅇㅋ : " + this.admindata);
			
			if(this.admindata.size() == 0) {	//조회된 내용이 없을 경우 
				this.pw.write("<script>"
						+ "alert('해당 아이디를 확인할 수 없습니다.');"
						+ "history.go(-1);"
						+ "</script>");
			}else{	//조회된 내용이 있을 경우
				if(this.admindata.get(6).equals("N")) {	//가입 미승인일 경우
					this.pw.write("<script>"
							+ "alert('가입 미승인 상태입니다.');"
							+ "history.go(-1);"
							+ "</script>");
				}else {	//가입 승인인 경우
					//admindata 배열 : 0아이디 1이름 2이메일 3전화번호 4부서 5직책 6가입승인 7가입날짜
					this.session = request.getSession();	//세션 생성 
					this.session.setAttribute("aid",this.admindata.get(0));
					this.session.setAttribute("aname",this.admindata.get(1));
					this.session.setAttribute("aemail",this.admindata.get(2));
					this.session.setAttribute("atel",this.admindata.get(3));
					this.session.setAttribute("dept",this.admindata.get(4));
					this.session.setAttribute("rspofc",this.admindata.get(5));
					this.session.setAttribute("adate",this.admindata.get(7));
					this.pw.write("<script>"
							+ "alert('로그인하셨습니다.');"
							+ "location.href='./admin_list.do';"
							+ "</script>");
				}
			}
		}catch (Exception e) {
			this.pw.write("<script>"
					+ "alert('잘못된 접근입니다.');"
					+ "history.go(-1);"
					+ "</script>");
			}
		}
}