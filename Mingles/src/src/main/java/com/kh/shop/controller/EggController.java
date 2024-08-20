package com.kh.shop.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.member.model.service.MemberService;
import com.kh.member.model.vo.Member;
import com.kh.shop.model.service.ShopService;
import com.kh.shop.model.vo.EggPayMent;

/**
 * Servlet implementation class EggController
 */
@WebServlet("/eggForm.mi")
public class EggController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EggController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int listCount; 		// 현재 총 게시글 개수
		int currentPage; 	// 현재 페이지(즉, 사용자가 요청한 페이지)
		int pageLimit; 		// 페이지 하단에 보여질 페이징바의 페이지 최대개수(몇개 단위씩)
		int boardLimit; 	// 한 페이지 내에 보여질 게시글 최대개수(몇개 단위씩)
		
		int maxPage; 		// 가장 마지막 페이지(총 페이지 수)
		int startPage; 		// 페이징바의 시작 수
		int endPage; 		// 페이징바의 끝 수
		
		int userNo = Integer.parseInt(request.getParameter("userNo"));
		listCount = new ShopService().selectListCount(userNo); // 게시글 총 개수 가져오기
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 10;
		boardLimit = 10;
		
		maxPage = (int)Math.ceil((double)listCount / boardLimit);
		startPage = (currentPage -1) / pageLimit * pageLimit + 1;
		endPage = startPage + pageLimit -1;
		
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit, maxPage, startPage, endPage);
		
		ArrayList<EggPayMent> list = new ShopService().selectList(pi, userNo);
		
		request.setAttribute("pi", pi); // 페이징바를 만들 때 필요한 객체
	    request.setAttribute("list", list);
		
		request.getRequestDispatcher("views/shop/minglesEgg.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
