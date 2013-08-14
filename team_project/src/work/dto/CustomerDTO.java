/**
 * 
 */
package work.dto;

import java.io.Serializable;
import java.util.Date;

/**
 * @author ������
 *
 */
public class CustomerDTO implements Serializable{

	/** ȸ���ڵ� */
	private String userId;
	/**��й�ȣ*/
	private String userPw;
	/**	�̸�*/
	private String userName;
	/**	���*/
	private String userGrade = "N";
	/**	�г���*/
	private String userNick;
	/**	����ó(��ȭ��ȣ)*/
	private String userPhone;
	/**	�̸���*/
	private String userEmail;
	/**	������õ��*/
	private int userGood;
	/**	ȸ������*/
	private String userPhoto;
	/** ������ */
	private Date userRegDate = new Date();
	
	/**
	 * �⺻ ������
	 */
	public CustomerDTO() {
		super();
	}
		
	/**
	 * ��ü
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
	 * ���Կ�
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
	 * ����
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
	 * ����
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
	 * test ��
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
