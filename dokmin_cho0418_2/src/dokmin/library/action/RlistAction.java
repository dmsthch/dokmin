package dokmin.library.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Rdao;
import dokmin.library.dto.Rental;
import dokmin.library.forward.RActionForward;
import dokmin.library.inter.RActioninterFace;


public class RlistAction implements RActioninterFace {

	@Override
	public RActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute RlistAction.java");
		//1�ܰ� : RdaoŬ���� ���ؼ� ���ο� ��ü�� ���� ���� �Ҵ� �Ѵ�.
				Rdao dao = new Rdao();
				//2�ܰ� : ����Ʈó�� �޽��� ȣ�� ��  ArrayList<Rental>�� ���� �޴´�.
				ArrayList<Rental> alm = dao.rAllSelect();
				//3�ܰ� : request������ ����
				request.setAttribute("alm",alm);
				//4�ܰ� : RActionForward Ŭ���� ���� ������ ��ü���� ������ �ϱ����� false����rental_list.jsp��� ���� �� ����
				RActionForward forward = new RActionForward();
				forward.setRedirect(false);
				forward.setPath("/rental/rental_list.jsp");
				return forward;
	}

}
