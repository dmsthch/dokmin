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
		System.out.println("LoginController doGet�޼���");
		LoginProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("LoginController doPost�޼���");
		LoginProcess(request,response);
	}
	
	private void LoginProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		System.out.println("�α��� ���μ��� �޼��� ����");
		request.setCharacterEncoding("euc-kr");
		//URI��������
		String RequestURI=request.getRequestURI();
		//������Ʈ�� ��������
		String contextPath=request.getContextPath();
		//URI ���� ������Ʈ��ŭ�� ����
		String command=RequestURI.substring(contextPath.length());
		//����غ�
		System.out.println(RequestURI + "<-- RequestURI BController.java");
		System.out.println(contextPath + "<-- contextPath BController.java");
		System.out.println(contextPath.length() + "<-- contextPath.length() BController.java");
		System.out.println(command + "<-- command BController.java");
		System.out.println("----------BController.java----------------");
		
		//������, �������̽� Ÿ������ ��ü�������� ����
		MActionForward forward = null;
		MActioninterFace action = null;
		
		if(command.equals("/library.dokmin.form.login")){
	//�α��� ȭ�� �̵�
			System.out.println("if�� �α��� ��Ʈ�ѷ� form.login");
			forward = new MActionForward();
			forward.setPath("/login/login_form.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/library.dokmin.pro.login")){
	//�α��� ó��
			System.out.println("if�� �α��� ��Ʈ�ѷ� pro.login");
			action =new LoginAction();
			try {
				forward= action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/main.login")){
	//�α���ó�� �� ����ȭ������ �������ϱ�
			System.out.println();
			forward = new MActionForward();
			forward.setPath("/main.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/library.dokmin.logout.login")){
	//�α׾ƿ�ó��
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
				System.out.println(forward.getPath() + "<--- forward.getPath()[jsp �̵����]  BoardFrontController.java");
				System.out.println();
				dispatcher.forward(request, response);
			}
		}	
		
		
	}

}
