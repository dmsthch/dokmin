package dokmin.library.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Mdao;
import dokmin.library.dto.Member;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class MsignupAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("MsignupAction.java");
		String member_id = request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		String member_name = request.getParameter("member_name");
		String member_birth = request.getParameter("member_birth");
		String member_phone = request.getParameter("member_phone");
		String member_addr = request.getParameter("member_addr");
		
		System.out.println(member_id + "<-- member_id MsignupAction.java");
		System.out.println(member_pw + "<-- member_pw MsignupAction.java");
		System.out.println(member_name + "<-- member_name MsignupAction.java");
		System.out.println(member_birth + "<-- member_birth MsignupAction.java");
		System.out.println(member_phone + "<-- member_phone MsignupAction.java");
		System.out.println(member_addr + "<-- member_addr MsignupAction.java");
		
		Member m = new Member();
		m.setMember_id(member_id);
		m.setMember_pw(member_pw);
		m.setMember_name(member_name);
		m.setMember_birth(member_birth);
		m.setMember_phone(member_phone);
		m.setMember_addr(member_addr);
		
		
		Mdao dao = new Mdao();
		dao.mSignup(m);
		
		MActionForward forward = new MActionForward();
		forward.setRedirect(true);
		forward.setPath(request.getContextPath()+"/main.jsp");
		return forward;
	}

}
