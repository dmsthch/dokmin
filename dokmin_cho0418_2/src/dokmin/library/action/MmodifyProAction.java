package dokmin.library.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Mdao;
import dokmin.library.dto.Member;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class MmodifyProAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MmodifyProAction");
		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		String member_name = request.getParameter("member_name");
		String member_birth = request.getParameter("member_birth");
		String member_phone = request.getParameter("member_phone");
		String member_addr = request.getParameter("member_addr");
		
		

		Member m = new Member();
		m.setMember_id(member_id);
		m.setMember_pw(member_pw);
		m.setMember_name(member_name);
		m.setMember_birth(member_birth);
		m.setMember_phone(member_phone);
		m.setMember_addr(member_addr);
		
		
		Mdao dao = new Mdao();
		dao.mModify(m);
		MActionForward forward = new MActionForward();
		forward.setPath(request.getContextPath()+"/main.jsp");
		forward.setRedirect(true);
		return forward;
	}

}


