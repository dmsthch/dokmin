package dokmin.library.action;

import java.sql.Connection;

import javax.naming.Context;
import javax.naming.InitialContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.sql.DataSource;

import dokmin.library.dao.Bdao;
import dokmin.library.dto.Book;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class BinsertAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute메서드 실행 BinsertAction.java");
		//값 받아오기
		String book_title=request.getParameter("book_title");
		String book_writer=request.getParameter("book_writer");
		String book_publisher=request.getParameter("book_publisher");
		String book_date=request.getParameter("book_date");
		int book_genre=Integer.parseInt(request.getParameter("book_genre"));
		int book_price=Integer.parseInt(request.getParameter("book_price"));
		String book_manager=request.getParameter("book_manager");
		int  book_volume=Integer.parseInt(request.getParameter("book_volume"));
		
		DataSource ds;
			Context init = new InitialContext();
			System.out.println(init + "<-- init Mdao() ");
	  	    ds = (DataSource) init.lookup("java:comp/env/jdbc/MysqlDB");
		Connection conn=ds.getConnection();
		conn.setAutoCommit(false);
		try{
			//권수만큼 반복한다 (ISBN코드 뒤에 권수만큼 _1 _2를 붙여 같은 책을 추가하도록 함
			for(int i=1; i<=book_volume; i++){
			Book b = new Book();
			//도서 코드는 여기에서 받아주고,
			String book_code=request.getParameter("book_code");
			//코드에 언더바와 1,2,3,...을 붙여가도록 한다.
			book_code = book_code+"_"+i;
			System.out.println(book_code);
			b.setBook_code(book_code);
			b.setBook_date(book_date);
			b.setBook_genre(book_genre);
			b.setBook_manager(book_manager);
			b.setBook_price(book_price);
			b.setBook_publisher(book_publisher);
			b.setBook_title(book_title);
			b.setBook_writer(book_writer);
			String e = null;
			//커넥션을 Bdao 생성자 메서드로 새롭게 만들지 않기 위해 생성자메서드를 오버로딩함.
			Bdao dao = new Bdao(e);
			int re = dao.bookInsert(b, conn);
			//System.out.println(re+"<---re");
			//그냥두면 _1_2_3 와 같이 꼬리에 계속 붙여나간다.  _1, _2, 이런식이 되도록 한번 초기화 해준다.
			book_code = null;
			}
			
			//for문이 다 반복(권수만큼 전부 입력되면) 커밋
			conn.commit();
		}catch(Exception e){
			//다 되지않으면 롤백
			System.out.println("입력 실패");
			e.printStackTrace();
			conn.rollback();
		}finally{
			conn.close();
		}
		
		MActionForward forward = new MActionForward();
		forward.setPath(request.getContextPath()+"/library.dokmin.list.book");
		forward.setRedirect(true);
		return forward;
	}

}
