package dokmin.library.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Bdao;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class BhopeProgressAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute메서드 BhopeProgressAction.java");
		//1이면 취소됨, 2면 처리중, 3이면 입고됨으로 바꾸는 메서드 실행
		Bdao dao = new Bdao();
		int hb_progress = Integer.parseInt(request.getParameter("hb_progress"));
		int hb_code = Integer.parseInt(request.getParameter("hb_code"));
		dao.HopePro(hb_code, hb_progress);
		
		MActionForward forward= new MActionForward();
		forward.setPath("library.dokmin.hopelist.book");
		forward.setRedirect(false);
		
		return forward;
	}

}
