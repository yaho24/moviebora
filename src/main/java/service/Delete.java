package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import service1.CommandProcess;

public class Delete implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String)session.getAttribute("id");
		int mno = 0;
		int result = 0;
		MemberDao md = MemberDao.getInstance();
		if (id.equals("admin")) {
			mno = Integer.parseInt(request.getParameter("mno"));
			result = md.delete(mno);
			
		} else {
			if(id!=null) {
				mno = (int) session.getAttribute("mno");
				result = md.delete(mno);
				if(result>0) session.invalidate();
			}
		}
		request.setAttribute("result", result);
		return "delete";
	}
}
