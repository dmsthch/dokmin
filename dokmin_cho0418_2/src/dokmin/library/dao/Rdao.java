package dokmin.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.sql.DataSource;

import dokmin.library.dto.Book;
import dokmin.library.dto.Member;
import dokmin.library.dto.Rental;


public class Rdao {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;	
	public Rdao(){
		try{
			Context init = new InitialContext();
			System.out.println(init + "<-- init Rdao() ");
	  	    ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
	  		
		}catch(Exception ex){
			System.out.println("DB 연결 실패 Rdao : " + ex);
			return;
		}
	}
	//대여신청 한명회원정보 조회 메서드
			public Member mSelectforUpdate(String mid) throws SQLException{
				System.out.println("한명회원 조회 메서드 실행 Rdao.java");
				conn=ds.getConnection();
				pstmt = conn.prepareStatement("select * from member WHERE member_id=?");
				pstmt.setString(1, mid);
				
				rs = pstmt.executeQuery();
				Member m = null;
				if(rs.next()){
		//쿼리실행결과를 Member클래스 통해서 생성된 객체내에 셋팅
					m = new Member();
					m.setMember_id(rs.getString("member_id"));
					m.setMember_name(rs.getString("member_name"));
					m.setMember_limit(rs.getInt("member_limit"));
				}
				rs.close();
				pstmt.close();
				conn.close();
				
				return m;
			}
			//대여 신청폼 대여추가 메서드
			public void rInsert(Rental r) throws SQLException, ClassNotFoundException{
				System.out.println("대여 신청폼 대여추가 메서드 실행 rInsert Rdao.java");
				conn=ds.getConnection();
				pstmt = conn.prepareStatement(
						"INSERT INTO rental(Book_code,Member_id,Rental_date) VALUES (?, ?, addRentalDate( now() ) );");
				System.out.println("쿼리");
				pstmt.setString(1,r.getBook_code());
				pstmt.setString(2,r.getMember_id());
				System.out.println("여기 12");
				pstmt.executeUpdate();
				System.out.println("제발");
				pstmt.close();
				System.out.println("들어오나");
				conn.close();
				System.out.println("conn.close");
			}     
			
			//대여 회원 조회 메서드
			public ArrayList<Rental> rAllSelect() throws SQLException{
				System.out.println("05 대여회원 조회 메서드 실행 rdao.java");
				conn=ds.getConnection();
				pstmt = conn.prepareStatement("select r.Rental_no,r.Book_code,b.Book_title,r.Member_id, m.Member_name,r.Rental_date,r.Rental_return from Rental r inner join Book b on r.Book_code = b.Book_code inner join member m on r.Member_id = m.Member_id ORDER BY Rental_no DESC");
				rs = pstmt.executeQuery();
				
				ArrayList<Rental> alm = new ArrayList<Rental>();
				
				while(rs.next()){
					Rental r = new Rental();
					r.setRental_no(rs.getInt("Rental_no"));
					r.setBook_code(rs.getString("Book_code"));
					r.setBook_title(rs.getString("Book_title"));
					r.setMember_id(rs.getString("Member_id"));
					r.setMember_name(rs.getString("Member_name"));                              
					r.setRental_date(rs.getString("Rental_date"));
					r.setRental_return(rs.getString("Rental_return"));
					alm.add(r);
					System.out.println(alm + "<-- alm");
				}
				rs.close();
				pstmt.close();
				conn.close();
				return alm;
			}
			//반납 상태 처리 메서드
			public void RentalReturn(int rental_no, int return_return) throws SQLException{
				System.out.println("반납 상태 바꾸는 메서드 호출");
				String return_update=null;
				if(return_return==1){
					return_update="Y";
				}else if(return_return==2){
					return_update="N";
				}
				conn=ds.getConnection();
				
				pstmt = conn.prepareStatement("update rental set rental_return=? where rental_no=?");
				pstmt.setString(1, return_update);
				pstmt.setInt(2, rental_no);
				pstmt.executeUpdate();
				pstmt.close();
				conn.close();
			}
		/*	///
			public void rrSelectforUpdate(int r_no) throws ClassNotFoundException, SQLException{
				System.out.println("대여 리스트 수정폼 메서드 실행 Mdao.java");
				conn=ds.getConnection();
				pstmt = conn.prepareStatement(
						"UPDATE Rental SET Member_id=?, WHERE Book_code = ?");
				pstmt.setString(1, getMember_id());
				pstmt.setString(2, r.getBook_code());		
				pstmt.executeUpdate();
				pstmt.close();
				conn.close();
			}*/
			
			//대여 리스트 수정폼 추가? 메서드 선언
			public Rental rSelectforUpdate(int r_no) throws SQLException{
				System.out.println("대여정보 Rdao.java");
				conn=ds.getConnection();
				pstmt = conn.prepareStatement("select * from rental WHERE rental_no=?");
				pstmt.setInt(1, r_no);
				
				rs = pstmt.executeQuery();
				Rental r = null;
				if(rs.next()){
		//쿼리실행결과를 Member클래스 통해서 생성된 객체내에 셋팅
					r = new Rental();
					r.setRental_no(rs.getInt("rental_no"));
					r.setBook_code(rs.getString("book_code"));
					r.setMember_id(rs.getString("member_id"));
					r.setRental_date(rs.getString("rental_date"));
					
				}
				rs.close();
				pstmt.close();
				conn.close();
				
				return r;
			}
		//도서 상태가 어떤지 체크하는 메서드
			public Book rentalBookCheck(String book_code) throws SQLException{
				System.out.println("도서 체크 메서드 실행 Rdao.java");
				conn=ds.getConnection();
				pstmt = conn.prepareStatement("select book_title, book_state FROM book where book_code=?");
				pstmt.setString(1,book_code);
				rs = pstmt.executeQuery();
				String result=null;
				Book b = null;
				if(rs.next()){
					b = new Book();
					b.setBook_title(rs.getString("book_title"));
					b.setBook_state(rs.getString("book_state"));
				}
				return b;
			}
}
