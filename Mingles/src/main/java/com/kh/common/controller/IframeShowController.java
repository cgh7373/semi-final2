package com.kh.common.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

/**
 * Servlet implementation class IframeShowController
 */
@WebServlet("/iframeShow.mi")
public class IframeShowController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public IframeShowController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String iSrc = request.getParameter("iSrc");
		
		String page = "";
		
		switch (iSrc) {
		
		case "settings" : 
			page = "/Mingles/views/settings/minglesSettings.jsp";
			break;
			
		case "main" :
			page = "/Mingles/views/main/minglesMain.jsp";
			break;
			
		case "shop" :
			page = "/Mingles/list.it?cpage=1";
			break;
			
		case "style" :
			page = "/Mingles/views/style/minglesStyle.jsp";
			break;
		
		case "chat" :
			page = "/Mingles/views/chat/minglesChat.jsp";
			break;
			
		case "posts" : 
			page = "/Mingles/views/posts/minglesPosts.jsp";
			break;
			
		case "etas" :
			page = "https://www.youtube.com/embed/jOTfBlKSQYY?autoplay=1&loop=1";
			break;
		
		}
		
		response.setContentType("json/application; charset=utf-8;");
		
		new Gson().toJson(page, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
