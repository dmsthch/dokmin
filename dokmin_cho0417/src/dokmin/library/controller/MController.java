package dokmin.library.controller;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.action.MMyRentalListFormAction;
import dokmin.library.action.MMyhopeListAction;
import dokmin.library.action.MblackListAction;
import dokmin.library.action.MlistAction;
import dokmin.library.action.MmodifyFormAction;
import dokmin.library.action.MmodifyProAction;
import dokmin.library.action.MsearchAction;
import dokmin.library.action.MsignupAction;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;





@WebServlet("/MController")
public class MController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public MController() {
        super();
    }
    
    private void mProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	request.setCharacterEncoding("euc-kr");
    	System.out.println("03_mProcess MController");
    	String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());
		System.out.println(RequestURI + "<-- RequestURI MController.java");
		System.out.println(contextPath + "<-- contextPath MController.java");
		System.out.println(command + "<-- command MController.java");
		System.out.println("----MController.java ----- ");
		 
		MActionForward forward = null;
		MActioninterFace action = null;
		if(command.equals("/library.dokmin.signup.member")){
			System.out.println("/library.dokmin.signup.member MController.java");
			   action =new MsignupAction();
			   try{
				   forward = action.execute(request, response);
			   } catch (Exception e) {
				   e.printStackTrace();
			   }
		}else if(command.equals("/library.dokmin.signupform.member")){
			System.out.println("/library.dokmin.signupform.member MController.java");
			forward = new MActionForward();
			forward.setPath("/member/member_signup.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/library.dokmin.list.member")){
			System.out.println("/library.dokmin.list.member.java");
			action = new MlistAction();
			try{
				forward = action.execute(request, response);
			}catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/library.dokmin.modifyform.member")){
			System.out.println("/library.dokmin.modifyform.member MController.java");
			action = new MmodifyFormAction();
			try{
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/library.dokmin.modifypro.member")){
    		System.out.println("/library.dokmin.modifypro.member MController.java");
    		action = new MmodifyProAction();
    		try{
    			forward = action.execute(request, response);
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
		}else if(command.equals("/library.dokmin.blacklist.member")){
    		System.out.println("/library.dokmin.blacklist.member MController.java");
    		action = new MblackListAction();
    		try{
    			forward = action.execute(request, response);
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
		}else if(command.equals("/library.dokmin.search.member")){
    		System.out.println("/library.dokmin.search.member MController.java");
    		action = new MsearchAction();
    		try{
    			forward = action.execute(request, response);
    		} catch (Exception e) {
    			e.printStackTrace();
    		}
		}else if(command.equals("/library.dokmin.myrentallistform.member")){
			System.out.println("/library.dokmin.myrentallistform.member MController.java");
			action = new MMyRentalListFormAction();
			try{
				forward = action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
    	
    	}else if(command.equals("/library.dokmin.myhopelist.member")){
    		System.out.println("/library.dokmin.myhopelist.member MController.java");
    		action = new MMyhopeListAction();
    		try{
    			forward = action.execute(request, response);	
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
     
			 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("01_doGet MController");
		mProcess(request,response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("02_doPost MController");
		mProcess(request,response);
		
	}

}
