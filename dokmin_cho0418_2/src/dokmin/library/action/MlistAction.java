package dokmin.library.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Mdao;
import dokmin.library.dto.Member;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class MlistAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("리스트 처리 execute MlistAction.java");
		
	
	    Mdao dao = new Mdao();
		ArrayList<Member> alm = new ArrayList<Member>();
		alm = dao.mAllSelect();
	
		request.setAttribute("alm", alm);
		
		MActionForward forward = new MActionForward();
		forward.setRedirect(false);
		forward.setPath("./member/member_list.jsp");
		
		return forward;
	}

}
