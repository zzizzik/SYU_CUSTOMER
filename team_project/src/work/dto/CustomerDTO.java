/**
 * 
 */
package work.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * @author 김재현
 *
 */
public class CustomerDTO implements Serializable{

	/** 회원코드 */
	private String userId;
	/**비밀번호*/
	private String userPw;
	/**	이름*/
	private String userName;
	/**	등급*/
	private String userGrade = "N";
	/**	닉네임*/
	private String userNick;
	/**	연락처(전화번호)*/
	private String userPhone;
	/**	이메일*/
	private String userEmail;
	/**	유저추천수*/
	private int userGood;
	/**	회원사진*/
	private String userPhoto;
	/** 가입일 */
	private Date userRegDate = new Date();
	
	/**
	 * 기본 생성자
	 */
	public CustomerDTO() {
		super();
	}
		
	/**
	 * 전체
	 * @param userId
	 * @param userPw
	 * @param userName
	 * @param userGrade
	 * @param userNick
	 * @param userPhone
	 * @param userEmail
	 * @param userGood
	 * @param userPhoto
	 * @param userRegDate
	 */
	public CustomerDTO(String userId, String userPw, String userName,
			String userGrade, String userNick, String userPhone, String userEmail,
			int userGood, String userPhoto, Date userRegDate) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userGrade = userGrade;
		this.userNick = userNick;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
		this.userGood = userGood;
		this.userPhoto = userPhoto;
		this.userRegDate = userRegDate;
	}
	
	
		
	
	/**
	 * 가입용
	 * @param userId
	 * @param userPw
	 * @param userName
	 * @param userNick
	 * @param userPhone
	 * @param userEmail
	 */
	public CustomerDTO(String userId, String userPw, String userName,
			String userNick, String userPhone, String userEmail) {
		super();
		this.userId = userId;
		this.userPw = userPw;
		this.userName = userName;
		this.userNick = userNick;
		this.userPhone = userPhone;
		this.userEmail = userEmail;
	}

	/**
	 * 세션
	 * @param userId
	 * @param userGrade
	 * @param userNick
	 */
	public CustomerDTO(String userId, String userGrade, String userNick) {
		super();
		this.userId = userId;
		this.userGrade = userGrade;
		this.userNick = userNick;
	}
	
	/**
	 * 덧글
	 * @param userId
	 * @param userGrade
	 * @param userNick
	 * @param userPhoto
	 */
	public CustomerDTO(String userId, String userGrade, String userNick,
			String userPhoto) {
		super();
		this.userId = userId;
		this.userGrade = userGrade;
		this.userNick = userNick;
		this.userPhoto = userPhoto;
	}
	
	


	/**
	 * @return the userId
	 */
	public String getUserId() {
		return userId;
	}
	/**
	 * @param userId the userId to set
	 */
	public void setUserId(String userId) {
		this.userId = userId;
	}
	/**
	 * @return the userPw
	 */
	public String getUserPw() {
		return userPw;
	}
	/**
	 * @param userPw the userPw to set
	 */
	public void setUserPw(String userPw) {
		this.userPw = userPw;
	}
	/**
	 * @return the userName
	 */
	public String getUserName() {
		return userName;
	}
	/**
	 * @param userName the userName to set
	 */
	public void setUserName(String userName) {
		this.userName = userName;
	}
	/**
	 * @return the userGrade
	 */
	public String getUserGrade() {
		return userGrade;
	}
	/**
	 * @param userGrade the userGrade to set
	 */
	public void setUserGrade(String userGrade) {
		this.userGrade = userGrade;
	}
	/**
	 * @return the userNick
	 */
	public String getUserNick() {
		return userNick;
	}
	/**
	 * @param userNick the userNick to set
	 */
	public void setUserNick(String userNick) {
		this.userNick = userNick;
	}
	/**
	 * @return the userPhone
	 */
	public String getUserPhone() {
		return userPhone;
	}
	/**
	 * @param userPhone the userPhone to set
	 */
	public void setUserPhone(String userPhone) {
		this.userPhone = userPhone;
	}
	/**
	 * @return the userEmail
	 */
	public String getUserEmail() {
		return userEmail;
	}
	/**
	 * @param userEmail the userEmail to set
	 */
	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	/**
	 * @return the userGood
	 */
	public int getUserGood() {
		return userGood;
	}
	/**
	 * @param userGood the userGood to set
	 */
	public void setUserGood(int userGood) {
		this.userGood = userGood;
	}
	/**
	 * @return the userPhoto
	 */
	public String getUserPhoto() {
		return userPhoto;
	}
	/**
	 * @param userPhoto the userPhoto to set
	 */
	public void setUserPhoto(String userPhoto) {
		this.userPhoto = userPhoto;
	}
	/**
	 * @return the userRegDate
	 */
	public Date getUserRegDate() {
		return userRegDate;
	}
	/**
	 * @param userRegDate the userRegDate to set
	 */
	public void setUserRegDate(Date userRegDate) {
		this.userRegDate = userRegDate;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#hashCode()
	 * ID equal
	 */
	@Override
	public int hashCode() {
		final int prime = 31;
		int result = 1;
		result = prime * result + ((userId == null) ? 0 : userId.hashCode());
		return result;
	}

	
	/* (non-Javadoc)
	 * @see java.lang.Object#equals(java.lang.Object)
	 * ID equal
	 */
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		CustomerDTO other = (CustomerDTO) obj;
		if (userId == null) {
			if (other.userId != null)
				return false;
		} else if (!userId.equals(other.userId))
			return false;
		return true;
	}

	/* (non-Javadoc)
	 * @see java.lang.Object#toString()
	 * test 용
	 */
	@Override
	public String toString() {
		return "userId=" + userId + " | userPw=" + userPw + " | userName="
				+ userName + " | userGrade=" + userGrade + " | userNick="
				+ userNick + " | userPhone=" + userPhone + " | userEmail="
				+ userEmail + " | userGood=" + userGood + " | userPhoto="
				+ userPhoto + " | userRegDate=" + userRegDate;
	}
	
}
