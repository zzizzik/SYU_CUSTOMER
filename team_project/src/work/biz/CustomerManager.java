/**
 * 
 */
package work.biz;

import java.io.Serializable;

import work.dao.CustomerDAO;
import work.dto.CustomerDTO;


/**
 * @author ������
 *
 */
public class CustomerManager implements Serializable {
	
	private CustomerDAO dao = CustomerDAO.getInstance();
	
	/** ���̵� �ߺ��˻� */
	public String idCheck(String userid){
		if( dao.exists(userid) == true){
			return "success";
		} else{
			return "false";
		}
	}
	
	/** ȸ�� ��� �ߺ��˻� */
	public String userCheck(String keyword, String content){
		System.out.println("###"+keyword+"|"+content);
		if( dao.userCheck(keyword, content) == true){
			return "success";
		} else{
			return "false";
		}
	}
	
	/** �α� ���� �޼��� */
	public CustomerDTO loginCheck(String userId, String userPw){
		return dao.loginCheck(userId,userPw);	//boolean return
	}
	
	/** ȸ������ */
	public String insertCustomer(CustomerDTO dto) {
		if (dto != null ) {
			if ( dao.exists(dto.getUserId()) == false ) {
				dao.insertCustomer(dto);
				return "success";
			} else {
				System.out.println(dto.getUserId() + " ���̵� �ߺ� �����Դϴ�.");
				return "duplication";
			}
		} else {
			return "error";
		}
		
	}	

//��
}
