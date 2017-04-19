package dokmin.library.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.simple.JSONObject;

import dokmin.library.action.BdeleteAction;
import dokmin.library.action.BhopeAction;
import dokmin.library.action.BhopeProgressAction;
import dokmin.library.action.BhopelistAction;
import dokmin.library.action.BinsertAction;
import dokmin.library.action.BlistAction;
import dokmin.library.action.BmodifyAction;
import dokmin.library.action.BmodifyProAction;
import dokmin.library.dao.Bdao;
import dokmin.library.dto.Genre;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

@WebServlet("/BController")
public class BController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       

    public BController() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BController doGet메서드");
		mProcess(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BController doPost메서드");
		mProcess(request,response);
	}
	
	private void mProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		System.out.println("BController mProcess메서드");
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
		
		//조건분기 시작. URI의 주소에 따라 분기된다
		if(command.equals("/library.dokmin.list.book")){
	//도서리스트일때
			System.out.println("if문 library.dokmin.list.book");
			action = new BlistAction();
			try {forward=action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
			
		}else if(command.equals("/library.dokmin.modify.book")){
	//도서수정폼일때
			System.out.println("if문 library.dokmin.modify.book");
			//하나의 도서 정보 불러와야함.
			action= new BmodifyAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
			
		}else if(command.equals("/library.dokmin.modify.pro.book")){
	//도서수정폼에서 수정처리할때
			System.out.println("if문 modify.pro.book");
			action = new BmodifyProAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		
		}else if(command.equals("/library.dokmin.delete.book")){
	//리스트에서 삭제처리할때
			System.out.println("if문 delete.book");
			action = new BdeleteAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		
		}else if(command.equals("/library.dokmin.delete.fail.book")){
	//삭제처리에 실패했을때.
			System.out.println("if문 삭제처리실패.book");
			forward = new MActionForward();
			forward.setPath("/book/book_delete_fail.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/library.dokmin.insert.book")){
	//도서 추가 폼에 갈때
			System.out.println("if문 insert.book");
			forward = new MActionForward();
			forward.setPath("/book/book_insert.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/library.dokmin.insert.pro.book")){
	//도서 추가 처리
			System.out.println("if문 insertpro.book");
			action = new BinsertAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}

		}else if(command.equals("/library.dokmin.hope.book")){
	//희망도서신청 폼
			System.out.println("if문 hope.book");
			forward = new MActionForward();
			forward.setPath("/book/book_hope.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/library.dokmin.hope.pro.book")){
	//희망도서 신청 처리
			System.out.println("if문 hope.pro.book");
			action = new BhopeAction();
			try {
				forward= action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/library.dokmin.hopelist.book")){
	//희망도서 리스트
			System.out.println("if문 hope.list.book");
			action = new BhopelistAction();
			try {
				forward= action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/library.dokmin.hope.progress.book")){
	//희망도서 상태바꾸기 
			System.out.println("if문 hope.progress.book");
			//progress는 1이면 취소, 2면 처리중, 3이면 입고됨.
			System.out.println(request.getParameter("hb_progress")+"<<send_progress");
			System.out.println(request.getParameter("hb_code")+"<---hb_code");
			action = new BhopeProgressAction();
			try {
				forward= action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}/*else if(command.equals("/library.dokmin.test.book")){
	
			System.out.println("test!@@@!@!");
			int b_genre = Integer.parseInt(request.getParameter("b_genre"));
			Bdao dao = new Bdao();
			StringBuffer json = new StringBuffer();
			try {
				ArrayList<Genre> genreList =dao.genreSort(b_genre);
						json.append("[");
						System.out.println(genreList.size());
					for(int i =0; i<genreList.size(); i++){
						Genre g = genreList.get(i);
						if(i==(genreList.size()-1)){
							json.append("{\"genre_code\" : \""+ g.getGenre_code()+  "\",");
							json.append(" \"genre_name\" : \""+ g.getGenre_name()+"\"}");
						}else{
							json.append("{\"genre_code\" : \""+ g.getGenre_code()+  "\",");
							json.append(" \"genre_name\" : \""+ g.getGenre_name()+"\"}, ");
						}
					}
						json.append("]");
				response.setContentType("text/xml;charset=euckr");
				PrintWriter writer = response.getWriter();
				writer.write(json.toString());
				System.out.println(json.toString());
				writer.flush();
				writer.close();
				
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
			
		}
			*/
		
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

}
