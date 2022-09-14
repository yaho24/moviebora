package service.MyPage;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.MovieDao;
import dao.ReviewDao;
import dao.StarsDao;
import model.Member;
import model.Movie;
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
			
			MovieDao md2 = MovieDao.getInstance();
			int max = 0;
			String[] genre = new String[4];
			String recommendGenre = null;
			int[] genreList = new int[4]; 
			
			for(int i=0 ; i<StarsList.size() ; i++)
			{
				genre[i] = md2.genre(StarsList.get(i));
				
				if(genre.equals("genre1"))
				{
					genreList[0]++;
				}
				else if(genre.equals("genre2"))
				{
					genreList[1]++;
				}
				else if(genre.equals("genre3"))
				{
					genreList[2]++;
				}
				else
				{
					genreList[3]++;
				}
			}
			
			for(int j=0 ; j<genreList.length ; j++)
			{
				if(genreList[j] > max)
				{
					max = genreList[j];
				}
			}
			
			recommendGenre = genre[max];
			
			List<Movie> RecommendList = md2.RecommendList(recommendGenre);
			// 추천 장르의 영화 리스트

			request.setAttribute("member", member);
			request.setAttribute("starsTotal", starsTotal);
			request.setAttribute("reviewTotal", reviewTotal);
			request.setAttribute("starsList", StarsList);
			request.setAttribute("reviewList", ReviewList);
			request.setAttribute("genre", genre);
			request.setAttribute("recommendList", RecommendList);
			// 추천목록 객체 하나 더만들지, 아니면 어디서 불러와서 영화쪽으로 넘길지 대충 생각해보기
		}
		
		return "myPage";
	}
}