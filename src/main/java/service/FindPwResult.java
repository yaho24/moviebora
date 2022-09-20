package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service1.CommandProcess;

public class FindPwResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.findPassword(id, name);	
		
		request.setAttribute("member", member);
		return "findPwResult";
	}

}
