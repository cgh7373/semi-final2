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
 * Servlet implementation class MinglesGiftEggController
 */
@WebServlet("/giftEgg.mi")
public class MinglesGiftEggController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MinglesGiftEggController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int price = Integer.parseInt(request.getParameter("price"));
		int point = Integer.parseInt(request.getParameter("point"));
		String userId = request.getParameter("userId");
		
		Member m = new MemberService().selectIdMember(userId);
		
		int userEgg = m.getEgg(); // 선물할 상대의 거북알 뽑아서 넣기
		int sum = point + userEgg;
		int userNo = m.getMemNo();
		
		request.setAttribute("userNo", userNo);
		request.setAttribute("sum", sum);
		request.setAttribute("price", price);
		request.setAttribute("point", point);
		
			
		request.getRequestDispatcher("views/shop/minglesGiftEgg.jsp").forward(request, response);
		
	
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
