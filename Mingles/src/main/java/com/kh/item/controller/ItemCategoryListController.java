package com.kh.item.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.item.model.service.ItemService;
import com.kh.item.model.vo.Item;
import com.kh.common.model.vo.ItemListResponse;
import com.kh.common.model.vo.PageInfo;

/**
 * Servlet implementation class ItemCategoryListController
 */
@WebServlet("/listCa.it")
public class ItemCategoryListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ItemCategoryListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String category = request.getParameter("category");
		String cpage = request.getParameter("cpage");

		int listCount; // 총 게시글 개수 - 전체 select문에서 사용할 것 
		int categoryListCount; // - 일부 select문에서 사용할 것
		int currentPage =1; // 현재 요청한 페이지
		int pageLimit; //페이지 하단에 보여질 페이징바의 페이지 최대 개수(나는 5)
		int boardLimit; // 한 페이지에 보여질 게시글의 최대 개수(나는 5)
		int maxPage; // 총 페이지 수 - 전체 select문
		int categorymaxPage; //총 페이지 수 - 일부 select문
		int startPage; // 페이징바의 시작수
		int endPage; //페이징바의 끝수

		// 현재 페이지 -> 쿼리스트링으로 넘김
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		// 페이지 최대 개수 (나는 5개 할거임)
		pageLimit = 5;
		// 한 페이지에 보여질 게시글 수 (나는 5개 할거임)
		boardLimit = 5;
		// 페이징바 시작 수
		startPage = (currentPage-1) / pageLimit * pageLimit +1;
		// 페이징바 마지막 수
		endPage = startPage + pageLimit-1;
		
		// 카테고리가 선택된 경우
		// 총 게시글 수 : categoryListCount
		categoryListCount = new ItemService().selectListWithCategoryCount(category);
		// 총 페이지 수
		categorymaxPage = (int)Math.ceil((double)categoryListCount/boardLimit);
		// endPage = categorymaxPage로 변경
		if(endPage>categorymaxPage) {
			endPage = categorymaxPage;
		}// 내부 if문
		
		// 1. pageInfo 가공(조회, 페이징바 선택시)
		PageInfo pi = new PageInfo(categoryListCount, currentPage, pageLimit, boardLimit, categorymaxPage, startPage, endPage);
		// 2. 서비스에게 정보 요청(카테고리 포함된 것)
		ArrayList<Item> list = new ItemService().selectListWithCategory(pi, category);
		
		// pi와 list를 같이 담기 위해 만든 야매 메소드
		ItemListResponse result = new ItemListResponse(pi, list);
		
		// 3. 응답 던지기
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
