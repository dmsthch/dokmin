package dokmin.library.controller;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.action.LoginAction;
import dokmin.library.action.LogoutAction;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

@WebServlet("/LoginController")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public LoginController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LoginController doGet메서드");
		LoginProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LoginController doPost메서드");
		LoginProcess(request,response);
	}
	
	private void LoginProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		System.out.println("로그인 프로세스 메서드 실행");
		request.setCharacterEncoding("euc-kr");
		//URI가져오기
		String RequestURI=request.getRequestURI();
		//프로젝트명 가져오기
		String contextPath=request.getContextPath();
		//URI 빼기 프로젝트명만큼의 길이
		String command=RequestURI.substring(contextPath.length());
		//출력해봄
		System.out.println(RequestURI + "<-- RequestURI BController.java");
		System.out.println(contextPath + "<-- contextPath BController.java");
		System.out.println(contextPath.length() + "<-- contextPath.length() BController.java");
		System.out.println(command + "<-- command BController.java");
		System.out.println("----------BController.java----------------");
		
		//포워드, 인터페이스 타입으로 객체참조변수 선언
		MActionForward forward = null;
		MActioninterFace action = null;
		
		if(command.equals("/library.dokmin.form.login")){
	//로그인 화면 이동
			System.out.println("if문 로그인 컨트롤러 form.login");
			forward = new MActionForward();
			forward.setPath("/login/login_form.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/library.dokmin.pro.login")){
	//로그인 처리
			System.out.println("if문 로그인 컨트롤러 pro.login");
			action =new LoginAction();
			try {
				forward= action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/main.login")){
	//로그인처리 후 메인화면으로 가도록하기
			System.out.println();
			forward = new MActionForward();
			forward.setPath("/main.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/library.dokmin.logout.login")){
	//로그아웃처리
			action = new LogoutAction();
			try {
				forward=action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		
		if(forward != null){
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher=
					request.getRequestDispatcher(forward.getPath());
				System.out.println(forward.getPath() + "<--- forward.getPath()[jsp 이동경로]  BoardFrontController.java");
				System.out.println();
				dispatcher.forward(request, response);
			}
		}	
		
		
	}

}
