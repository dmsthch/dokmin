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
			//대여 메뉴 눌렀을때, 아이디 입력폼으로 가도록 함
			System.out.println("library.dokmin.applystart.rental.RController");
			forward = new RActionForward();
			forward.setRedirect(false);
			forward.setPath("/rental/rental_apply_start.jsp");
		}else if(command.equals("/library.dokmin.apply.rental")){
			//아이디를 입력하고 검색버튼누르면 그아이디 정보 셀렉트해서 대여신청폼으로 이동.
			System.out.println("library.dokmin.apply.rental.RController");
			action = new RapplyAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
			
		}else if(command.equals("/library.dokmin.applypro.rental")){
			//대여신청폼에서 대여신청목록 작성후 확인을 누르면 대여리스트에 목록이 추가
			System.out.println("library.dokmin.applypro.rental.RController");
			action = new RapplyproAction();
			try {
				forward = action.execute(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else if(command.equals("/library.dokmin.list.rental")){
			//대여 리스트 받아오기 
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
		//대여 상태바꾸기 
		System.out.println("if문 rental.return.rental");
		//progress는 1이면 대여중, 2면 반납됨
		System.out.println(request.getParameter("rental_return")+"<<send_return");
		//System.out.println(request.getParameter(rental_code+"<---rental_code");
		action = new RlistreturnAction();
			try {
				forward= action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
		
		//--- 만약에 forward 객체참조변수 담겨있는 값이 null이 아니면
				//--- 포워드 할 것인가? 리다이렉트 할것인가?
				
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
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {	
		System.out.println("01_doGet RController");
		rProcess(request,response);
	}
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("02_doPost RController");
		rProcess(request,response);
	}

}
