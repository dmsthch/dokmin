package dokmin.library.inter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dokmin.library.forward.MActionForward;

public interface MActioninterFace {
	public MActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;

}



