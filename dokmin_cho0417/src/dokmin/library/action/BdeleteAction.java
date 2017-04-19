package dokmin.library.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Bdao;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class BdeleteAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute메서드 BdeleteAction.java");
		Bdao dao = new Bdao();
		int result = dao.bookDelete(request.getParameter("b_code"));
		MActionForward forward = new MActionForward();
		//리턴값 1은 성공했을때 리턴받는값이며, 0은 실패했을때 리턴받는다.
		if (result==1){
		forward.setPath(request.getContextPath()+"/library.dokmin.list.book");
		forward.setRedirect(true);
		}else{
		forward.setPath(request.getContextPath()+"/library.dokmin.delete.fail.book");
		forward.setRedirect(true);
		}
		return forward;
	}

}
