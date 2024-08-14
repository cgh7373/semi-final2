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
 * Servlet implementation class StatusMsgController
 */
@WebServlet("/statusMsg.mi")
public class StatusMsgController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StatusMsgController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		request.setCharacterEncoding("utf-8");
		
		String memId = request.getParameter("userId");
		String Msg = request.getParameter("statusMsg");
		
		Member updateMem = new MemberService().updateMsg(memId, Msg);
		
		HttpSession session = request.getSession();
		if (updateMem == null) {
			session.setAttribute("errorMsg", "상태메세지가 변경되지 않았어요");
		} else {
			session.setAttribute("loginUser", updateMem);
			session.setAttribute("alertMsg", "상태메세지가 변경됐어요");
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
