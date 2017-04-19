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
		System.out.println("execute �޼��� LoginAction.java");
		//�Է��� ���� �޾ƿ´�.
		Logdao dao = new Logdao();
		String member_id=request.getParameter("member_id");
		String member_pw = request.getParameter("member_pw");
		//member��ü�� �����ϰ�,
		Member m = new Member();
		m.setMember_id(member_id);
		m.setMember_pw(member_pw);
		//�α��� üũ �޼��带 ȣ���Ͽ� ���̵� ����� �´��� Ȯ��.
		int check = dao.loginCheck(m);
		HttpSession session=request.getSession();
		MActionForward forward = null;
		
		//3�̸� �α��� ����, 2�� ��й�ȣ ����ġ, 1�̸� ���̵� ����ġ�̴�.
		if(check==3){
			//�α��μ����ϸ�, ���̵�� �̸�, ������ ���ǿ� �����Ѵ�.
			Mdao mdao = new Mdao();
			 m = mdao.mSelectforUpdate(member_id);
			 String get_id= m.getMember_id();
			 String get_name= m.getMember_name();
			 String get_level= m.getMember_level();
			 session.setAttribute("S_id", get_id);
			 session.setAttribute("S_name", get_name);
			 session.setAttribute("S_level", get_level);
			 //���⿡��  forward����
			 forward = new MActionForward();
			 forward.setPath(request.getContextPath()+"/main.login");
			 forward.setRedirect(true);
			 return forward;
		}else if(check==2){
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('��й�ȣ�� ��ġ���� �ʽ��ϴ�.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}else if(check==1){
			response.setContentType("text/html; charset=euc-kr");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('���̵� ��ġ���� �ʽ��ϴ�.');");
			out.println("history.go(-1);");
			out.println("</script>");
			out.close();
		}
		
		return null;
	}

}
