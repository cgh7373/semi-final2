package com.kh.style.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.style.model.service.StyleService;
import com.kh.style.model.vo.PurItem;

/**
 * Servlet implementation class ItemInsertController
 */
@WebServlet("/insertItem.st")
public class ItemInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int itemNo = Integer.parseInt(request.getParameter("itemNo"));
		String itemCategory = request.getParameter("itemCategory");
		String itemName = request.getParameter("itemName");
		String fileName = request.getParameter("fileName");
		
		PurItem pitem = new PurItem(userNo, itemNo, itemCategory, itemName, fileName); 
		
		int result = new StyleService().insertItem(pitem);
		
		response.setContentType("application/json; charset=utf-8");			
		new Gson().toJson(result, response.getWriter());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
