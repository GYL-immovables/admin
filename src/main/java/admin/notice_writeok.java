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
    fileSizeThreshold = 1024 * 1024 * 5,
    maxFileSize = 1024 * 1024 * 50,
    maxRequestSize = 1024 * 1024 * 100
)
public class notice_writeok extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setCharacterEncoding("UTF-8");
        request.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");

        PrintWriter pw = response.getWriter();

        m_dbinfo db = new m_dbinfo();
        Connection con = null;
        PreparedStatement ps = null;

        try {
            con = db.dbinfo(); // DB 연결

            // 🔹 폼 데이터 받기
            String ncheck = request.getParameter("ncheck");  // 공지 여부
            String nsubject = request.getParameter("nsubject");  // 제목
            String writer = request.getParameter("writer");  // 작성자
            String ntext = request.getParameter("ntext");  // 내용

            // 체크박스 값이 없으면 기본값 'N' 설정
            if (ncheck == null || ncheck.trim().isEmpty()) {
                ncheck = "N";
            }

            // 작성자가 없으면 "관리자" 기본값 설정
            if (writer == null || writer.trim().isEmpty()) {
                writer = "관리자";
            }

            // 🔹 파일 업로드 처리
            Part nfilePart = request.getPart("nfile");
            String fileName = (nfilePart != null && nfilePart.getSize() > 0) ? nfilePart.getSubmittedFileName() : null;

            // 🔹 콘솔 출력 (서버에서 값 확인)
            System.out.println("📩 [공지사항 데이터 수신]");
            System.out.println("공지 여부: " + ncheck);
            System.out.println("제목: " + nsubject);
            System.out.println("작성자: " + writer);
            System.out.println("내용: " + ntext);
            System.out.println("첨부 파일: " + (fileName != null ? fileName : "첨부 파일 없음"));

            // 🔹 SQL 실행
            String sql;
            int result;

            if (fileName == null) {
                sql = "INSERT INTO notice (ncheck, nsubject, writer, ntext, nview, ndate) VALUES (?, ?, ?, ?, 0, NOW())";
                ps = con.prepareStatement(sql);
                ps.setString(1, ncheck);
                ps.setString(2, nsubject);
                ps.setString(3, writer);
                ps.setString(4, ntext);
            } else {
                sql = "INSERT INTO notice (ncheck, nsubject, writer, nfile, ntext, nview, ndate) VALUES (?, ?, ?, ?, ?, 0, NOW())";
                ps = con.prepareStatement(sql);
                ps.setString(1, ncheck);
                ps.setString(2, nsubject);
                ps.setString(3, writer);
                ps.setString(4, fileName);
                ps.setString(5, ntext);
            }

            result = ps.executeUpdate();

            // 🔹 결과 응답
            if (result > 0) {
                pw.write("<script>"
                        + "alert('게시물이 올바르게 등록되었습니다.');"
                        + "location.href = './notice_list.jsp';"
                        + "</script>");
            } else {
                pw.write("<script>"
                        + "alert('공지사항 등록 중 오류가 발생했습니다.');"
                        + "history.go(-1);"
                        + "</script>");
            }

        } catch (Exception e) {
            e.printStackTrace();
            pw.write("<script>"
                    + "alert('데이터베이스 오류로 저장되지 않았습니다.');"
                    + "history.go(-1);"
                    + "</script>");
        } finally {
            try {
                if (ps != null) ps.close();
                if (con != null) con.close();
                if (pw != null) pw.close();
            } catch (Exception e2) {
                e2.printStackTrace();
            }
        }
    }
}
