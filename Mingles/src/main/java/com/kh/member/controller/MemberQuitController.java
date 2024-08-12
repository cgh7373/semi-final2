package com.kh.member.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.kh.member.model.service.MemberService;

/**
 * Servlet implementation class MemberQuitController
 */
@WebServlet("/memberQuit.mi")
public class MemberQuitController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemberQuitController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String quitMent = request.getParameter("quitMent");
		String memId = request.getParameter("userId");
		String memPwd = request.getParameter("checkPwd");
		
		HttpSession session = request.getSession();
		if (quitMent.equals("탈퇴하겠습니다")) {
			
			int result = new MemberService().quitMember(memId, memPwd);
			
			if (result > 0) {
				session.invalidate();
				response.sendRedirect("views/settings/minglesSettings.jsp");
			} else {
				session.setAttribute("errorMsg", "돌아가요");
				response.sendRedirect("views/settings/minglesSettings.jsp");
			}
			
		} else {
			session.setAttribute("errorMsg", "잘못 입력했어요");
			response.sendRedirect("views/settings/minglesSettings.jsp");
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
