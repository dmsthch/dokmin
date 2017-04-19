package dokmin.library.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Rdao;
import dokmin.library.forward.RActionForward;
import dokmin.library.inter.RActioninterFace;
public class RlistreturnAction implements RActioninterFace {

	public RActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute�޼��� RlistreturnAction.java");
		//1�̸� �뿩��, 2�� �ݳ������� �ٲٴ� �޼��� ����
		Rdao dao = new Rdao();
		int rental_return = Integer.parseInt(request.getParameter("rental_return"));
		int rental_no = Integer.parseInt(request.getParameter("rental_no"));
		dao.RentalReturn(rental_no, rental_return);
		RActionForward forward= new RActionForward();
		forward.setPath(request.getContextPath()+"/library.dokmin.list.rental");
		forward.setRedirect(true);
		
		return forward;
	}

}
