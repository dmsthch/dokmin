package dokmin.library.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dokmin.library.dao.Bdao;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class BhopeAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute 메서드 실행 BhopeAction.java");
		Bdao dao = new Bdao();
		//희망도서 추가하는 메서드 호출
		dao.hbookInsert(request, response);
		MActionForward forward= new MActionForward();
		forward.setPath("/book/book_hope_result.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
