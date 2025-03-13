package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;

public class m_updatepw {
	Connection con = null;
	PreparedStatement ps = null;
	m_dbinfo db = new m_dbinfo();
	Integer result = 0;
	
	public int aprvok(String aid, String aprv_to) {
		try {
			this.con = this.db.dbinfo();
			
			String sql = "update admin set aprv=? where aid=?";
			this.ps = this.con.prepareStatement(sql);
			this.ps.setString(1, aprv_to);
			this.ps.setString(2, aid);
			this.result = this.ps.executeUpdate();
		}catch (Exception e) {
			this.result = 0;
			System.out.println(e);
			System.out.println("aprvok error");
		}finally {
			try {
				this.ps.close();
				this.con.close();
				
			}catch (Exception e) {
				this.result = 0;
				System.out.println("aprvok close error");
			}
		}		
		return this.result;
	}
	
	public int pwok(String mid, String newpw) {
		try {
			this.con = this.db.dbinfo();
			
			newpw = new m_md5().md5_code(newpw);
			
			String sql = "update admin set apw=? where aid=?";
			this.ps = this.con.prepareStatement(sql);
			this.ps.setString(1, newpw);
			this.ps.setString(2, mid);
			this.result = this.ps.executeUpdate();
			
		}catch (Exception e) {
			this.result = 0;
			System.out.println(e);
			System.out.println("pwok error");
		}finally {
			try {
				this.ps.close();
				this.con.close();
				
			}catch (Exception e) {
				this.result = 0;
				System.out.println("pwok close error");
			}
		}		
		return this.result;
	}
}
