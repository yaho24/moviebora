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
		System.out.println("여긴 왔나요?");
		HashMap<String, Integer> recommendMap = new HashMap<>();
		recommendMap.put("memberNo", memberNo);
		recommendMap.put("genreNo", genreNo);
		recommendMap.put("startRow", startRow);
		recommendMap.put("endRow", endRow);
	    System.out.println("다 넣었나요?");
	    System.out.println("memberNo, genreNo, startRow, endRow 뭔가요? : "+memberNo+" "+genreNo+" "+startRow+" "+endRow);
		
		return (List<Movie>) session.selectList("moviens.recommendPageList", recommendMap);
	}
}