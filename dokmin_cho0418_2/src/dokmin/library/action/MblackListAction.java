package dokmin.library.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Mdao;
import dokmin.library.dto.Member;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class MblackListAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("喉发府胶飘 贸府 execute MblackListAction.java");
		
	
	    Mdao dao = new Mdao();
		ArrayList<Member> alm = new ArrayList<Member>();
		alm = dao.mBlackSelect();
	
		request.setAttribute("alm", alm);
		
		MActionForward forward = new MActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/member_blacklist.jsp");
		
		return forward;
	}

}
