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
		System.out.println("BController doGet�޼���");
		mProcess(request,response);
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("BController doPost�޼���");
		mProcess(request,response);
	}
	
	private void mProcess(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException{
		System.out.println("BController mProcess�޼���");
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
		
		//���Ǻб� ����. URI�� �ּҿ� ���� �б�ȴ�
		if(command.equals("/library.dokmin.list.book")){
	//��������Ʈ�϶�
			System.out.println("if�� library.dokmin.list.book");
			action = new BlistAction();
			try {forward=action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
			
		}else if(command.equals("/library.dokmin.modify.book")){
	//�����������϶�
			System.out.println("if�� library.dokmin.modify.book");
			//�ϳ��� ���� ���� �ҷ��;���.
			action= new BmodifyAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
			
		}else if(command.equals("/library.dokmin.modify.pro.book")){
	//�������������� ����ó���Ҷ�
			System.out.println("if�� modify.pro.book");
			action = new BmodifyProAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		
		}else if(command.equals("/library.dokmin.delete.book")){
	//����Ʈ���� ����ó���Ҷ�
			System.out.println("if�� delete.book");
			action = new BdeleteAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}
		
		}else if(command.equals("/library.dokmin.delete.fail.book")){
	//����ó���� ����������.
			System.out.println("if�� ����ó������.book");
			forward = new MActionForward();
			forward.setPath("/book/book_delete_fail.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/library.dokmin.insert.book")){
	//���� �߰� ���� ����
			System.out.println("if�� insert.book");
			forward = new MActionForward();
			forward.setPath("/book/book_insert.jsp");
			forward.setRedirect(false);
			
		}else if(command.equals("/library.dokmin.insert.pro.book")){
	//���� �߰� ó��
			System.out.println("if�� insertpro.book");
			action = new BinsertAction();
			try {forward = action.execute(request, response);} catch (Exception e) {e.printStackTrace();}

		}else if(command.equals("/library.dokmin.hope.book")){
	//���������û ��
			System.out.println("if�� hope.book");
			forward = new MActionForward();
			forward.setPath("/book/book_hope.jsp");
			forward.setRedirect(false);
		}else if(command.equals("/library.dokmin.hope.pro.book")){
	//������� ��û ó��
			System.out.println("if�� hope.pro.book");
			action = new BhopeAction();
			try {
				forward= action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/library.dokmin.hopelist.book")){
	//������� ����Ʈ
			System.out.println("if�� hope.list.book");
			action = new BhopelistAction();
			try {
				forward= action.execute(request, response);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}else if(command.equals("/library.dokmin.hope.progress.book")){
	//������� ���¹ٲٱ� 
			System.out.println("if�� hope.progress.book");
			//progress�� 1�̸� ���, 2�� ó����, 3�̸� �԰��.
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

}
