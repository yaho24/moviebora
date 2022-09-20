package service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import model.Member;
import service1.CommandProcess;

public class UpdateForm implements CommandProcess {

	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) {
		HttpSession session = request.getSession();
		String id = (String) session.getAttribute("id");

		// 이전 주소 경로 가져오기
		String prevUrl = request.getHeader("Referer");
		prevUrl = prevUrl.substring(21);

		Member member = new Member();
		MemberDao md = MemberDao.getInstance();

		if (id.equals("admin")) {
			int mno = Integer.parseInt(request.getParameter("mno"));
			member = md.select(mno);
		} else {
			member = md.select(id);
		}
		request.setAttribute("member", member);
		request.setAttribute("prevUrl", prevUrl);
		
		return "updateForm";
	}
}
