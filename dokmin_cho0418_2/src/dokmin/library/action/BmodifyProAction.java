package dokmin.library.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.eclipse.jdt.internal.compiler.parser.ParserBasicInformation;

import dokmin.library.dao.Bdao;
import dokmin.library.dto.Book;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class BmodifyProAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute메서드 실행 BmodifyProAction.java");
		//데이터 받아오기
		String book_code =request.getParameter("book_code");
		String book_title =request.getParameter("book_title");
		String book_writer =request.getParameter("book_writer");
		String book_publisher =request.getParameter("book_publisher");
		String book_date =request.getParameter("book_date");
		int book_genre = Integer.parseInt(request.getParameter("book_genre"));
		String book_state =request.getParameter("book_state");
		int book_tnor =Integer.parseInt(request.getParameter("book_tnor"));
		int book_price =Integer.parseInt(request.getParameter("book_price"));
		String book_manager =request.getParameter("book_manager");
		
		
		//book dto 세팅
		Book b = new Book();
		b.setBook_code(book_code);
		b.setBook_date(book_date);
		b.setBook_genre(book_genre);
		b.setBook_manager(book_manager);
		b.setBook_price(book_price);
		b.setBook_publisher(book_publisher);
		b.setBook_state(book_state);
		b.setBook_title(book_title);
		b.setBook_tnor(book_tnor);
		b.setBook_writer(book_writer);
		
		//수정처리 메서드 호출
		Bdao dao = new Bdao();
		dao.bookModify(b);
		
		//수정처리를 끝내고 리다이렉트, 리스트화면으로!
		MActionForward forward = new MActionForward();
		forward.setPath(request.getContextPath()+"/library.dokmin.list.book");
		forward.setRedirect(true);
		return forward;
	}

}
