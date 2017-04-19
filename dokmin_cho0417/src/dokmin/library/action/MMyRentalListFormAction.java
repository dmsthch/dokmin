package dokmin.library.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import dokmin.library.dao.Mdao;
import dokmin.library.dto.Rental;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class MMyRentalListFormAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		String send_id = request.getParameter("send_id");
		System.out.println(send_id+"<<<send_id MMyRentalListFormAction.java");
		Mdao dao = new Mdao();
		ArrayList<Rental> alm = dao.rSelectforRental(send_id);
		
		request.setAttribute("alm", alm);
		
		MActionForward forward = new MActionForward();
		forward.setRedirect(false);
		forward.setPath("/member/member_myrentallist.jsp");
		return forward;
	}

}