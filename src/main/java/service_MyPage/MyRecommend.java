package service_MyPage;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import service.CommandProcess;

public class MyRecommend implements CommandProcess 
{
	@Override
	public String requestPro(HttpServletRequest request, HttpServletResponse response) 
	{
		
		return "myRecommend";
	}
}
