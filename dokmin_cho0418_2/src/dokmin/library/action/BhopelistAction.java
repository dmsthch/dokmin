package dokmin.library.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Bdao;
import dokmin.library.dto.HopeBook;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class BhopelistAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute메서드 실행 BhopelistAction.java");
		//희망도서 리스트를 출력하는 메서드 실행
		Bdao dao = new Bdao();
		ArrayList<HopeBook> hb =dao.hopebookList();
		System.out.println(hb + "<<<----hb");
		//실행결과를 리퀘스트 영역에 세팅
		request.setAttribute("hopebook", hb);
		
		MActionForward forward = new MActionForward();
		forward.setPath("/book/book_hope_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
