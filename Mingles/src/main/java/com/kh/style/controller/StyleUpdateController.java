package com.kh.style.controller;

import java.io.IOException;
import java.util.Collections;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.google.gson.Gson;
import com.kh.style.model.service.StyleService;
import com.kh.style.model.vo.Style;

/**
 * Servlet implementation class StyleUpdateController
 */
@WebServlet("/updateAvatar.st")
public class StyleUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public StyleUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int memNo = Integer.parseInt(request.getParameter("memno"));
		String hair = request.getParameter("hair");
		String face = request.getParameter("face");
		String top =  request.getParameter("top");
		String bottom = request.getParameter("bottom");
		String shoes = request.getParameter("shoes");
		
		Style st = new Style(memNo, hair, face, top, bottom, shoes);
		
		int result = new StyleService().updateStyle(st);
		
		if(result>0) { // 성공했을 때 응답뷰
			response.setContentType("application/json; charset=utf-8");
			new Gson().toJson(Collections.singletonMap("success", result > 0), response.getWriter());
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
