package dokmin.library.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



import dokmin.library.dao.Mdao;
import dokmin.library.dto.Member;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class MmodifyFormAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {

		
		String send_id = request.getParameter("send_id");
		
		Mdao dao = new Mdao();
		Member m = dao.mSelectforUpdate(send_id);
		
		request.setAttribute("m", m);
		
		MActionForward forward = new MActionForward();
		forward.setRedirect(false);
		forward.setPath("/member/member_modify.jsp");
		return forward;
	}

}