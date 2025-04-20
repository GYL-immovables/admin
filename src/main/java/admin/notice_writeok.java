package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 5,   // 파일 하나 5MB
	maxFileSize = 1024 * 1024 * 50,        // 파일들의 총 용량 50MB
	maxRequestSize = 1024 * 1024 * 500     // 파일 여러개일 때 총 용량 제한
)
public class notice_writeok extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps = null;
	PrintWriter pw = null;

	// Model
	m_dbinfo db = new m_dbinfo(); // DB 접속 정보

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		this.pw = response.getWriter();

		// 첨부파일 유무에 따라 SQL 방식 결정
		Part nfile = request.getPart("nfile");
		long filesize = nfile.getSize(); // getSize()는 long값 return

		try {
			this.con = this.db.dbinfo(); // DB 연결

			String ncheck = request.getParameter("ncheck");
			if (ncheck == null) {
			    ncheck = "N"; // 기본값으로 '공지 아님'
			}
			String nsubject = request.getParameter("nsubject"); // 제목
			String writer = request.getParameter("writer");     // 작성자
			String ntext = request.getParameter("ntext");       // 내용

			String sql = "";     // SQL 문
			int result = 0;      // insert 결과

			if (filesize == 0) { // 첨부파일 없는 경우
				sql = "INSERT INTO notice (ncheck, nsubject, writer, ntext, nview, ndate) "
					+ "VALUES ( ?, ?, ?, ?, 0, NOW())";

				this.ps = this.con.prepareStatement(sql);
				this.ps.setString(1, ncheck);
				this.ps.setString(2, nsubject);
				this.ps.setString(3, writer);
				this.ps.setString(4, ntext);

				result = this.ps.executeUpdate(); // DB 저장

				if (result > 0) {
					this.pw.write("<script>"
						+ "alert('게시물이 올바르게 등록되었습니다.');"
						+ "location.href = './notice_list.do';"
						+ "</script>");
				}
			} else { // 첨부파일 있는 경우
				m_notice nt = new m_notice(nfile,ncheck,nsubject,writer,ntext,request);
				String msg = nt.msg;
				
				if(msg.equals("ok")) {
					this.pw.write("<script>"
							+ "alert('올바르게 공지사항이 등록되었습니다.');"
							+ "location.href = './notice_list.do';"
							+ "</script>");
				}else {
					this.pw.write("<script>"
							+ "alert('데이터베이스 및 첨부파일 오류 발생');"
							+ "history.go(-1);"
							+ "</script>");
				}
			}
		} catch (Exception e) {
			System.out.println(e);
			this.pw.write("<script>"
				+ "alert('데이터베이스 문제로 인하여 저장되지 않았습니다.');"
				+ "history.go(-1);"
				+ "</script>");
		}
	}
}

