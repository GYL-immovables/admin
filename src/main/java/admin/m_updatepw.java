package admin;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.ArrayList;

public class m_updatepw {
	Connection con = null;
	PreparedStatement ps = null;
	m_dbinfo db = new m_dbinfo();
	Integer result = 0;
	
	public int adminok(ArrayList<String> data) {
		try {
			//data : 0아이디 <1패스워드 2이름 3이메일 4연락처 5부서 6직책>
			this.con = this.db.dbinfo();
			
			String sql = "update admin set apw=?,aname=?,aemail=?,atel=?,dept=?,rspofc=? where aid=?";
			this.ps = this.con.prepareStatement(sql);
			this.ps.setString(1, data.get(1));
			this.ps.setString(2, data.get(2));
			this.ps.setString(3, data.get(3));
			this.ps.setString(4, data.get(4));
			this.ps.setString(5, data.get(5));
			this.ps.setString(6, data.get(6));
			this.ps.setString(7, data.get(0));
			
			this.result = this.ps.executeUpdate();
		}catch (Exception e) {
			this.result = 0;
			System.out.println(e);
			System.out.println("adminok error");
		}finally {
			try {
				this.ps.close();
				this.con.close();
				
			}catch (Exception e) {
				this.result = 0;
				System.out.println("adminok close error");
			}
		}	
		
		return this.result;
	}
	
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
