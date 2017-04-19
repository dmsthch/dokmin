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
	
	//�������ִºκ�? �̰Ծ����� db����ȵ�
	public Logdao(){
		try{
			Context init = new InitialContext();
			System.out.println(init + "<-- init Mdao() ");
	  	    ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
	  		
		}catch(Exception ex){
			System.out.println("DB ���� ���� Mdao : " + ex);
			return;
		}
	}
	
	//���̵�, ��й�ȣ �Է¹޾Ƽ� �Է������� �ִ���, ��й�ȣ�� �´��� �������ִ� �޼���
	public int loginCheck(Member m) throws SQLException{
		System.out.println("loginCheck�޼��� ȣ��");
		String member_id = m.getMember_id();
		String member_pw = m.getMember_pw();
		//�����ϱ����� ����.
		//�⺻�� 0, ���̵� ����ġ 1, ��й�ȣ ����ġ 2, �α��μ��� 3
		int re = 0;
		
		conn=ds.getConnection();
		pstmt = conn.prepareStatement("select member_id, member_pw from member where member_id=?");
		pstmt.setString(1, member_id);
		rs=pstmt.executeQuery();
		if(rs.next()){
			String get_pw=rs.getString("member_pw");
			if(member_pw.equals(get_pw)){
				System.out.println("�α��μ���");
				re=3;
			}else{
				System.out.println("��й�ȣ ����ġ");
				re=2;
			}
		}else{
			System.out.println("���̵� ����");
			re=1;
		}
		
		return re;
	}
	
}
