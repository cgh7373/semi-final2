package com.kh.shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;

/**
 * Servlet implementation class MinglesChargeEggController
 */
@WebServlet("/chargeEgg.mi")
public class MinglesChargeEggController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MinglesChargeEggController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int egg = Integer.parseInt(request.getParameter("egg"));
		int price = Integer.parseInt(request.getParameter("price"));
		int point = Integer.parseInt(request.getParameter("point"));
		
		int sum = egg + point;

		request.setAttribute("userNo", userNo);
		request.setAttribute("sum", sum);
		request.setAttribute("price", price);
		request.setAttribute("point", point);
		
		request.getRequestDispatcher("views/shop/minglesChargeEgg.jsp").forward(request, response);
	
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
