package model;

import java.sql.Date;

public class Member 
{
	private int memberNo;
	private String memberId;
	private String memberPass;
	private String memberName;
	private String memberNickname;
	private String memberEmail;
	private String memberProfile;
	private String memberGender;
	private String memberDel;
	private Date reg_date;
	
	public int getMemberNo() 
	{
		return memberNo;
	}
	public void setMemberNo(int memberNo) 
	{
		this.memberNo = memberNo;
	}
	public String getMemberId() 
	{
		return memberId;
	}
	public void setMemberId(String memberId) 
	{
		this.memberId = memberId;
	}
	public String getMemberPass() 
	{
		return memberPass;
	}
	public void setMemberPass(String memberPass) 
	{
		this.memberPass = memberPass;
	}
	public String getMemberName() 
	{
		return memberName;
	}
	public void setMemberName(String memberName) 
	{
		this.memberName = memberName;
	}
	public String getMemberNickname() 
	{
		return memberNickname;
	}
	public void setMemberNickname(String memberNickname) 
	{
		this.memberNickname = memberNickname;
	}
	public String getMemberEmail() 
	{
		return memberEmail;
	}
	public void setMemberEmail(String memberEmail) 
	{
		this.memberEmail = memberEmail;
	}
	public String getMemberProfile() 
	{
		return memberProfile;
	}
	public void setMemberProfile(String memberProfile) 
	{
		this.memberProfile = memberProfile;
	}
	public String getMemberGender() 
	{
		return memberGender;
	}
	public void setMemberGender(String memberGender) 
	{
		this.memberGender = memberGender;
	}
	public String getMemberDel() 
	{
		return memberDel;
	}
	public void setMemberDel(String memberDel) 
	{
		this.memberDel = memberDel;
	}
	public Date getReg_date() 
	{
		return reg_date;
	}
	public void setReg_date(Date reg_date) 
	{
		this.reg_date = reg_date;
	}
}
