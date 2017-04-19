package dokmin.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dokmin.library.dto.Member;

public class Logdao {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	
	//연결해주는부분? 이게없으면 db연결안됨
	public Logdao(){
		try{
			Context init = new InitialContext();
			System.out.println(init + "<-- init Mdao() ");
	  	    ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
	  		
		}catch(Exception ex){
			System.out.println("DB 연결 실패 Mdao : " + ex);
			return;
		}
	}
	
	//아이디, 비밀번호 입력받아서 입력정보가 있는지, 비밀번호가 맞는지 리턴해주는 메서드
	public int loginCheck(Member m) throws SQLException{
		System.out.println("loginCheck메서드 호출");
		String member_id = m.getMember_id();
		String member_pw = m.getMember_pw();
		//리턴하기위한 변수.
		//기본값 0, 아이디 불일치 1, 비밀번호 불일치 2, 로그인성공 3
		int re = 0;
		
		conn=ds.getConnection();
		pstmt = conn.prepareStatement("select member_id, member_pw from member where member_id=?");
		pstmt.setString(1, member_id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String get_pw=rs.getString("member_pw");
			if(member_pw.equals(get_pw)){
				System.out.println("로그인성공");
				re=3;
			}else{
				System.out.println("비밀번호 불일치");
				re=2;
			}
		}else{
			System.out.println("아이디 없음");
			re=1;
		}
		
		return re;
	}
	
}
