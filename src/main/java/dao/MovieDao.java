package dao;

import java.io.Reader;
import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.io.Resources;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;

import model.Movie;

public class MovieDao 
{
	private static MovieDao instance = new MovieDao();
	
	private MovieDao() { }
	
	public static MovieDao getInstance()
	{
		return instance;
	}
	
	private static SqlSession session;
	
	static
	{
		try
		{
			Reader reader = Resources.getResourceAsReader("configuration.xml");
			SqlSessionFactory ssf = new SqlSessionFactoryBuilder().build(reader);
			//	openSession(true) : 입력/삭제/수정 후에 commit : 뭔지모름 ㅋㅋ
			session = ssf.openSession(true);
			// reader.close(); : 얘도 왜들어가있는지 모름
		} 
		catch (Exception e) 
		{
			System.out.println(e.getMessage());
		}
	}

	public String selectMovieName(int movieNo) 
	{
		return (String) session.selectOne("moviens.selectMovieName", movieNo);
	}

	public String checkGenre(int movieNo) 
	{
		return (String) session.selectOne("moviens.checkGenre", movieNo);
	}

	public List<Movie> RecommendList(String genre) 
	{
		return (List<Movie>) session.selectList("moviens.RecommendList", genre);
	}

	public List<Movie> recommendPageList(int memberNo, int genreNo, int startRow, int endRow) 
	{
		HashMap<String, Integer> recommendMap = new HashMap<>();
		recommendMap.put("memberNo", memberNo);
		recommendMap.put("genreNo", genreNo);
		recommendMap.put("startRow", startRow);
		recommendMap.put("endRow", endRow);
		
		return (List<Movie>) session.selectList("moviens.recommendPageList", recommendMap);
	}

	public List<Movie> recommendPageListTotal(int memberNo, int genreNo) 
	{
		HashMap<String, Integer> recommendTotalMap = new HashMap<>();
		recommendTotalMap.put("memberNo", memberNo);
		recommendTotalMap.put("genreNo", genreNo);
		
		return (List<Movie>) session.selectList("moviens.recommendPageListTotal", recommendTotalMap);
	}

	public List<Movie> TotalMovieList() 
	{
		return (List<Movie>) session.selectList("moviens.TotalMovieList");
	}

	public List<Movie> TotalMoviePageList(int startRow, int endRow) 
	{
		HashMap<String, Integer> TMPLmap = new HashMap<>();
		TMPLmap.put("startRow", startRow);
		TMPLmap.put("endRow", endRow);
		
		return (List<Movie>) session.selectList("moviens.TotalMoviePageList", TMPLmap);
	}
	
	public List<Movie> GenreMovieList(int index) 
	{
		return (List<Movie>) session.selectList("moviens.GenreMovieList", index);
	}

	public List<Movie> GenreTotalMoviePageList(int movieGenreNo, int startRow, int endRow) 
	{
		HashMap<String, Integer> GTMPLmap = new HashMap<>();
		GTMPLmap.put("movieGenreNo", movieGenreNo);
		GTMPLmap.put("startRow", startRow);
		GTMPLmap.put("endRow", endRow);
		
		return (List<Movie>) session.selectList("moviens.GenreTotalMoviePageList", GTMPLmap);
	}
}