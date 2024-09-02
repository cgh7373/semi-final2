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
 * Servlet implementation class EggUpdateController
 */
@WebServlet("/eggUpdate.mi")
public class EggUpdateController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EggUpdateController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		int sum = Integer.parseInt(request.getParameter("sum"));
		
		int result = new MemberService().chargeEgg(userNo, sum);
		
		Member m = new MemberService().selectNoMember(userNo);
		request.getSession().setAttribute("loginUser", m);
		
		int price = Integer.parseInt(request.getParameter("price"));
		int point = Integer.parseInt(request.getParameter("point"));
		String payOption = "카드, 간편결제";
		String category = "본인";
		EggPayMent ep = new EggPayMent(userNo, price, point, payOption, category);
		int result2 = new ShopService().insertChargeList(ep);
		
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
