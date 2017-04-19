package dokmin.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dokmin.library.dto.HopeBook;
import dokmin.library.dto.Member;
import dokmin.library.dto.Rental;

public class Mdao {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	public Mdao(){
	try{
		Context init = new InitialContext();
		System.out.println(init + "<-- init Mdao()");
		ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
	}catch(Exception ex){
		System.out.println("DB ���� ���� Mdao : "+ex);
		return;
	}
}
	
	//�Է�ó���޼��� ����(�Ű����� 1��)
	public void mSignup(Member m) throws SQLException, ClassNotFoundException{
		System.out.println("mSignup Mdao.java");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(
				"INSERT INTO member(member_id, member_pw, member_name, member_birth, member_phone, member_addr) VALUES(?,?,?,?,?,?)");
		pstmt.setString(1, m.getMember_id());
		pstmt.setString(2, m.getMember_pw());
		pstmt.setString(3, m.getMember_name());
		pstmt.setString(4, m.getMember_birth());
		pstmt.setString(5, m.getMember_phone());
		pstmt.setString(6, m.getMember_addr());
	
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	//��üȸ�� ��ȸ �޼��� ����
	public ArrayList<Member> mAllSelect() throws SQLException{
		System.out.println("mAllSelect Mdao.java");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement("select * from member");
		rs = pstmt.executeQuery();
		
		ArrayList<Member> alm = new ArrayList<Member>();
		
		while(rs.next()){
			Member m = new Member();
			m.setMember_id(rs.getString("member_id"));
			m.setMember_name(rs.getString("member_name"));
			m.setMember_birth(rs.getString("member_birth"));
			m.setMember_phone(rs.getString("member_phone"));
			m.setMember_addr(rs.getString("member_addr"));
			m.setMember_level(rs.getString("member_level"));
			alm.add(m);
			System.out.println(alm + "<-- alm");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return alm;
		
	}
	
	// �Ѹ� ȸ�� ��ȸ
	public Member mSelectforUpdate(String mid) throws SQLException{
		System.out.println("�Ѹ�ȸ�� ��ȸ �޼��� ���� Mdao.java");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement("select * from member WHERE member_id=?");
		pstmt.setString(1, mid);
		
		rs = pstmt.executeQuery();
		Member m = null;
		if(rs.next()){
//������������ MemberŬ���� ���ؼ� ������ ��ü���� ����
			m = new Member();
			m.setMember_id(rs.getString("member_id"));
			m.setMember_pw(rs.getString("member_pw"));
			m.setMember_name(rs.getString("member_name"));
			m.setMember_birth(rs.getString("member_birth"));
			m.setMember_phone(rs.getString("member_phone"));
			m.setMember_addr(rs.getString("member_addr"));
			m.setMember_level(rs.getString("member_level"));
			
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return m;
	}
	
	//����ó�� �޼��� ����
	public void mModify(Member m) throws ClassNotFoundException, SQLException{
		System.out.println("mModify Mdao.java");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement(
				"UPDATE member SET member_pw=?,member_name=?,member_birth=?,member_phone=?,member_addr=? WHERE member_id=?");
		pstmt.setString(1, m.getMember_pw());
		pstmt.setString(2, m.getMember_name());
		pstmt.setString(3, m.getMember_birth());
		pstmt.setString(4, m.getMember_phone());
		pstmt.setString(5, m.getMember_addr());
		pstmt.setString(6, m.getMember_id());
		
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	
		
	}
	public ArrayList<Member> mBlackSelect() throws SQLException{
		System.out.println("mBlackSelect Mdao.java");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement("select * from member where member_overdueno > 5;");
		rs = pstmt.executeQuery();
		
		ArrayList<Member> alm = new ArrayList<Member>();
		
		while(rs.next()){
			Member m = new Member();
			m.setMember_id(rs.getString("member_id"));
			m.setMember_name(rs.getString("member_name"));
			m.setMember_birth(rs.getString("member_birth"));
			m.setMember_phone(rs.getString("member_phone"));
			m.setMember_addr(rs.getString("member_addr"));
			m.setMember_level(rs.getString("member_level"));
			alm.add(m);
			System.out.println(alm + "<-- alm");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return alm;
		
	}
	//�˻�ó�� �޼��� ����
	public ArrayList<Member> mSearch(String sk,String sv) throws SQLException{
		System.out.println("mSearch Mdao.java");
		System.out.println(sk + "<-- sk mSearch Mdao.java");
		System.out.println(sv + "<-- sv mSearch Mdao.java");
		conn = ds.getConnection();
		if(sk == null & sv == null){
			System.out.println("01 �Ѵ� ���� ���� <br>");
			pstmt = conn.prepareStatement("select * from member");
		}else if(sk != null & sv.equals("")){
			System.out.println("02 sk�ְ� sv���� <br>");
			pstmt = conn.prepareStatement("select * from member");
		}else if(sk != null & sv != null){
			System.out.println("03 �Ѵ� �ִ� <br>");
			pstmt = conn.prepareStatement("select * from member where " + sk +"=?");	
			pstmt.setString(1, sv);	
		}		
		rs = pstmt.executeQuery();
		
		ArrayList<Member> alm = new ArrayList<Member>();
		
		while(rs.next()){
			Member m = new Member();
			m.setMember_id(rs.getString("member_id"));
			m.setMember_name(rs.getString("member_name"));
			m.setMember_birth(rs.getString("member_birth"));
			m.setMember_phone(rs.getString("member_phone"));
			m.setMember_addr(rs.getString("member_addr"));
			m.setMember_level(rs.getString("member_level"));
			alm.add(m);
			System.out.println(alm + "<-- alm");
		}
		rs.close();
		pstmt.close();
		conn.close();
		return alm;
	}
	
	//�Ѹ� �뿩 ��ȸ �޼���
	public ArrayList<Rental> rSelectforRental(String mid) throws SQLException{
		System.out.println("�Ѹ� �뿩 ��ȸ Mdao.java");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement("select r.rental_no, r.book_code, r.member_id, r.rental_date, r.rental_return "
				+ "from rental r inner join member m on r.MEMBER_ID = m.member_id inner join book b on r.book_CODE = b.book_code "
				+ "where r.member_id=?");
		pstmt.setString(1, mid);
		
		rs = pstmt.executeQuery();
		
		ArrayList<Rental> alm = new ArrayList<Rental>();

		while(rs.next()){
//������������ MemberŬ���� ���ؼ� ������ ��ü���� ����
			Rental r = new Rental();
			r.setRental_no(Integer.parseInt(rs.getString("rental_no")));
			r.setBook_code(rs.getString("book_code"));
			r.setMember_id(rs.getString("member_id"));
			r.setRental_date(rs.getString("rental_date"));
			r.setRental_return(rs.getString("rental_return"));
			alm.add(r);
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return alm;
	}

	//�Ѹ� ��� ���� ��ȸ �޼���
	public ArrayList<HopeBook> hSelectforHope(String mid) throws SQLException{
		System.out.println("�Ѹ� �뿩 ��ȸ Mdao.java");
		conn = ds.getConnection();
		pstmt = conn.prepareStatement("select * from hope_book where member_id=?");
		pstmt.setString(1, mid);
		
		rs = pstmt.executeQuery();
		
		ArrayList<HopeBook> alm = new ArrayList<HopeBook>();

		while(rs.next()){
//������������ MemberŬ���� ���ؼ� ������ ��ü���� ����
			HopeBook h = new HopeBook();
			h.setHbook_no(rs.getInt("hbook_no"));
			h.setMember_id(rs.getString("member_id"));
			h.setHbook_name(rs.getString("hbook_name"));
			h.setHbook_writer(rs.getString("hbook_writer"));
			h.setHbook_date(rs.getString("hbook_date"));
			h.setHbook_progress(rs.getString("hbook_progress"));
			alm.add(h);
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return alm;
	}
}