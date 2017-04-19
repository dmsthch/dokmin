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
		//1단계 : Rdao클래스 통해서 새로운 객체를 선언 생성 할당 한다.
				Rdao dao = new Rdao();
				//2단계 : 리스트처리 메스드 호출 후  ArrayList<Rental>로 리턴 받는다.
				ArrayList<Rental> alm = dao.rAllSelect();
				//3단계 : request영역에 셋팅
				request.setAttribute("alm",alm);
				//4단계 : RActionForward 클래스 통해 생성된 객체내에 포워드 하기위한 false값과rental_list.jsp경로 셋팅 후 리턴
				RActionForward forward = new RActionForward();
				forward.setRedirect(false);
				forward.setPath("/rental/rental_list.jsp");
				return forward;
	}

}
