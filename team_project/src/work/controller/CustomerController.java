package work.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Date;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import work.biz.CustomerManager;
import work.dto.CustomerDTO;

/**
 * Servlet implementation class CustomerController
 */
public class CustomerController extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public CustomerController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		process(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	public void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NullPointerException {
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");

		process(request, response);
	}
	
	public void process(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getParameter("action");
		System.out.println(action);
		if(action.endsWith("isUserId")){
			isUserId(request,response);
		}else if(action.endsWith("userCheck")){
			userCheck(request, response);
		}else if(action.endsWith("login")){
			login(request, response);
		} else if(action.endsWith("logout")){
			logout(request, response);
		}else if(action.endsWith("joinSaveAction")){
			joinSaveAction(request, response);
		}
		
	
	}
	
	/** 아이디 중복검사 */
	public void isUserId(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("아이디 중복검사");
		CustomerManager mngr = new CustomerManager();
		String userId = request.getParameter("userId");
		System.out.println("서블릿테스트 = "+userId);
		PrintWriter out = response.getWriter();
		if ("success" == mngr.idCheck(userId) ){
			System.out.println("오 중복됐어");
			out.print("no");
		}			
	}
	
	/** 회원가입 중복검사 */
	public void userCheck(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		//System.out.println("회원가입 중복검사");
		CustomerManager mngr = new CustomerManager();
		
		String keyword = request.getParameter("keyword");
		String userId = request.getParameter("userId");
		String userNick = request.getParameter("userNick");
		String userEmail = request.getParameter("userEmail");
		
		//System.out.println(keyword+"서블릿테스트 = "+userId+userNick+userEmail);
		
		PrintWriter out = response.getWriter();
		//스위치문 할차례
		if(keyword.equals("userId")){
			if("success" == mngr.userCheck(keyword, userId) ){
				//System.out.println("duplication");
				out.print(keyword+"no");
			}else if("false" == mngr.userCheck(keyword, keyword) ){
				//System.out.println("ryucandoit");
				out.print(keyword+"yes");
			}
		}
		if(keyword.equals("userNick")){
			if("success" == mngr.userCheck(keyword, userNick) ){
				//System.out.println("duplication");
				out.print(keyword+"no");
			}else if("false" == mngr.userCheck(keyword, keyword) ){
				//System.out.println("ryucandoit");
				out.print(keyword+"yes");
			}
		}
		if(keyword.equals("userEmail")){
			if("success" == mngr.userCheck(keyword, userEmail) ){
				//System.out.println("duplication");
				out.print(keyword+"no");
			}else if("false" == mngr.userCheck(keyword, keyword) ){
				//System.out.println("ryucandoit");
				out.print(keyword+"yes");
			}
		}

		
	}
	
	/** 로그인 */
	public void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("로그인요청");
		CustomerManager mngr = new CustomerManager();
		String userId = request.getParameter("userId");
		String userPw = request.getParameter("userPw");
		System.out.println(userId+userPw);
		//Customer c = null;
		if(userId != null && userPw !=null && !(userId.trim().equals("")) && userId.trim().length()>0 ){
			CustomerDTO c = mngr.loginCheck(userId, userPw);
			 System.out.println(c);
			 
			if(c != null){
			    HttpSession session = request.getSession();
			    
			    session.setAttribute("userId", userId);
			    session.setAttribute("userGrade", c.getUserGrade());
			    session.setAttribute("userNick", c.getUserNick());
			    session.setAttribute("login_time", new Date());
			    
			    session.setMaxInactiveInterval(60*60*2);	//2시간
			    
			    // HttpSession
//			    request.setAttribute("msg", userId + " 님 회원전용 서비스입니다.");
//			    request.setAttribute("vaild", userId);
//			    RequestDispatcher nextView = request.getRequestDispatcher("index.jsp");
//			     nextView.forward(request,  response);
			    response.sendRedirect("index.jsp");
			} else{
				//실패 페이지
			
				System.out.println("로그인실패");
				request.setAttribute("msg", userId + "님 암호나 아이디 다시 확인해바여");
				request.getRequestDispatcher("result/customer/false.jsp").forward(request, response);

			}
		} else{
			//오류 페이지
			System.out.println("로그인/암호 오류");
			request.setAttribute("msg", userId + "님 암호나 아이디 다시 확인해바여");
			response.sendRedirect("result/customer/error.jsp");
		}
	}
	
	/** 로그인아웃 */
	public void logout(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		System.out.println("로그아웃요청");
		HttpSession session = request.getSession(false);
		
		if( session != null){			
			session.removeAttribute("userId");
			session.removeAttribute("userNick");
			session.removeAttribute("userGrade");
			session.removeAttribute("login_time");
			session.invalidate();
		}		
		response.sendRedirect("index.jsp");
		
		
	}
	
	/** 가입신청 db저장 */
	public void joinSaveAction(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		CustomerManager mngr = new CustomerManager();
		System.out.println("joinSaveAction 메소드");
			
		/*
		 * 가입용
		 * @param userId
		 * @param userPw
		 * @param userName
		 * @param userNick
		 * @param userPhone
		 * @param userEmail
		 */
		String email = request.getParameter("userEmail") + "@" + request.getParameter("userEmail_s");
		mngr.insertCustomer(new CustomerDTO(
				request.getParameter("userId"),
				request.getParameter("userPw"),
				request.getParameter("userName"),
				request.getParameter("userNick"),
				request.getParameter("userPhone"), 
				email
				));
		
		PrintWriter out = response.getWriter();
	
		out.write("insertCustomer");
		RequestDispatcher nextView = request.getRequestDispatcher("index.jsp");
		nextView.forward(request, response);
	}
	
//끝
}
