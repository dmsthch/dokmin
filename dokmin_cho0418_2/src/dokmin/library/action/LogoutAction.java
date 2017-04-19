package dokmin.library.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class LogoutAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		//세션종료
		HttpSession session=request.getSession(false);
		session.invalidate();
		
		MActionForward forward = new MActionForward();
		forward.setPath(request.getContextPath()+"/main.login");
		forward.setRedirect(true);
		return forward;
	}

}
