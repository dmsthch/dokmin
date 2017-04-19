package dokmin.library.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.action.RapplyAction;
import dokmin.library.action.RapplyproAction;
import dokmin.library.action.RlistAction;
import dokmin.library.action.RlistreturnAction;
import dokmin.library.action.RmodifyAction;
import dokmin.library.forward.RActionForward;
import dokmin.library.inter.RActioninterFace;



@WebServlet("/RController")
public class RController extends HttpServlet {
	private static final long serialVersionUID = 1L;
    public RController() {
        super();
    
    }
    private void rProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("euc-kr");
    	System.out.println("03_rProcess RController");
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		System.out.println(RequestURI + "<-- RequestURI RController.java");
		System.out.println(contextPath + "<-- contextPath RController.java");
		System.out.println(contextPath.length() + "<-- contextPath.length() RController.java");
		System.out.println(command + "<-- command RController.java");
		System.out.println("----------RController.java----------------");
		RActionForward forward = null;
		RActioninterFace action = null;
		if(command.equals("/library.dokmin.applystart.rental")){
			//�뿩 �޴� ��������, ���̵� �Է������� ������ ��
			System.out.println("library.dokmin.applystart.rental.RController");
			forward = new RActionForward();
			forward.setRedirect(false);
			forward.setPath("/rental/rental_apply_start.jsp");
		}else if(command.equals("/library.dokmin.apply.rental")){
			//���̵� �Է��ϰ� �˻���ư������ �׾��̵� ���� ����Ʈ�ؼ� �뿩��û������ �̵�.
			System.out.println("library.dokmin.apply.rental.RController");
			action = new RapplyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/library.dokmin.applypro.rental")){
			//�뿩��û������ �뿩��û��� �ۼ��� Ȯ���� ������ �뿩����Ʈ�� ����� �߰�
			System.out.println("library.dokmin.applypro.rental.RController");
			action = new RapplyproAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/library.dokmin.list.rental")){
			//�뿩 ����Ʈ �޾ƿ��� 
			System.out.println("library.dokmin.list.rental.RController");
			action = new RlistAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/library.dokmin.modify.rental")){
			System.out.println("library.dokmin.modify.rental.RController");
			action = new RmodifyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}else if(command.equals("/library.dokmin.list.return.rental")){
		//�뿩 ���¹ٲٱ� 
		System.out.println("if�� rental.return.rental");
		//progress�� 1�̸� �뿩��, 2�� �ݳ���
		System.out.println(request.getParameter("rental_return")+"<<send_return");
		//System.out.println(request.getParameter(rental_code+"<---rental_code");
		action = new RlistreturnAction();
			try {
				forward= action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//--- ���࿡ forward ��ü�������� ����ִ� ���� null�� �ƴϸ�
				//--- ������ �� ���ΰ�? �����̷�Ʈ �Ұ��ΰ�?
				
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
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		System.out.println("01_doGet RController");
		rProcess(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("02_doPost RController");
		rProcess(request,response);
	}

}
