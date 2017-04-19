package dokmin.library.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Bdao;
import dokmin.library.dto.HopeBook;
import dokmin.library.forward.MActionForward;
import dokmin.library.inter.MActioninterFace;

public class BhopelistAction implements MActioninterFace {

	@Override
	public MActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute�޼��� ���� BhopelistAction.java");
		//������� ����Ʈ�� ����ϴ� �޼��� ����
		Bdao dao = new Bdao();
		ArrayList<HopeBook> hb =dao.hopebookList();
		System.out.println(hb + "<<<----hb");
		//�������� ������Ʈ ������ ����
		request.setAttribute("hopebook", hb);
		
		MActionForward forward = new MActionForward();
		forward.setPath("/book/book_hope_list.jsp");
		forward.setRedirect(false);
		return forward;
	}

}
