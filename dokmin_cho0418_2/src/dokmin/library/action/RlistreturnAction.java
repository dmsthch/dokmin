package dokmin.library.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Rdao;
import dokmin.library.forward.RActionForward;
import dokmin.library.inter.RActioninterFace;
public class RlistreturnAction implements RActioninterFace {

	public RActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute메서드 RlistreturnAction.java");
		//1이면 대여중, 2면 반납됨으로 바꾸는 메서드 실행
		Rdao dao = new Rdao();
		int rental_return = Integer.parseInt(request.getParameter("rental_return"));
		int rental_no = Integer.parseInt(request.getParameter("rental_no"));
		dao.RentalReturn(rental_no, rental_return);
		RActionForward forward= new RActionForward();
		forward.setPath(request.getContextPath()+"/library.dokmin.list.rental");
		forward.setRedirect(true);
		
		return forward;
	}

}
