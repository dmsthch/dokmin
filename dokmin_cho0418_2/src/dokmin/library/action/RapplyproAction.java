package dokmin.library.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.dao.Rdao;
import dokmin.library.dto.Rental;
import dokmin.library.forward.RActionForward;
import dokmin.library.inter.RActioninterFace;



public class RapplyproAction implements RActioninterFace {

	@Override
	public RActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		System.out.println("execute RapplyproAction.java");
		//1�ܰ� : ȭ�鿡�� �Է��� ������ �޴´�
				String Book_code = request.getParameter("Book_code");
				String Member_id = request.getParameter("Member_id");
				String Rental_date =  new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
				
				System.out.println(Book_code + "<-- Book_code RapplyAction.java");
				System.out.println(Member_id + "<-- Member_id RapplyAction.java");
				System.out.println(Rental_date + "<-- Rental_date RapplyAction.java");
				
				//2�ܰ� : RentalŬ���� ���ؼ� ��ü ���� �� �� ����
				Rental r = new Rental();
				r.setBook_code(Book_code);
				r.setMember_id(Member_id);
				r.setRental_date(Rental_date);
			
				//3�ܰ� : RdaoŬ���� ���ؼ� ��ü ���� �� �Է�ó���޼��� ȣ��
				Rdao dao = new Rdao();
				dao.rInsert(r);
				//4�ܰ�: RActionForward Ŭ���� ���� ������ ��ü���� �����̷�Ʈ�ϱ� ���� true
				//�� /library.dokmin.list.rental ��θ� ������ �ּҰ� ����
				
				RActionForward forward = new RActionForward();
				forward.setRedirect(true);
				forward.setPath(request.getContextPath() + "/library.dokmin.list.rental");
				return forward;
	
	}

}
