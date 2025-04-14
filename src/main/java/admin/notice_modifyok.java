package admin;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.*;

@MultipartConfig(
	fileSizeThreshold = 1024 * 1024 * 5,
	maxFileSize = 1024 * 1024 * 50,
	maxRequestSize = 1024 * 1024 * 500
)
public class notice_modifyok extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection con = null;
	PreparedStatement ps = null;
	PrintWriter pw = null;
	m_dbinfo db = new m_dbinfo();

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		this.pw = response.getWriter();

		String nidx = request.getParameter("nidx");
		String ncheck = request.getParameter("ncheck") != null ? request.getParameter("ncheck") : "N";
		String nsubject = request.getParameter("nsubject");
		String writer = request.getParameter("writer");
		String ntext = request.getParameter("ntext");
		Part nfile = request.getPart("nfile");
		long filesize = nfile.getSize();

		try {
			this.con = db.dbinfo();

			String sql;
			int result;

			if (filesize > 0) {
				String filename = nfile.getSubmittedFileName();
				String uploadPath = request.getServletContext().getRealPath("/notice_file/");
				nfile.write(uploadPath + filename);

				sql = "UPDATE notice SET ncheck=?, nsubject=?, writer=?, ntext=?, nfile=?, file_name=? WHERE nidx=?";
				this.ps = this.con.prepareStatement(sql);
				this.ps.setString(1, ncheck);
				this.ps.setString(2, nsubject);
				this.ps.setString(3, writer);
				this.ps.setString(4, ntext);
				this.ps.setString(5, filename);
				this.ps.setString(6, filename);
				this.ps.setString(7, nidx);
			} else {
				sql = "UPDATE notice SET ncheck=?, nsubject=?, writer=?, ntext=? WHERE nidx=?";
				this.ps = this.con.prepareStatement(sql);
				this.ps.setString(1, ncheck);
				this.ps.setString(2, nsubject);
				this.ps.setString(3, writer);
				this.ps.setString(4, ntext);
				this.ps.setString(5, nidx);
			}

			result = this.ps.executeUpdate();

			if (result > 0) {
				this.pw.write("<script>alert('공지사항이 수정되었습니다.'); location.href='./notice_view.do?nidx=" + nidx + "';</script>");
			} else {
				this.pw.write("<script>alert('공지사항 수정에 실패했습니다.'); history.go(-1);</script>");
			}

		} catch (Exception e) {
			e.printStackTrace();
			this.pw.write("<script>alert('DB 오류로 인해 수정에 실패했습니다.'); history.go(-1);</script>");
		} finally {
			try {
				this.ps.close();
				this.con.close();
				this.pw.close();
			} catch (Exception e) {
			}
		}
	}
}
