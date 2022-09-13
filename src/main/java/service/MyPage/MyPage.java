package service.MyPage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.ReviewDao;
import dao.StarsDao;
import model.Member;
import model.Review;
import model.Stars;
import service.CommandProcess;

public class MyPage implements CommandProcess 
{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session = request.getSession();
		
		String id = (String)session.getAttribute("id");

		if (id != null)
		{
			
			MemberDao md = MemberDao.getInstance();
			Member member = md.select(id);
			// 로그인한 애 정보
			StarsDao sd = StarsDao.getInstance();
			int starsTotal = sd.getTotal(id);
			// 로그인한 애 별점먹인 수
			List<Stars> StarsList = sd.StarsList(id);
			// 로그인한 애 별점 리스트 
			
			ReviewDao rd = ReviewDao.getInstance();
			int reviewTotal = rd.getTotal(id);
			// 로그인한 애 리뷰 수
			List<Review> ReviewList = rd.ReviewList(id);
			// 로그인한 애 리뷰 리스트

			request.setAttribute("member", member);
			request.setAttribute("starsTotal", starsTotal);
			request.setAttribute("reviewTotal", reviewTotal);
			request.setAttribute("starsList", StarsList);
			request.setAttribute("reviewList", ReviewList);
		}
		
		return "myPage";
	}
}