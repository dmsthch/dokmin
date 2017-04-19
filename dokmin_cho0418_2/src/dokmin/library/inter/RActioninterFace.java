package dokmin.library.inter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dokmin.library.forward.RActionForward;

public interface RActioninterFace {
	public RActionForward execute(HttpServletRequest request,HttpServletResponse response) throws Exception;
}
