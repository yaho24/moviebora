package service_MyPage;

import service.CommandProcess;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.MemberDao;
import dao.MovieDao;
import dao.StarsDao;
import model.Member;
import model.Movie;
import model.Stars;

public class MyRecommend implements CommandProcess 
{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
	{
		HttpSession session = request.getSession();
		
		if (session.getAttribute("memberNo") != null) 
		{
			int memberNo = (int) session.getAttribute("memberNo");

			MemberDao md = MemberDao.getInstance();
			Member member = md.select(memberNo);

			StarsDao sd = StarsDao.getInstance();
			List<Stars> StarsList = sd.StarsList(memberNo);
			// 로그인한 애 별점 리스트
			
			MovieDao md2 = MovieDao.getInstance();
			
			int max = 0;
			String[] genre = new String[4]; // 장르 종류
			String recommendGenre = null; // 추천 장르 저장할 변수
			int[] genreList = new int[4]; // 장르 당 별점먹인 개수
			int genreNo = 0; // 장르 번호로 표현했을 때 쓰는 변수
			
			for(int i=0 ; i<StarsList.size() ; i++) // 장르명 넣어서 수정해줘야함
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
			genreNo = max;
			
			List<Movie> RecommendList = md2.RecommendList(recommendGenre);
			// 추천 장르의 영화 리스트

			final int ROW_PER_PAGE = 4; // 한 페이지에 게시글 4개 씩
			final int PAGE_PER_BLOCK = 4; // 한 블럭에 4페이지 씩

			String pageNum = request.getParameter("pageNum"); // 페이지 번호
			
			if (pageNum == null || pageNum.equals("")) // 페이지 초기값 1로 설정
			{
				pageNum = "1";
			}
			
			int currentPage = Integer.parseInt(pageNum); // 현재 페이지

			int total = sd.getTotal(memberNo); // 총 게시글 수
			int totalPage = (int) Math.ceil((double) total / ROW_PER_PAGE); // 총 페이지 수

			int startRow = (currentPage - 1) * ROW_PER_PAGE + 1; // 게시글의 시작 번호(변수 num의 제일 마지막)
			int endRow = startRow + ROW_PER_PAGE - 1; // 게시글의 마지막 번호(변수 num = 1)

			int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK; // 한 블럭 당 시작 페이지(1, 11, 21, ...)
			int endPage = startPage + PAGE_PER_BLOCK - 1; // 한 블럭 당 마지막 페이지

			if (endPage > totalPage)
			{
				endPage = totalPage; // 마지막 페이지가 총 페이지 수 보다 클 경우
			}

			List<Movie> moviePageList = md2.moviePageList(genreNo, startRow, endRow);

			request.setAttribute("member", member);
			request.setAttribute("moviePageList", moviePageList);
			request.setAttribute("pageNum", pageNum);
			request.setAttribute("currentPage", currentPage);
			request.setAttribute("totalPage", totalPage);
			request.setAttribute("total", total);
			request.setAttribute("startPage", startPage);
			request.setAttribute("endPage", endPage);
			request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		}
		
		return "myRecommend";
	}
}