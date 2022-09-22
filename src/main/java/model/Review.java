package model;

import java.sql.Date;

public class Review 
{
	private int reviewNo;
	private String reviewSubject;
	private String reviewContent;
	private Date reviewDate;
	private String reviewDel;
	private int memberNo;
	private int movieNo;
	private String movieName;
	
	public String getMovieName() 
	{
		return movieName;
	}
	public void setMovieName(String movieName) 
	{
		this.movieName = movieName;
	}
	public int getReviewNo() 
	{
		return reviewNo;
	}
	public void setReviewNo(int reviewNo) 
	{
		this.reviewNo = reviewNo;
	}
	public String getReviewSubject() 
	{
		return reviewSubject;
	}
	public void setReviewSubject(String reviewSubject) 
	{
		this.reviewSubject = reviewSubject;
	}
	public String getReviewContent() 
	{
		return reviewContent;
	}
	public void setReviewContent(String reviewContent) 
	{
		this.reviewContent = reviewContent;
	}
	public Date getReviewDate() 
	{
		return reviewDate;
	}
	public void setReviewDate(Date reviewDate) 
	{
		this.reviewDate = reviewDate;
	}
	public String getReviewDel() 
	{
		return reviewDel;
	}
	public void setReviewDel(String reviewDel) 
	{
		this.reviewDel = reviewDel;
	}
	public int getMemberNo() 
	{
		return memberNo;
	}
	public void setMemberNo(int memberNo) 
	{
		this.memberNo = memberNo;
	}
	public int getMovieNo() 
	{
		return movieNo;
	}
	public void setMovieNo(int movieNo) 
	{
		this.movieNo = movieNo;
	}
}