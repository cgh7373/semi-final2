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
 * Servlet implementation class UpdatePasswordController
 */
@WebServlet("/updatePwd.mi")
public class UpdatePasswordController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePasswordController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String memId = request.getParameter("userId");
		String memPwd = request.getParameter("userPwd");
		String updatePwd = request.getParameter("updatePwd");
		
		int result = new MemberService().updatePwd(memId, memPwd, updatePwd);
		
		HttpSession session = request.getSession();
		if (result > 0) {
			session.setAttribute("alertMsg", "비밀번호가 변경됐어요");
		} else {
			session.setAttribute("errorMsg", "비밀번호가 변경되지 않았어요");
		}
		
		response.sendRedirect("views/settings/minglesSettings.jsp");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
