package dokmin.library.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Bdao;
import dokmin.library.dto.Book;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class BmodifyAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BmodifyAction.java execute�޼��� ����");
		//�ϳ��� ���� ���� �ҷ��;���.
		Bdao dao = new Bdao();
		//������ ������ �ҷ��������� b_code�޾ƿ���
		String b_code = request.getParameter("b_code");
		//1�� �������� �޴� �޼��� ����
		Book b =dao.bookForModify(b_code);
		//�帣�ڵ带 �����ͼ� �ѱ��ڵ�� �����ð��̴�.
		String bgResult=dao.bookGenre(b.getBook_genre());	
		
		//����� �̸��� �����ؼ� �����ð��̴�.
		String manager_name = dao.bookManagerName(b_code);
		
		//������Ʈ ������ bookŸ������ ����
		request.setAttribute("book", b);
		//������Ʈ ������ �ѱ� �帣�ڵ嵵 ���� ����
		request.setAttribute("bg", bgResult);
		//������Ʈ ������ ����� �̸��� ����
		request.setAttribute("manager_name", manager_name);
		
		//������&����ȭ���� �ּҸ� �ְ� 
		MActionForward forward = new MActionForward();
		forward.setPath("/book/book_modify.jsp");
		forward.setRedirect(false);
		//�����带 ��������
		return forward;
	}

}
