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
		//1단계 : 화면에서 입력한 값들을 받는다
				String Book_code = request.getParameter("Book_code");
				String Member_id = request.getParameter("Member_id");
				String Rental_date =  new java.text.SimpleDateFormat("yyyyMMdd").format(new java.util.Date());
				
				System.out.println(Book_code + "<-- Book_code RapplyAction.java");
				System.out.println(Member_id + "<-- Member_id RapplyAction.java");
				System.out.println(Rental_date + "<-- Rental_date RapplyAction.java");
				
				//2단계 : Rental클래스 통해서 객체 생성 및 값 셋팅
				Rental r = new Rental();
				r.setBook_code(Book_code);
				r.setMember_id(Member_id);
				r.setRental_date(Rental_date);
			
				//3단계 : Rdao클래스 통해서 객체 생성 후 입력처리메서드 호출
				Rdao dao = new Rdao();
				dao.rInsert(r);
				//4단계: RActionForward 클래스 통해 생성된 객체내에 리다이렉트하기 위한 true
				//와 /library.dokmin.list.rental 경로를 셋팅후 주소값 리턴
				
				RActionForward forward = new RActionForward();
				forward.setRedirect(true);
				forward.setPath(request.getContextPath() + "/library.dokmin.list.rental");
				return forward;
	
	}

}
