package dokmin.library.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Rdao;
import dokmin.library.dto.Rental;
import dokmin.library.forward.RActionForward;
import dokmin.library.inter.RActioninterFace;


public class RmodifyAction implements RActioninterFace {

	@Override
	public RActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("수정화면 execute RmodifyAction.java");

	int rental_no = Integer.parseInt(request.getParameter("rental_no"));
	Rdao dao = new Rdao();
	Rental r = dao.rSelectforUpdate(rental_no);
	request.setAttribute("r", r);
	RActionForward forward = new RActionForward();
	forward.setPath("/rental/rental_modify.jsp");
	forward.setRedirect(false);
		return forward;
	}

}
