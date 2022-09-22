package service.MyPage;

import java.util.ArrayList;
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
		
		session.setAttribute("memberId", "11");
		System.out.println(session.getAttribute("memberId"));

		if (session.getAttribute("memberId") != null)
		{
			String memberId = (String) session.getAttribute("memberId");
			
			System.out.println(memberId);
			
			MemberDao memberD = MemberDao.getInstance();
			Member member = memberD.selectMember(memberId);
			// 로그인한 애 정보
			
			System.out.println(1);
			
			StarsDao starsD = StarsDao.getInstance();
			int starsTotal = starsD.getTotal(memberId);
			// 로그인한 애 별점먹인 수
			List<Stars> StarsList = starsD.StarsList(memberId);
			// 로그인한 애 별점 리스트 
			
			System.out.println(StarsList.size());
			
			ReviewDao reviewD = ReviewDao.getInstance();
			int reviewTotal = reviewD.getTotal(memberId);
			// 로그인한 애 리뷰 수
			List<Review> ReviewList = reviewD.ReviewList(memberId);
			// 로그인한 애 리뷰 리스트
			
			System.out.println("리뷰까지함 ㅋㅋ 사이즈는?"+ReviewList.size());
			
			MovieDao movieD = MovieDao.getInstance();
			String movieName = "";
			List<String> movieNameList = new ArrayList<>();
			
			
			for(int i=0 ; i<StarsList.size() ; i++)
			{
				movieName = movieD.selectMovieName(StarsList.get(i).getMovieNo());
				movieNameList.add(movieName);
			}
			// 별점먹인 영화 리스트들의 이름 리스트
			
			System.out.println("무비네임리스트 가져왔나? : "+movieNameList.size());
			
			int max = 0;
			int genreNo = 0;
			int[] genreCount = new int[4]; 
			String genre = "";
			
			for(int i=0 ; i<StarsList.size() ; i++)
			{
				genre = movieD.checkGenre(StarsList.get(i).getMovieNo());
				
				if(genre.equals("1"))
				{
					genreCount[0]++;
				}
				else if(genre.equals("2"))
				{
					genreCount[1]++;
				}
				else if(genre.equals("3"))
				{
					genreCount[2]++;
				}
				else
				{
					genreCount[3]++;
				}
			}
			
			for(int j=0 ; j<genreCount.length ; j++)
			{
				if(max < genreCount[j])
				{
					max = genreCount[j];
					genreNo = j;
				}
			}
			
			switch(genreNo)
			{
				case 0 : genre = "1";
						 break;
				case 1 : genre = "2";
				 		 break;
				case 2 : genre = "3";
				 		 break;
				default : genre = "4";
						  break;
			}
			
			System.out.println("여기까진했나");
			
			System.out.println("장르"+genre+"장르번호"+genreNo);
			
			List<Movie> RecommendList = movieD.RecommendList(genre);
			// 장르 추천 영화 리스트
			
			System.out.println("장르영화목록 나왔나?"+RecommendList.size());
			
			for(int i=0 ; i<RecommendList.size() ; i++)
			{
				System.out.println(RecommendList.get(i).getMovieName());
			}
			
			for(int j=0 ; j<StarsList.size() ; j++)
			{
				int movieNoTemp = StarsList.get(j).getMovieNo();
				
				for(int k=0 ; k<RecommendList.size() ; k++)
				{
					if(RecommendList.get(k).getMovieNo() == movieNoTemp)
					{
						RecommendList.remove(k);
					}
				}
			}
			
			System.out.println("필터링 한 후의 리스트 나왔나?"+RecommendList.size());

			request.setAttribute("member", member);
			request.setAttribute("starsTotal", starsTotal);
			request.setAttribute("reviewTotal", reviewTotal);
			request.setAttribute("starsList", StarsList);
			request.setAttribute("reviewList", ReviewList);
			request.setAttribute("movieNameList", movieNameList);
			request.setAttribute("recommendList", RecommendList);
		}
		
		return "myPage";
	}
}