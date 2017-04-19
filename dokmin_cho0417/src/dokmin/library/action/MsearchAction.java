package dokmin.library.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Mdao;
import dokmin.library.dto.Member;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class MsearchAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("°Ë»öexecute MsearchAction.java");
		
		String sk = request.getParameter("sk");
		String sv = request.getParameter("sv");
		System.out.println(sk + "<-- sk");
		System.out.println(sv + "<-- sv");

		Mdao dao = new Mdao();
	
		ArrayList<Member> alm = dao.mSearch(sk, sv);
		
	
		request.setAttribute("alm",alm);
		
		MActionForward forward = new MActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/member_list.jsp");
		
		return forward;

	
	}

}
