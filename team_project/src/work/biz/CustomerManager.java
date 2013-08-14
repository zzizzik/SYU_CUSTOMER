/**
 * 
 */
package work.biz;

import java.io.Serializable;

import work.dao.CustomerDAO;
import work.dto.CustomerDTO;


/**
 * @author 김재현
 *
 */
public class CustomerManager implements Serializable {
	
	private CustomerDAO dao = CustomerDAO.getInstance();
	
	/** 아이디 중복검사 */
	public String idCheck(String userid){
		if( dao.exists(userid) == true){
			return "success";
		} else{
			return "false";
		}
	}
	
	/** 회원 요소 중복검사 */
	public String userCheck(String keyword, String content){
		System.out.println("###"+keyword+"|"+content);
		if( dao.userCheck(keyword, content) == true){
			return "success";
		} else{
			return "false";
		}
	}
	
	/** 로깅 검출 메서드 */
	public CustomerDTO loginCheck(String userId, String userPw){
		return dao.loginCheck(userId,userPw);	//boolean return
	}
	
	/** 회원가입 */
	public String insertCustomer(CustomerDTO dto) {
		if (dto != null ) {
			if ( dao.exists(dto.getUserId()) == false ) {
				dao.insertCustomer(dto);
				return "success";
			} else {
				System.out.println(dto.getUserId() + " 아이디 중복 오류입니다.");
				return "duplication";
			}
		} else {
			return "error";
		}
		
	}	

//끝
}
