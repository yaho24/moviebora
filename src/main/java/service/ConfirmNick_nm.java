package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MemberDao;
import model.Member;
import service1.CommandProcess;

public class ConfirmNick_nm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		String nick_nm = request.getParameter("nick_nm");
		String msg = "";
		int result = 0;
		
		MemberDao md = MemberDao.getInstance();
		Member member = md.confirmNick(nick_nm);
		if(member==null) {
			msg = "사용가능한 별명입니다";
			result = 1;
		}
		else {
			msg = "이미 사용중인 별명입니다";
			result = 0;
		}
		request.setAttribute("msg", msg);
		request.setAttribute("result", result);
		return "confirmNick_nm";
	}
}
