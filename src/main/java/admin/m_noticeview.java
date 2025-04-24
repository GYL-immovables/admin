package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import admin.m_dbinfo;

public class m_noticeview {
	Connection con = null;
	PreparedStatement ps = null;
	ResultSet rs = null;

	String sql;
	m_dbinfo db = new m_dbinfo();

	ArrayList<String> data = null;

	public ArrayList<String> view(int nidx) {
		try {
			this.con = db.dbinfo(); // DB 연결

			// 1. 조회수 증가
			this.sql = "UPDATE notice SET nview = nview + 1 WHERE nidx = ?";
			this.ps = this.con.prepareStatement(this.sql);
			this.ps.setInt(1, nidx);
			this.ps.executeUpdate();
			this.ps.close();

			// 2. 상세 데이터 조회
			this.sql = "SELECT * FROM notice WHERE nidx = ?";
			this.ps = this.con.prepareStatement(this.sql);
			this.ps.setInt(1, nidx);
			this.rs = this.ps.executeQuery();

			if (this.rs.next()) {
				this.data = new ArrayList<>();
				this.data.add(this.rs.getString("nidx"));      // 0
				this.data.add(this.rs.getString("nsubject"));  // 1
				this.data.add(this.rs.getString("writer"));    // 2
				this.data.add(this.rs.getString("ntext"));     // 3
				this.data.add(this.rs.getString("file_name"));    // 4
				this.data.add(this.rs.getString("nfile"));     // 5
			}

		} catch (Exception e) {
			this.data = null;
			e.printStackTrace();
		} finally {
			try {
				this.rs.close();
				this.ps.close();
				this.con.close();
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		return this.data;
	}
}
