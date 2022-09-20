package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service1.CommandProcess;

public class FindIdResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String name = request.getParameter("name");
		String email = request.getParameter("email");
	
		MemberDao md = MemberDao.getInstance();
		Member member = md.findId(name, email);		
		
		request.setAttribute("member", member);
		return "findIdResult";
	}

}
