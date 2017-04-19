package dokmin.library.action;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.websocket.Session;

import dokmin.library.dao.Logdao;
import dokmin.library.dao.Mdao;
import dokmin.library.dto.Member;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class LoginAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute 메서드 LoginAction.java");
		//입력한 값을 받아온다.
		Logdao dao = new Logdao();
		String member_id=request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		//member객체에 셋팅하고,
		Member m = new Member();
		m.setMember_id(member_id);
		m.setMember_pw(member_pw);
		//로그인 체크 메서드를 호출하여 아이디 비번이 맞는지 확인.
		int check = dao.loginCheck(m);
		HttpSession session=request.getSession();
		MActionForward forward = null;
		
		//3이면 로그인 성공, 2면 비밀번호 불일치, 1이면 아이디 불일치이다.
		if(check==3){
			//로그인성공하면, 아이디와 이름, 권한을 세션에 셋팅한다.
			Mdao mdao = new Mdao();
			 m = mdao.mSelectforUpdate(member_id);
			 String get_id= m.getMember_id();
			 String get_name= m.getMember_name();
			 String get_level= m.getMember_level();
			 session.setAttribute("S_id", get_id);
			 session.setAttribute("S_name", get_name);
			 session.setAttribute("S_level", get_level);
			 //여기에서  forward셋팅
			 forward = new MActionForward();
			 forward.setPath(request.getContextPath()+"/main.login");
			 forward.setRedirect(true);
			 return forward;
		}else if(check==2){
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('비밀번호가 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}else if(check==1){
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('아이디가 일치하지 않습니다.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		
		return null;
	}

}
