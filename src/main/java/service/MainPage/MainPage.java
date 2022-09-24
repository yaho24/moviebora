package service.MainPage;

import java.sql.Date;
import java.time.LocalDate;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.MovieDao;
import dao.StarsDao;
import model.Movie;
import service.CommandProcess;

public class MainPage implements CommandProcess 
{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
	{	
		// 영화 리스트 조회
		MovieDao movieD = MovieDao.getInstance();
		StarsDao starsD = StarsDao.getInstance();
		List<Movie> TotalMovieList = movieD.TotalMovieList();
		List<Movie>[] GenreMovieList = new ArrayList[5];
		
		for(int i=0 ; i<GenreMovieList.length ; i++)
		{
			GenreMovieList[i] = movieD.GenreMovieList(i);
		}

		// paging : start
		final int ROW_PER_PAGE = 6; // 한 페이지에 10개씩
		final int PAGE_PER_BLOCK = 4; // 한 블럭에 5페이지

		String pageNum = request.getParameter("pageNum");
		String pageNum1 = request.getParameter("pageNum1");
		String pageNum2 = request.getParameter("pageNum2");
		String pageNum3 = request.getParameter("pageNum3");
		String pageNum4 = request.getParameter("pageNum4");
		String pageNum5 = request.getParameter("pageNum5");
		
		if (pageNum == null || pageNum.equals("")) 
		{
			pageNum = "1";
		}
		
		if (pageNum1 == null || pageNum1.equals("")) 
		{
			pageNum1 = "1";
		}
		
		if (pageNum2 == null || pageNum2.equals("")) 
		{
			pageNum2 = "1";
		}
		
		if (pageNum3 == null || pageNum3.equals("")) 
		{
			pageNum3 = "1";
		}
		
		if (pageNum4 == null || pageNum4.equals("")) 
		{
			pageNum4 = "1";
		}
		
		if (pageNum5 == null || pageNum5.equals("")) 
		{
			pageNum5 = "1";
		}
		// 현재 페이지
		
		int currentPage = Integer.parseInt(pageNum);
		int currentPage1 = Integer.parseInt(pageNum1);
		int currentPage2 = Integer.parseInt(pageNum2);
		int currentPage3 = Integer.parseInt(pageNum3);
		int currentPage4 = Integer.parseInt(pageNum4);
		int currentPage5 = Integer.parseInt(pageNum5);
		
		int movieTotal = TotalMovieList.size();
		int[] movieTotalArray = new int[5];
		for(int i=0 ; i<movieTotalArray.length ; i++)
		{
			movieTotalArray[i] = GenreMovieList[i].size();
		}
		// 총 갯수

		int startRow = (currentPage - 1) * ROW_PER_PAGE + 1;
		int startRow1 = (currentPage1 - 1) * ROW_PER_PAGE + 1;
		int startRow2 = (currentPage2 - 1) * ROW_PER_PAGE + 1;
		int startRow3 = (currentPage3 - 1) * ROW_PER_PAGE + 1;
		int startRow4 = (currentPage4 - 1) * ROW_PER_PAGE + 1;
		int startRow5 = (currentPage5 - 1) * ROW_PER_PAGE + 1;
		// 시작번호 : (페이지번호 - 1) * 페이지당 갯수 + 1
		
		int endRow = startRow + ROW_PER_PAGE - 1;
		int endRow1 = startRow + ROW_PER_PAGE - 1;
		int endRow2 = startRow + ROW_PER_PAGE - 1;
		int endRow3 = startRow + ROW_PER_PAGE - 1;
		int endRow4 = startRow + ROW_PER_PAGE - 1;
		int endRow5 = startRow + ROW_PER_PAGE - 1;
		// 끝번호 : 시작번호 + 페이지당개수 - 1
		
		List<Movie> TotalMoviePageList = movieD.TotalMoviePageList(startRow, endRow);
		List<Movie> GenreTotalMoviePageList1 = movieD.GenreTotalMoviePageList(0, startRow1, endRow1);
		List<Movie> GenreTotalMoviePageList2 = movieD.GenreTotalMoviePageList(1, startRow2, endRow2);
		List<Movie> GenreTotalMoviePageList3 = movieD.GenreTotalMoviePageList(2, startRow3, endRow3);
		List<Movie> GenreTotalMoviePageList4 = movieD.GenreTotalMoviePageList(3, startRow4, endRow4);
		List<Movie> GenreTotalMoviePageList5 = movieD.GenreTotalMoviePageList(4, startRow5, endRow5);
		
		int totalPage = (int)Math.ceil((double)movieTotal/ROW_PER_PAGE);
		int totalPage1 = (int)Math.ceil((double)movieTotalArray[0]/ROW_PER_PAGE);
		int totalPage2 = (int)Math.ceil((double)movieTotalArray[1]/ROW_PER_PAGE);
		int totalPage3 = (int)Math.ceil((double)movieTotalArray[2]/ROW_PER_PAGE);
		int totalPage4 = (int)Math.ceil((double)movieTotalArray[3]/ROW_PER_PAGE);
		int totalPage5 = (int)Math.ceil((double)movieTotalArray[4]/ROW_PER_PAGE);
		// 총 페이지 수 , Math.ceil : 현재 실수보다 큰 정수
					
		int startPage = currentPage - (currentPage - 1) % PAGE_PER_BLOCK;
		int startPage1 = currentPage1 - (currentPage1 - 1) % PAGE_PER_BLOCK;
		int startPage2 = currentPage2 - (currentPage2 - 1) % PAGE_PER_BLOCK;
		int startPage3 = currentPage3 - (currentPage3 - 1) % PAGE_PER_BLOCK;
		int startPage4 = currentPage4 - (currentPage4 - 1) % PAGE_PER_BLOCK;
		int startPage5 = currentPage5 - (currentPage5 - 1) % PAGE_PER_BLOCK;
		// 시작페이지 : 현재페이지 - (현재페이지 - 1) % 10
		
		int endPage = startPage + PAGE_PER_BLOCK - 1;
		int endPage1 = startPage1 + PAGE_PER_BLOCK - 1;
		int endPage2 = startPage2 + PAGE_PER_BLOCK - 1;
		int endPage3 = startPage3 + PAGE_PER_BLOCK - 1;
		int endPage4 = startPage4 + PAGE_PER_BLOCK - 1;
		int endPage5 = startPage5 + PAGE_PER_BLOCK - 1;
		// 끝페이지 : 시작페이지 + 블록당페이지 수 -1
		
		
		if (endPage > totalPage) 
		{
			endPage = totalPage;
		}
		if (endPage1 > totalPage1) 
		{
			endPage1 = totalPage1;
		}
		if (endPage2 > totalPage2) 
		{
			endPage2 = totalPage2;
		}
		if (endPage3 > totalPage3) 
		{
			endPage3 = totalPage3;
		}
		if (endPage4 > totalPage4) 
		{
			endPage4 = totalPage4;
		}
		if (endPage5 > totalPage5) 
		{
			endPage5 = totalPage5;
		}
		// 총 페이지보다 큰 endPage는 나올 수 없다.
		// paging : end

		request.setAttribute("TotalMoviePageList", TotalMoviePageList);
		request.setAttribute("GenreTotalMoviePageList1", GenreTotalMoviePageList1);
		request.setAttribute("GenreTotalMoviePageList2", GenreTotalMoviePageList2);
		request.setAttribute("GenreTotalMoviePageList3", GenreTotalMoviePageList3);
		request.setAttribute("GenreTotalMoviePageList4", GenreTotalMoviePageList4);
		request.setAttribute("GenreTotalMoviePageList5", GenreTotalMoviePageList5);
		// movie list
		
		request.setAttribute("pageNum", pageNum);
		request.setAttribute("pageNum1", pageNum1);
		request.setAttribute("pageNum2", pageNum2);
		request.setAttribute("pageNum3", pageNum3);
		request.setAttribute("pageNum4", pageNum4);
		request.setAttribute("pageNum5", pageNum5);
		request.setAttribute("currentPage", currentPage);
		request.setAttribute("currentPage1", currentPage1);
		request.setAttribute("currentPage2", currentPage2);
		request.setAttribute("currentPage3", currentPage3);
		request.setAttribute("currentPage4", currentPage4);
		request.setAttribute("currentPage5", currentPage5);
		request.setAttribute("PAGE_PER_BLOCK", PAGE_PER_BLOCK);
		request.setAttribute("startPage", startPage);
		request.setAttribute("startPage1", startPage1);
		request.setAttribute("startPage2", startPage2);
		request.setAttribute("startPage3", startPage3);
		request.setAttribute("startPage4", startPage4);
		request.setAttribute("startPage5", startPage5);
		request.setAttribute("endPage", endPage);
		request.setAttribute("endPage1", endPage1);
		request.setAttribute("endPage2", endPage2);
		request.setAttribute("endPage3", endPage3);
		request.setAttribute("endPage4", endPage4);
		request.setAttribute("endPage5", endPage5);
		request.setAttribute("totalPage", totalPage);
		request.setAttribute("totalPage1", totalPage1);
		request.setAttribute("totalPage2", totalPage2);
		request.setAttribute("totalPage3", totalPage3);
		request.setAttribute("totalPage4", totalPage4);
		request.setAttribute("totalPage5", totalPage5);
		// paging param

		return "mainPage";
	}
}