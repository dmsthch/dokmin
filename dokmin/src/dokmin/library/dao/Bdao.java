package dokmin.library.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.sql.DataSource;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import dokmin.library.dto.Book;
import dokmin.library.dto.Genre;
import dokmin.library.dto.HopeBook;

public class Bdao {
	DataSource ds;
	Connection conn;
	PreparedStatement pstmt;
	ResultSet rs;
	public Bdao(String e){
		System.out.println("bdao 오버로딩 테스트 출력");
	}
	
	//연결해주는부분? 나중에 조사해볼것. 이게없으면 db연결안됨
	public Bdao(){
		try{
			Context init = new InitialContext();
			System.out.println(init + "<-- init Mdao() ");
	  	    ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
	  		
		}catch(Exception ex){
			System.out.println("DB 연결 실패 Mdao : " + ex);
			return;
		}
	}
	
	//전체book셀렉트 메서드
	public ArrayList<Book> bookList() throws SQLException{
		System.out.println("bookList 메서드 실행 Bdao.java");
		conn=ds.getConnection();
		System.out.println(conn+"<<conn");
		pstmt = conn.prepareStatement("select * from book");
		System.out.println(pstmt+"<<pstmt");
		rs = pstmt.executeQuery();
		ArrayList<Book> alb = new ArrayList<Book>();
		while(rs.next()){
			Book b = new Book();
			b.setBook_code(rs.getString("book_code"));
			b.setBook_title(rs.getString("book_title"));
			b.setBook_date(rs.getString("book_date"));
			b.setBook_genre(rs.getInt("book_genre"));
			b.setBook_manager(rs.getString("book_manager"));
			b.setBook_price(rs.getInt("book_price"));
			b.setBook_publisher(rs.getString("book_publisher"));
			b.setBook_state(rs.getString("book_state"));
			b.setBook_tnor(rs.getInt("book_tnor"));
			b.setBook_writer(rs.getString("book_writer"));
			alb.add(b);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return alb;
	}
	
	//장르 코드에 맞는 한글이름 가져오는 메서드
	public String bookGenre(int genre_code) throws SQLException{
		System.out.println("bookGenre 메서드실행 Bdao.java");
		String stringGenre=null;
		conn=ds.getConnection();
		pstmt = conn.prepareStatement("select genre_name from genre where genre_code=?");
		pstmt.setInt(1, genre_code);
		rs = pstmt.executeQuery();
		if(rs.next()){
			stringGenre = rs.getString("genre_name");
		}
		return stringGenre;
		
	}
	
	//하나의 도서 셀렉트 하는 메서드
	public Book bookForModify(String b_code) throws SQLException{
		System.out.println("bookForModify메서드 Bdao.java");
		conn=ds.getConnection();
		pstmt = conn.prepareStatement("select * from book where book_code=?");
		pstmt.setString(1, b_code);
		rs = pstmt.executeQuery();
		Book b = null;
		if(rs.next()){
			b = new Book();
			b.setBook_code(rs.getString("book_code"));
			b.setBook_title(rs.getString("book_title"));
			b.setBook_date(rs.getString("book_date"));
			b.setBook_genre(rs.getInt("book_genre"));
			b.setBook_manager(rs.getString("book_manager"));
			b.setBook_price(rs.getInt("book_price"));
			b.setBook_publisher(rs.getString("book_publisher"));
			b.setBook_state(rs.getString("book_state"));
			b.setBook_tnor(rs.getInt("book_tnor"));
			b.setBook_writer(rs.getString("book_writer"));
		}
		return b;
		
	}
	
	//도서의 담당자이름 셀렉트 메서드
	public String bookManagerName(String b_code) throws SQLException{
		System.out.println("담당자이름 셀렉트 메서드 호출");
		conn=ds.getConnection();
		System.out.println(conn+"<<conn");
		//셀렉트한다. 입력한 북 코드에 맞는, 멤버 이름을, 멤버 테이블에서. 조인한다! 도서테이블! 멤버테이블의 아이디랑 북테이블의 매니저랑 같다는 조건으로. 
		pstmt = conn.prepareStatement("select member_name from member m inner join book b on m.MEMBER_ID=b.BOOK_MANAGER where b.BOOK_CODE=?");
		pstmt.setString(1, b_code);
		rs = pstmt.executeQuery();
		String member_name= null;
		if(rs.next()){
			member_name =rs.getString("member_name");
		}
		return member_name;
	}
	
	//도서 수정 처리 메서드
	public void bookModify(Book b) throws SQLException{
		System.out.println("수정처리 메서드 호출");
		conn=ds.getConnection();
		pstmt = conn.prepareStatement("update book set book_title=?, Book_date=?, Book_genre=?,Book_manager=?,Book_price=?,Book_publisher=?,Book_state=?,Book_writer=? where book_code=?");
		pstmt.setString(1, b.getBook_title());
		pstmt.setString(2, b.getBook_date());
		pstmt.setInt(3, b.getBook_genre());
		pstmt.setString(4, b.getBook_manager());
		pstmt.setInt(5, b.getBook_price());
		pstmt.setString(6, b.getBook_publisher());
		pstmt.setString(7, b.getBook_state());
		pstmt.setString(8, b.getBook_writer());
		pstmt.setString(9, b.getBook_code());
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}

	//도서 삭제 처리 메서드
	public int bookDelete(String b_code) throws SQLException{
		System.out.println("삭제처리 메서드 호출");
		//삭제처리가 되었는지 안되었는지 확인하는 변수.
		int re = 0;
		try{
		conn=ds.getConnection();
		pstmt = conn.prepareStatement("delete from book where book_code=?");
		pstmt.setString(1, b_code);
		//처리완료되면 숫자넣어줌
		re = pstmt.executeUpdate();
		}catch(Exception e){
			re = 0;
		}finally{
			pstmt.close();
			conn.close();
		}
		
		return re;
	}

	//도서 추가 처리 메서드
	public int bookInsert(Book b, Connection conn) throws SQLException{
		conn.setAutoCommit(false);
		System.out.println("도서 추가 처리 메서드 실행");
		pstmt = conn.prepareStatement("insert into book(book_code, book_title, book_manager, book_writer, book_genre,book_price,book_date, book_publisher) values(?,?,?,?,?,?,?,?)");
		System.out.println(pstmt+"<---pstmt");
		System.out.println(conn+"<---conn");
		pstmt.setString(1, b.getBook_code());
		pstmt.setString(2, b.getBook_title());
		pstmt.setString(3, b.getBook_manager());
		pstmt.setString(4, b.getBook_writer());
		pstmt.setInt(5, b.getBook_genre());
		pstmt.setInt(6, b.getBook_price());
		pstmt.setString(7, b.getBook_date());
		pstmt.setString(8, b.getBook_publisher());
		int re = pstmt.executeUpdate();
		System.out.println(re+"<----dao 메서드 내 re");
		return re;
	}

	//희망도서 추가 처리 메서드
	public void hbookInsert(HttpServletRequest request, HttpServletResponse response) throws SQLException{
		System.out.println("희망도서 추가 처리 메서드 Bdao");
		String hbook_name = request.getParameter("hbook_name");
		String hbook_writer = request.getParameter("hbook_writer");
		HttpSession session=request.getSession();
		String s_id = (String)session.getAttribute("S_id");
		//오늘날짜구하기
		SimpleDateFormat date = new SimpleDateFormat("yyyyMMdd");
        Calendar c1 = Calendar.getInstance();
        String strToday = date.format(c1.getTime());
		
		System.out.println(date+"<---date");
		conn=ds.getConnection();
		pstmt = conn.prepareStatement("insert into hope_book(member_id, hbook_name, hbook_writer, hbook_date) values(?,?,?,?)");
		pstmt.setString(1, s_id);
		pstmt.setString(2, hbook_name);
		pstmt.setString(3, hbook_writer);
		pstmt.setString(4, strToday);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
		
	}
	
	//전체 희망도서 셀렉트 메서드
	public ArrayList<HopeBook> hopebookList() throws SQLException{
		System.out.println("hopebookList 메서드 실행 Bdao.java");
		conn=ds.getConnection();
		pstmt = conn.prepareStatement("select * from hope_book");
		System.out.println(pstmt+"<<pstmt");
		rs = pstmt.executeQuery();
		ArrayList<HopeBook> alb = new ArrayList<HopeBook>();
		while(rs.next()){
			HopeBook b = new HopeBook();
			b.setHbook_no(rs.getInt("hbook_no"));
			b.setMember_id(rs.getString("member_id"));
			b.setHbook_name(rs.getString("hbook_name"));
			b.setHbook_writer(rs.getString("hbook_writer"));
			b.setHbook_date(rs.getString("hbook_date"));
			b.setHbook_progress(rs.getString("hbook_progress"));
			alb.add(b);
		}
		rs.close();
		pstmt.close();
		conn.close();
		return alb;
	}

	//희망도서 상태 처리 메서드
	public void HopePro(int hbook_no, int progress_no) throws SQLException{
		System.out.println("희망도서 상태 바꾸는 메서드 호출");
		String hb_pro=null;
		if(progress_no==1){
			hb_pro="취소됨";
		}else if(progress_no==2){
			hb_pro="처리중";
		}else if(progress_no==3){
			hb_pro="입고됨";
		}
		conn=ds.getConnection();
		
		pstmt = conn.prepareStatement("update hope_book set hbook_progress=? where hbook_no=?");
		pstmt.setString(1, hb_pro);
		pstmt.setInt(2, hbook_no);
		pstmt.executeUpdate();
		pstmt.close();
		conn.close();
	}
	
	//테스트 
	public ArrayList<Genre> genreSort(int select_genre) throws SQLException{
		conn=ds.getConnection();
		pstmt = conn.prepareStatement("select * from genre ORDER BY genre_code ASC LIMIT ?,10");
		pstmt.setInt(1, select_genre);
		rs = pstmt.executeQuery();
		//JSONArray genre = new JSONArray();
		ArrayList<Genre> genre = new ArrayList<Genre>();
		while(rs.next()){
			Genre g = new Genre();
			g.setGenre_code(rs.getInt("genre_code"));
			g.setGenre_name(rs.getString("genre_name"));
			genre.add(g);
			//JSONObject j = new JSONObject();
			//StringBuffer json = new StringBuffer();
			//json.append("{\"genre_code\" : \""+ rs.getInt("genre_code")+"\"} ,");
			//json.append("{\"genre_name\" : \""+ rs.getString("genre_name")+"\"}");
			//String str = "{\"genre_code\" : \""+ rs.getInt("genre_code")+"\"} ,"
			//		+ "{\"genre_name\" : \""+ rs.getString("genre_name")+"\"}";
			
		}
		return genre;
		
	}
}


