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
		System.out.println("execute�޼��� ���� BinsertAction.java");
		//�� �޾ƿ���
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
			//�Ǽ���ŭ �ݺ��Ѵ� (ISBN�ڵ� �ڿ� �Ǽ���ŭ _1 _2�� �ٿ� ���� å�� �߰��ϵ��� ��
			for(int i=1; i<=book_volume; i++){
			Book b = new Book();
			//���� �ڵ�� ���⿡�� �޾��ְ�,
			String book_code=request.getParameter("book_code");
			//�ڵ忡 ����ٿ� 1,2,3,...�� �ٿ������� �Ѵ�.
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
			//Ŀ�ؼ��� Bdao ������ �޼���� ���Ӱ� ������ �ʱ� ���� �����ڸ޼��带 �����ε���.
			Bdao dao = new Bdao(e);
			int re = dao.bookInsert(b, conn);
			//System.out.println(re+"<---re");
			//�׳ɵθ� _1_2_3 �� ���� ������ ��� �ٿ�������.  _1, _2, �̷����� �ǵ��� �ѹ� �ʱ�ȭ ���ش�.
			book_code = null;
			}
			
			//for���� �� �ݺ�(�Ǽ���ŭ ���� �ԷµǸ�) Ŀ��
			conn.commit();
		}catch(Exception e){
			//�� ���������� �ѹ�
			System.out.println("�Է� ����");
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
