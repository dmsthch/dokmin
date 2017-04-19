package dokmin.library.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Bdao;
import dokmin.library.dto.Book;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class BlistAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("BlistAction.java execute�޼��� ����");
		Bdao dao = new Bdao();
		ArrayList<Book> alb = new ArrayList<Book>();
		ArrayList<String> bg = new ArrayList<String>();

		//��������Ʈ ��ü�� ����Ʈ�ϴ� �޼��带 ȣ���ϰ� arraylistŸ������ �޾���
		alb = dao.bookList();

		//�������� alb�� ��� ������ ��ŭ �ݺ��Ͽ�
		//�帣�ڵ�(�ѱ�)�� �ٸ� ����Ʈ�� ��ƺ�������
		for(int i=0; i<alb.size(); i++){
			Book b = alb.get(i);
			String bgresult=dao.bookGenre(b.getBook_genre());
			bg.add(bgresult);
		}
		
		//�帣�ڵ�(�ѱ�)��, ������ü����Ʈ�� ������Ʈ������ ����
		request.setAttribute("bg", bg);
		request.setAttribute("alb", alb);
		//������, ��������Ʈ �ּ� ��Ƽ� ����
		MActionForward forward = new MActionForward();
		forward.setPath("/book/book_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
