package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MemberInsertController
 */
@WebServlet("/insert.mi")
public class MemberInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String enrollId = request.getParameter("enrollId");
		String enrollPwd = request.getParameter("enrollPwd");
		String enrollNickname = request.getParameter("enrollNickname");
		String enrollBirthdate = request.getParameter("enrollBirthdate");
		String enrollPhone = request.getParameter("enrollPhone");
		String enrollEmail = request.getParameter("enrollEmail");
		String gender = request.getParameter("gender");
		String abo = request.getParameter("bloodType");
		String mbti = request.getParameter("MBTI");
		String kakaoNo = request.getParameter("kakaoNo");
		
		Member m = new Member(enrollId, enrollPwd, enrollNickname, enrollBirthdate, enrollPhone, enrollEmail, gender, abo, mbti, kakaoNo);
		
		int result = new MemberService().insertMember(m);
		
		HttpSession session = request.getSession();
		if (result > 0) {
			session.setAttribute("alertMsg", "회원가입 성공");
			response.sendRedirect(request.getContextPath());
		} else {
			session.setAttribute("errorMsg", "회원가입 실패");
			request.getRequestDispatcher("views/member/minglesEnroll.jsp").forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
