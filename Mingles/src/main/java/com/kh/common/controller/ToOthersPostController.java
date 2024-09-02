package com.kh.common.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 * Servlet implementation class ToOthersPostController
 */
@WebServlet("/toOthersPost.mi")
public class ToOthersPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ToOthersPostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int owner = Integer.parseInt(request.getParameter("owner"));
		String modal = request.getParameter("modal");
		int pNum = 0;
		
		if (request.getParameter("pNum") != null) {
			pNum = Integer.parseInt(request.getParameter("pNum"));
		}
		
		response.sendRedirect(request.getContextPath() + "/views/posts/minglesPosts.jsp?owner=" + owner + "&pNum=" + pNum + "&modal=" + modal);
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
