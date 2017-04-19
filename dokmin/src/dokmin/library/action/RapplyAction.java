package dokmin.library.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Rdao;
import dokmin.library.dto.Member;
import dokmin.library.forward.RActionForward;
import dokmin.library.inter.RActioninterFace;

public class RapplyAction implements RActioninterFace {

	@Override
	public RActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute RapplyAction.java");
		Rdao r = new Rdao();
		Member m =r.mSelectforUpdate(request.getParameter("m_id"));
		request.setAttribute("m", m);
		
		RActionForward forward = new RActionForward();
		forward.setRedirect(false);
		forward.setPath("/rental/rental_apply.jsp");
		return forward;
	}

}
