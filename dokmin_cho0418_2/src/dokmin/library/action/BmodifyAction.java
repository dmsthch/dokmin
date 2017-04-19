package dokmin.library.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Bdao;
import dokmin.library.dto.Book;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class BmodifyAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BmodifyAction.java execute메서드 실행");
		//하나의 도서 정보 불러와야함.
		Bdao dao = new Bdao();
		//도서의 정보를 불러오기위해 b_code받아오기
		String b_code = request.getParameter("b_code");
		//1개 동서정보 받는 메서드 실행
		Book b =dao.bookForModify(b_code);
		//장르코드를 가져와서 한글코드로 가져올것이다.
		String bgResult=dao.bookGenre(b.getBook_genre());	
		
		//담당자 이름도 조인해서 가져올것이다.
		String manager_name = dao.bookManagerName(b_code);
		
		//리퀘스트 영역에 book타입으로 세팅
		request.setAttribute("book", b);
		//리퀘스트 영역에 한글 장르코드도 같이 세팅
		request.setAttribute("bg", bgResult);
		//리퀘스트 영역에 담당자 이름도 세팅
		request.setAttribute("manager_name", manager_name);
		
		//포워드&수정화면의 주소를 넣고 
		MActionForward forward = new MActionForward();
		forward.setPath("/book/book_modify.jsp");
		forward.setRedirect(false);
		//포워드를 리턴해줌
		return forward;
	}

}
