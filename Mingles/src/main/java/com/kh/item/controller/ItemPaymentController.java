package com.kh.item.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.item.model.service.ItemService;
import com.kh.item.model.vo.Item;

/**
 * Servlet implementation class ItemPaymentController
 */
@WebServlet("/payItem.it")
public class ItemPaymentController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemPaymentController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 구매하는 서블릿 - 정보를 style로 보낼 것임

		int itemNo = Integer.parseInt(request.getParameter("itemNo"));
		int itemPrice = Integer.parseInt(request.getParameter("itemPrice"));
		
		Item it = new ItemService().purchaseItem(itemNo, itemPrice);
		
		response.setContentType("application/json; charset=utf-8");
		new Gson().toJson(it, response.getWriter());
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
