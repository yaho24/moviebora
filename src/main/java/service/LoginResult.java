package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service1.CommandProcess;

public class LoginResult implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String prevUrl = request.getParameter("prevUrl");
//		System.out.println("prevUrl = "+prevUrl);
		if (prevUrl.equals("/movieboraSeo/views/member/joinResult.do"))
			prevUrl = "/movieboraSeo/views/display/mainPage.do?tab=1";
		String id = request.getParameter("id");
		String password = request.getParameter("password");
		
		MemberDao md = MemberDao.getInstance();  
		Member member = md.select(id);
		
		int result = 0;
		if(member==null||member.getMemberDel().equals("y"))
			result=-1;
		else {
			if(member.getMemberPass().equals(password)) {
				int mno = member.getMemberNo();
				HttpSession session = request.getSession();
				session.setAttribute("id", id);
				session.setAttribute("mno", mno);
				result = 1;
			}else result=0;
		}
		request.setAttribute("result", result);
		request.setAttribute("prevUrl", prevUrl);
		return "loginResult";
	}
}
