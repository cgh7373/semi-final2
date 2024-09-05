package com.kh.shop.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.shop.model.service.ShopService;
import com.kh.shop.model.vo.EggPayMent;

/**
 * Servlet implementation class EggGiftUpdateController
 */
@WebServlet("/eggGiftUpdate.mi")
public class EggGiftUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EggGiftUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// 선물받은 회원 관련 정보 받아오기
		int giftUserNo = Integer.parseInt(request.getParameter("giftUserNo"));
		int sum = Integer.parseInt(request.getParameter("sum"));
		// 선물받은 회원 거북알 충전
		int result = new MemberService().chargeEgg(giftUserNo, sum);
		
		// 선물한 회원의 결제내역 insert에 필요한 정보 받아오기
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int price = Integer.parseInt(request.getParameter("price"));
		int point = Integer.parseInt(request.getParameter("point"));
		String payOption = request.getParameter("payOption");
		String category = "선물";
		EggPayMent ep = new EggPayMent(userNo, price, point, payOption, category);
		// 선물한 회원의 결제내역 insert
		int result2 = new ShopService().insertChargeList(ep);
		
		Member m = new MemberService().selectNoMember(giftUserNo); // ?
		request.getRequestDispatcher("views/shop/minglesChargeFinish.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
