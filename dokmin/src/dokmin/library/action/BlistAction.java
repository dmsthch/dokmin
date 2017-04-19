package dokmin.library.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Bdao;
import dokmin.library.dto.Book;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class BlistAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BlistAction.java execute메서드 실행");
		Bdao dao = new Bdao();
		ArrayList<Book> alb = new ArrayList<Book>();
		ArrayList<String> bg = new ArrayList<String>();

		//도서리스트 전체를 셀렉트하는 메서드를 호출하고 arraylist타입으로 받아줌
		alb = dao.bookList();

		//포문으로 alb에 담긴 정보들 만큼 반복하여
		//장르코드(한글)을 다른 리스트에 담아보려고함
		for(int i=0; i<alb.size(); i++){
			Book b = alb.get(i);
			String bgresult=dao.bookGenre(b.getBook_genre());
			bg.add(bgresult);
		}
		
		//장르코드(한글)과, 도서전체리스트를 리퀘스트영역에 세팅
		request.setAttribute("bg", bg);
		request.setAttribute("alb", alb);
		//포워드, 도서리스트 주소 담아서 리턴
		MActionForward forward = new MActionForward();
		forward.setPath("/book/book_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
