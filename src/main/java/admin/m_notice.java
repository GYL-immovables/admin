package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.Part;

import admin.m_dbinfo;

//공지사항 게시판 파일을 저장하는 Model 
public class m_notice extends HttpServlet {
	Connection con = null;
	PreparedStatement ps = null;
	m_dbinfo db = new m_dbinfo();

	String sql = ""; // DB 쿼리문
	int result = 0; // DB 저장 결과값
	String msg = ""; // Model에서 처리된 값을 반환
	String ncheck, nsubject, writer, ntext;

	public m_notice(Part nfile, String ncheck, String nsubject, String writer, String ntext, HttpServletRequest request)
			throws Exception {
		this.ncheck = ncheck;
		this.nsubject = nsubject;
		this.writer = writer;
		this.ntext = ntext;

		long filesize = nfile.getSize(); // 파일 용량
		String filenm = nfile.getSubmittedFileName(); // 파일명
		String url = request.getServletContext().getRealPath("/notice_file/"); // 파일 저장 경로
		try {
			nfile.write(url + filenm); // 웹에 저장
			this.fileok(filenm); // 정상적으로 저장되었을 경우
		} catch (Exception e) {
			this.fileok("error" + e);
		}
	}

	// DB로 저장 및 Controller로 결과값을 return하는 메소드
	private String fileok(String data) throws Exception {
		if(data.equals("error")) {
			this.msg = "error";
		}
		else { // 파일이 정상적으로 저장되었을 경우
			try {
				this.con = this.db.dbinfo();
				sql = "INSERT INTO notice (ncheck, nsubject, writer, ntext, nfile, file_name, nview, ndate) " +
					      "VALUES (?, ?, ?, ?, ?, ?, 0, NOW())";
				this.ps = this.con.prepareStatement(sql);
				this.ps.setString(1, this.ncheck);
				this.ps.setString(2, this.nsubject);
				this.ps.setString(3, this.writer);
				this.ps.setString(4, this.ntext);
				this.ps.setString(5, data);
				this.ps.setString(6, data);
				
				this.result = this.ps.executeUpdate();
				
				if(result > 0)  { // 저장이 된 경우
					this.msg = "ok";
				}
				else { // 저장이 안 된 경우
					this.msg = "error";
				}
			} catch (Exception e) {
				this.msg = "error";
			}
			finally {
				this.ps.close();
				this.con.close();
			}
		}
		return this.msg;

	}
}
