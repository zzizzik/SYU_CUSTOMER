/**
 * 
 */
package work.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Date;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

import work.dto.CustomerDTO;



/**
 * @author ������
 * 
 */
public class CustomerDAO {
	// JDBC + JNDI
	private static CustomerDAO instance;
	private DataSource ds;

	/** �⺻������
	 * JNDI API�� ����ؼ� DataSource ��ü ���� �ʱ�ȭ
	 * java:comp/env => ���� coded name
	 * jdbc/Oracle => tomcat\conf\context.xml ����
	 *  */
	private CustomerDAO() {
		
		try {
//			InitialContext context = new InitialContext();
//			ds = (DataSource)context.lookup("java:comp/env/jdbc/Oracle");
			
			ds = (DataSource)new InitialContext().lookup("java:comp/env/jdbc/Oracle");
		} catch (NamingException e) {
			System.out.println("JNDI lookup �����߻�");
			e.printStackTrace();
			
		}
		
	}

	/** �̱��� ���� */	//�ϳ��� Ŭ������ �ϳ��� ��ü�� 
	public static CustomerDAO getInstance() {
		if (instance == null) {
			instance = new CustomerDAO();
		}
		return instance;
	}

//	private Connection da.getConnection() throws SQLException {
//		return da.getConnection();
//	}
	
	/** JDBC ������� */
	 private void disconnJDBC(Connection con, PreparedStatement pstmt, ResultSet rs) {
		 try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				System.out.println("�ڿ������� �����߻�");
			}		
	}
	
	/** ���̵� �������� */
	@SuppressWarnings("resource")
	public boolean exists(String userId) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();
			String sql ="SELECT USERID FROM CUSTOMER";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
				if(rs.getString("USERID").equals(userId)){
					return true;
				}
			}
		} catch (SQLException e) {
			System.out.println("���̵� �˻� ����");
			e.printStackTrace();
		} finally {
			disconnJDBC(con, pstmt, rs);
		}
		return false;
	}
	
	/** ���̵�/�г���/�̸��� �������� */
	public boolean userCheck(String keyword, String content) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println(keyword+"|dao|"+content);
		try {
			con = ds.getConnection();
			String sql ="SELECT USERID FROM CUSTOMER WHERE "+keyword+" = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, content);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				return true;
				
			}
		} catch (SQLException e) {
			System.out.println("���̵� �˻� ����");
			e.printStackTrace();
		} finally {
			disconnJDBC(con, pstmt, rs);
		}
		return false;
	}
		
	

	/** �α��� ��û ���� �޼��� 
	  *  1. ���̵�/��ȣ ������ ����
	  *  2. ������ ����(�ʼ��Էµ�����)
	  *  3. Model���� �α��ΰ��� �Ƿ�
	  *  4. true : �α��� ����, false : �α��� ����
	  *  5. ��������� �̵� : ����: success.jsp, ���� : fail.jsp
	  * loginCheck(userid, userpw) : boolean
	  * */
	public CustomerDTO loginCheck(String userId, String userPw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		CustomerDTO customer = null;
		try {
			con = ds.getConnection();

			String sql ="select userId, userGrade, userNick from customer where USERID = ? and USERPW = ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, userId);
			pstmt.setString(2, userPw);
			
			rs = pstmt.executeQuery();
			/**
			 * ����
			 * @param userId
			 * @param userGrade
			 * @param userNick
			 */
			//���̵� ���������� row�ѹ��� ã�ƶ�
			if (rs.next()) {
					System.out.println("�α��� Ȯ��");
					return new CustomerDTO(rs.getString("userId"),rs.getString("userGrade"),rs.getString("userNick"));
					
			}
			System.out.println("�α��� ����");
			


		} catch (SQLException e) {
			System.out.println("���̵� �˻� ����");
			e.printStackTrace();
		} finally {
			// 6. �ڿ�����
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				System.out.println("�ڿ������� �����߻�");
			}
		}

		return customer;
	}

	

	/** ���̵� ��� ���� */
	public int exists(String userid, String userpw) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;

		try {
			con = ds.getConnection();

			String sql ="select userid, userpw from customer";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();

			//���̵� ���������� row�ѹ��� ã�ƶ�
			while (rs.next()) {
				if(rs.getString("userid").equals(userid) && rs.getString("userpw").equals(userpw)){
					System.out.println("�α��� Ȯ��");
					return rs.getRow();
				}
			}
			System.out.println("�α��� ����");
			return -1;


		} catch (SQLException e) {
			System.out.println("���̵� �˻� ����");
			e.printStackTrace();
		} finally {
			// 6. �ڿ�����
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				System.out.println("�ڿ������� �����߻�");
			}
		}

		return -1;
	}

	/** ��� */
	public void insertCustomer(CustomerDTO dto) {
		
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		System.out.println(dto);
		try {
			con = ds.getConnection();
			String sql = "insert into CUSTOMER values(?,?,?,?,?,?,?,?,?,?)";
			pstmt = con.prepareStatement(sql);
			
			pstmt.setString(1, dto.getUserId());
			pstmt.setString(2, dto.getUserPw());
			pstmt.setString(3, dto.getUserName());
			pstmt.setString(4, dto.getUserGrade());
			pstmt.setString(5, dto.getUserNick());
			pstmt.setString(6, dto.getUserPhone());
			pstmt.setString(7, dto.getUserEmail());
			pstmt.setInt(8, dto.getUserGood());
			pstmt.setString(9, dto.getUserPhoto());
			java.sql.Date regDate = new java.sql.Date(dto.getUserRegDate().getTime());
			pstmt.setDate(10, regDate);

			pstmt.executeUpdate();
			

		} catch (SQLException e) {
			e.printStackTrace();
		} finally {
			try {
				if (rs != null) {
					rs.close();
				}
				if (pstmt != null) {
					pstmt.close();
				}
				if (con != null) {
					con.close();
				}
			} catch (SQLException e) {
				System.out.println("�ڿ������� �����߻�");
			}
		}
	}



//
//	/** ��ü �μ��� ������ ArrayList�� �����ؼ� ��ȯ�ϴ� �޼��� */
//	public ArrayList<Customer> searchAll() {
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		ArrayList<Customer> list = new ArrayList<Customer>();
//
//		try {
//			con = ds.getConnection();
//			String sql = "select * from customer";
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()){
//				// userid(1), userpw(2), username(3), phone(4), email(5), jdate(6), usergrade(7), mileage(8), manager(9), discount(10)
//				list.add(new Customer(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getString(7),rs.getInt(8), rs.getString(9), rs.getInt(10)));
//			}
//
//		} catch(SQLException e) {
//			System.out.println("�μ���ȣ �˻� ����");
//			e.printStackTrace();
//		} finally {
//			try {
//				if(rs != null) {
//					rs.close();
//				}
//				if(pstmt != null) {
//					pstmt.close();
//				}
//				if(con != null) {
//					con.close();
//				}
//			} catch(SQLException e) {
//				System.out.println("�ڿ������� �����߻�");
//			}			
//		}
//		return list;	
//	}
//
//	/** �ƱԸ�Ʈ�� ���޹��� Ư�� �μ��� ��� ������ ��ȯ�ϴ� �޼��� */
//	public Customer search(String userid) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		Customer c_dto = null;
////		GeneralCustomer g_dto = null;
////		SpecialCustomer s_dto = null;
//		
//
//		try {
//			con = ds.getConnection();
//			String sql = "select * from customer where userid=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, userid);
//			rs = pstmt.executeQuery();
//			
//			if (rs.next()) {
//				System.out.println(rs.getString(1));
//				c_dto = new Customer(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6), rs.getString(7),rs.getInt(8), rs.getString(9), rs.getInt(10));
//				
//				return c_dto;
////				if( rs.getString("usergrade").equals("���")) {
////					c_dto = new Customer(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6), rs.getString(7),rs.getInt(8), rs.getString(9), rs.getInt(10));
////		
////				}
////				if( rs.getString("usergrade").equals("�Ϲ�")) {
////					c_dto = new Customer(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getString(7),rs.getInt(8), rs.getString(9), rs.getInt(10));
////		
////				}
//			}
//			
//			
//		
//		} catch (SQLException e) {
//			System.out.println("�μ���ȣ �˻� ����");
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) {
//					rs.close();
//				}
//				if (pstmt != null) {
//					pstmt.close();
//				}
//				if (con != null) {
//					con.close();
//				}
//			} catch (SQLException e) {
//				System.out.println("�ڿ������� �����߻�");
//			}
//		}
//		
//		return null;
////		if(type == 1){
////			return c_dto;
////		} else if(type == 2){
////			return c_dto;
////		} else{
////			return null;
////		}
//		 
//	}
//
//	/** �Ѱ��� ���� */
//	public void update(String userid, String userpw, String new_thing, String type) {
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//			con = ds.getConnection();
//
//			System.out.println("type="+type);
//			System.out.println("new="+new_thing);
//			String sql = "update customer set "+type+"=? where userid=? and userpw=?";				
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, new_thing);
//			pstmt.setString(2, userid);
//			pstmt.setString(3, userpw);
//
//			pstmt.executeUpdate();
//
//			if(pstmt.execute()){
//				System.out.println("����Ϸ�");
//			}
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if(rs != null) {
//					rs.close();
//				}
//				if(pstmt != null) {
//					pstmt.close();
//				}
//				if(con != null) {
//					con.close();
//				}
//			} catch(SQLException e) {
//				System.out.println("�ڿ������� �����߻�");
//			}
//		}	
//	}
//	
//	/** ���̵� ã�� */
//	public String search(String username, String email, String phone) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//			con = ds.getConnection();
//
//			String sql ="select userid from customer where username=? and email=? and phone=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, username);
//			pstmt.setString(2, email);
//			pstmt.setString(3, phone);
//			rs = pstmt.executeQuery();
//
//			//���̵� ���������� row�ѹ��� ã�ƶ�
//			if (rs.next()) {
//				System.out.println("id");
//				return rs.getString("userid");
//			}
//				
//
//		} catch (SQLException e) {
//			System.out.println("���̵� �˻� ����");
//			e.printStackTrace();
//		} finally {
//			// 6. �ڿ�����
//			try {
//				if (rs != null) {
//					rs.close();
//				}
//				if (pstmt != null) {
//					pstmt.close();
//				}
//				if (con != null) {
//					con.close();
//				}
//			} catch (SQLException e) {
//				System.out.println("�ڿ������� �����߻�");
//			}
//		}
//
//		return null;
//	}
//	
//	/** ���̵� ã�� */
//	public String searchPassword(String userid, String email, String phone) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//			con = ds.getConnection();
//
//			String sql ="select userpw from customer where userid=? and email=? and phone=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, userid);
//			pstmt.setString(2, email);
//			pstmt.setString(3, phone);
//			rs = pstmt.executeQuery();
//
//			//���̵� ���������� row�ѹ��� ã�ƶ�
//			if (rs.next()) {
//				System.out.println("pw �˻��Ϸ�");
//				return rs.getString("userpw");
//			}
//				
//
//		} catch (SQLException e) {
//			System.out.println("���̵� �˻� ����");
//			e.printStackTrace();
//		} finally {
//			// 6. �ڿ�����
//			try {
//				if (rs != null) {
//					rs.close();
//				}
//				if (pstmt != null) {
//					pstmt.close();
//				}
//				if (con != null) {
//					con.close();
//				}
//			} catch (SQLException e) {
//				System.out.println("�ڿ������� �����߻�");
//			}
//		}
//
//		return null;
//	}
//
//	/** ��ü ���� */
//	public void update(Customer dto) {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
////		int mileage = 0;
////		String manager = null;
////		int discount = 0;
//
//		try{
////			if( dto instanceof GeneralCustomer) {
////				mileage = ((GeneralCustomer)dto).getMileage();
////			}
////			if( dto instanceof SpecialCustomer) {
////				manager = ((SpecialCustomer)dto).getManager();
////				discount = ((SpecialCustomer)dto).getDiscount();
////			}
//			
//		//	java.sql.Date sqlDate = new java.sql.Date(dto.getJdate().getTime());
//
//			con = ds.getConnection();
//			// userpw(1), username(2), phone(3), email(4), jdate(5), usergrade(6), mileage(7), manager(8), discount(9), where userid(10)
//			String sql = "UPDATE customer SET userpw=?, username=?, phone=?, email=?, usergrade=?, mileage=?, manager=?, discount=? where userid=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, dto.getUserpw());
//			pstmt.setString(2,  dto.getUsername());
//			pstmt.setString(3, dto.getPhone());
//			pstmt.setString(4, dto.getEmail());
//			//pstmt.setDate(5, sqlDate);
//			pstmt.setString(5, dto.getUsergrade());
//			pstmt.setInt(6, dto.getMileage());
//			pstmt.setString(7, dto.getManager());
//			pstmt.setInt(8, dto.getDiscount());
//			pstmt.setString(9,dto.getUserid());
//			pstmt.executeUpdate();
//
//		} catch(SQLException e) {
//			e.printStackTrace();
//
//		} finally{
//			try {
//				if(rs != null) {
//					rs.close();
//				}
//				if(pstmt != null) {
//					pstmt.close();
//				}
//				if(con != null) {
//					con.close();
//				}
//			} catch(SQLException e) {
//				System.out.println("�ڿ������� �����߻�");
//			}
//
//		}
//
//	}
//	/** ������ ȸ�� �� �� */
//	public void getCount() {
//		Connection con = null;
//		Statement stmt = null;
//		ResultSet rs = null;
//
//		try{
//
//			con = ds.getConnection();
//			stmt = con.createStatement();
//			String sql1 = "SELECT COUNT(*) FROM customer";
//			String sql2 = "SELECT COUNT(*) FROM customer where usergrade='���'";
//			String sql3 = "SELECT COUNT(*) FROM customer where usergrade='�Ϲ�'";
//
//			rs = stmt.executeQuery(sql1);
//
//			if(rs.next()){
//				System.out.println("�� ����ȸ���� : " + rs.getInt(1));
//			}
//			rs.close();
//
//			rs = stmt.executeQuery(sql2);
//			if(rs.next()){
//				System.out.println("��� ȸ�� �� : " + rs.getInt(1));
//			}
//			rs.close();
//
//			rs = stmt.executeQuery(sql3);
//			if(rs.next()){
//				System.out.println("�Ϲ� ȸ�� �� : " +rs.getInt(1));
//			}
//
//		} catch(SQLException e){
//
//		} finally{
//			try{
//				if(rs != null) {
//					rs.close();
//				}
//				if(stmt != null) {
//					stmt.close();
//				}
//				if(con != null) {
//					con.close();
//				}				
//			} catch(SQLException e){
//				System.out.println("�ڿ����� ����");
//			}
//		}
//	}
//
//	/** �ӽ� ��й�ȣ �߱� 
//	 * @throws InvalidException */
//	public void newUserpw(String userid, String phone, String email, String new_Userpw) throws InvalidException {
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try{
//			con = ds.getConnection();
//
//			String sql = "select * from customer where userid=? and phone=? and email=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, userid);
//			pstmt.setString(2, phone);
//			pstmt.setString(3, email);
//
//			rs = pstmt.executeQuery();
//
//			if(rs.next()){
//				if( rs.getRow()==0 ){
//					pstmt.close();
//					throw new InvalidException("sql", "������ ��ġ���� ����");
//				} else{
//					pstmt.close();
//					System.out.println("DB������");
//					sql = "UPDATE customer SET userpw=? where userid=?";
//					pstmt = con.prepareStatement(sql);
//					pstmt.setString(1, new_Userpw);
//					pstmt.setString(2, userid);
//					pstmt.executeUpdate();
//				}
//			}
//		} catch(SQLException e){
//			e.printStackTrace();
//		} finally{
//			try{
//				if(rs != null) {
//					rs.close();
//				}
//				if(pstmt != null) {
//					pstmt.close();
//				}
//				if(con != null) {
//					con.close();
//				}				
//			} catch(SQLException e){
//				System.out.println("�ڿ����� ����");
//			}
//		}
//
//	}
//
//	/** �� Ż�� */
//	public void c_delete(String userid){
//		Connection con = null;
//		ResultSet rs = null;
//		PreparedStatement pstmt = null;
//		
//		try{
//			con = ds.getConnection();
//
//			String sql = "DELETE FROM customer WHERE userid = ?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setString(1, userid);
//			pstmt.executeUpdate();
//			con.commit();
//			System.out.println("�����Ϸ� ����");
//		} catch(SQLException e) {
//			try {
//				con.rollback();
//			} catch (SQLException e1) {
//				e1.printStackTrace();
//			}
//			e.printStackTrace();
//		} finally{
//			try {
//				if(con != null){
//					con.close();
//				}
//				if(pstmt != null){
//					pstmt.close();					
//				}
//				if(rs != null){
//					rs.close();
//				}
//			} catch(SQLException e){
//				e.printStackTrace();
//			}
//		}
//
//	}
//
//	/** ���� �˻� �� */
//	public ArrayList<Customer> search_tool(String type, String context) {
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		ArrayList<Customer> list = new ArrayList<Customer>();
//		
//		try {
//			con = ds.getConnection();
//
//			System.out.println("type="+type);
//			System.out.println("context"+context);
//			//String sql = "select * from customer where "+type+" LIKE('%"+context+"%')";			
//			String sql = "select * from customer where "+type+" LIKE('%"+context+"%')";
//
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//
//			while(rs.next()){
//				System.out.println("�˻���");
//				list.add(new Customer(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getString(7),rs.getInt(8), rs.getString(9), rs.getInt(10)));
//				System.out.println("�˻��Ϸ�");
//	
//			}
//		
//			return list;
//			
//		} catch(SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if(rs != null) {
//					rs.close();
//				}
//				if(pstmt != null) {
//					pstmt.close();
//				}
//				if(con != null) {
//					con.close();
//				}
//			} catch(SQLException e) {
//				System.out.println("�ڿ������� �����߻�");
//			}
//		}
//		return list;	
//		
//	}
////-------------------------CustomerBoard----------------------------------------//
//	/** ��ü �Խ��� ���� ArrayList�� �����ؼ� ��ȯ�ϴ� �޼��� */
//	public ArrayList<CustomerBoard> boardViewContext() {
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		ArrayList<CustomerBoard> list = new ArrayList<CustomerBoard>();
//
//		try {
//			con = ds.getConnection();
//			String sql = "select * from CUSTOMER_BOARD";
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()){
//				// seq(1), userid(2), boardpw(3), username(4), usergrade(5), title(6), context(7), regdate(8), hit(9)
//				list.add(new CustomerBoard(rs.getInt(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getString(6),rs.getString(7),rs.getDate(8), rs.getInt(9)));
//			}
//
//		} catch(SQLException e) {
//			System.out.println("�μ���ȣ �˻� ����");
//			e.printStackTrace();
//		} finally {
//			try {
//				if(rs != null) {
//					rs.close();
//				}
//				if(pstmt != null) {
//					pstmt.close();
//				}
//				if(con != null) {
//					con.close();
//				}
//			} catch(SQLException e) {
//				System.out.println("�ڿ������� �����߻�");
//			}			
//		}
//		return list;	
//	}
//	
//	/** �Խ��� ��ȸ */
//	public ArrayList<CustomerBoard> boardViewAll() {
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		ArrayList<CustomerBoard> list = new ArrayList<CustomerBoard>();
//
//		try {
//			System.out.println("dao����");
//			con = ds.getConnection();
//			String sql = "select * from CUSTOMER_BOARD order by seq desc";
//			pstmt = con.prepareStatement(sql);
//			rs = pstmt.executeQuery();
//
//			while (rs.next()){
//				// seq(1), userid(2), boardpw(3), username(4), usergrade(5), title(6), context(7), regdate(8), hit(9)
//				list.add(new CustomerBoard(rs.getInt(1),rs.getString(2),rs.getString(4),rs.getString(5),rs.getString(6),rs.getDate(8), rs.getInt(9)));
//			}
//
//		} catch(SQLException e) {
//			System.out.println("�Խ��� �˻� ����");
//			e.printStackTrace();
//		} finally {
//			try {
//				if(rs != null) {
//					rs.close();
//				}
//				if(pstmt != null) {
//					pstmt.close();
//				}
//				if(con != null) {
//					con.close();
//				}
//			} catch(SQLException e) {
//				System.out.println("�ڿ������� �����߻�");
//			}			
//		}
//		return list;	
//	}
//
//	/** ������ �Խñ� ���� */
//	public CustomerBoard boardView(int seq) {
//		
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//		CustomerBoard cboard = null;
//
//		try {
//			System.out.println("dao����2");
//			con = ds.getConnection();
//			String sql = "select * from CUSTOMER_BOARD where seq=?";
//			pstmt = con.prepareStatement(sql);
//			pstmt.setInt(1, seq);
//			rs = pstmt.executeQuery();
//
//			if (rs.next()){
//				// seq(1), userid(2), boardpw(3), username(4), usergrade(5), title(6), context(7), regdate(8), hit(9)
//				cboard = new CustomerBoard(rs.getInt(1),rs.getString(2), rs.getString(3), rs.getString(4),rs.getString(5),rs.getString(6), rs.getString(7), rs.getDate(8), rs.getInt(9));
//				return cboard;
//			}
//
//		} catch(SQLException e) {
//			System.out.println("������ �˻�����");
//			e.printStackTrace();
//		} finally {
//			try {
//				if(rs != null) {
//					rs.close();
//				}
//				if(pstmt != null) {
//					pstmt.close();
//				}
//				if(con != null) {
//					con.close();
//				}
//			} catch(SQLException e) {
//				System.out.println("�ڿ������� �����߻�");
//			}			
//		}
//		return cboard;	
//	}
//
//	/** ��� */
//	public void boardInput(CustomerBoard dto) {
//
//		
//		java.sql.Date sqlDate = new java.sql.Date(dto.getRegdate().getTime());
//
//		Connection con = null;
//		PreparedStatement pstmt = null;
//		ResultSet rs = null;
//
//		try {
//			con = ds.getConnection();
//			String sql = "insert into customer_board(userid, boardpw, username, usergrade, title, context, regdate, hit) values(?,?,?,?,?,?,?,?)";
//			pstmt = con.prepareStatement(sql);
//
//			pstmt.setString(1, dto.getUserid());
//			pstmt.setString(2, dto.getBoardpw());
//			pstmt.setString(3, dto.getUsername());
//			pstmt.setString(4, dto.getUsergrade());
//			pstmt.setString(5, dto.getTitle());
//			pstmt.setString(6, dto.getContext());
//			pstmt.setDate(7, sqlDate);
//			pstmt.setInt(8, dto.getHit());
//			
//			pstmt.executeUpdate();
//
//		} catch (SQLException e) {
//			e.printStackTrace();
//		} finally {
//			try {
//				if (rs != null) {
//					rs.close();
//				}
//				if (pstmt != null) {
//					pstmt.close();
//				}
//				if (con != null) {
//					con.close();
//				}
//			} catch (SQLException e) {
//				System.out.println("�ڿ������� �����߻�");
//			}
//		}
//	}
//	
////<---------------------------------------------->
//	
////	public ArrayList<Customer> searchWithdraw(){
////		Connection con = null;
////		PreparedStatement pstmt = null;
////		ResultSet rs = null;
////		ArrayList<Customer> list = new ArrayList<Customer>();
////		
////		try{
////			con = ds.getConnection();
////			String sql = "SELECT * FROM c_delete";
////			pstmt = con.prepareStatement(sql);
////			rs = pstmt.executeQuery();
////			System.out.print("ó����...");
////			while (rs.next()){
////				System.out.print("...");
////				if( rs.getString("usergrade").equals("���")){
////					list.add(new SpecialCustomer(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getString(7),rs.getString(9), rs.getInt(10)));									
////				} else if (rs.getString("usergrade").equals("�Ϲ�")){
////					list.add(new GeneralCustomer(rs.getString(1),rs.getString(2),rs.getString(3),rs.getString(4),rs.getString(5),rs.getDate(6),rs.getString(7),rs.getInt(8)));
////				} else{
////					System.out.println("������");
////				}
////			}
////			return list;
////			
////		} catch (SQLException e) {
////			e.printStackTrace();
////			
////		} finally {
////			try {
////				if(con != null){
////					con.close();
////				}
////				if(pstmt != null){
////					pstmt.close();
////				}
////				if(rs != null){
////					rs.close();
////				}				
////			} catch(SQLException e){
////				e.printStackTrace();
////			}
////		}
////		return list;
////	}
//
//
//
//
//	//�� ///////////
}

