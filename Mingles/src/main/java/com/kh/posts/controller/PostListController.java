package com.kh.posts.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;
import com.kh.common.model.vo.PageInfo;
import com.kh.posts.model.service.PostService;
import com.kh.posts.model.vo.Post;

/**
 * Servlet implementation class PostListController
 */
@WebServlet("/list.po")
public class PostListController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public PostListController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		int listCount; 	 //현재 총 게시글 개수
		int currentPage; //현재 페이지(즉 사용자가 요펑한 페이지)
		int pageLimit;   //페이지 하단에 보여질 페이징바의 페이지 최대개수(몇개 단위씩)
		int boardLimit;  //한 페이지내에 보여질 게시글 최대 개수 (몇개 단위씩)
		int maxPage;     //가장 마지막 페이지
		int startPage;   //시작 페이지
		int endPage;     //마지막페이지
		listCount = new PostService().selectListCount();
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 10;
		boardLimit = 9;
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		startPage = ((currentPage-1)/pageLimit) * pageLimit+1;
		endPage = startPage + pageLimit-1;
		if(endPage > maxPage)
		{
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit,maxPage ,startPage, endPage);
		ArrayList<Post> list = new PostService().postListSelect(pi);
		response.setContentType("json/application; charset=utf-8");
		 Gson gson = new Gson();
		 // 응답 JSON 객체 생성
	    JsonObject jsonResponse = new JsonObject();
	    // ArrayList<Post>를 JSON 배열로 변환
	    JsonArray jsonArray = gson.toJsonTree(list).getAsJsonArray();
	    // JSON 객체에 배열과 PageInfo 추가
	    jsonResponse.add("list", jsonArray);
	    jsonResponse.add("pi", gson.toJsonTree(pi));
	    // JSON 객체를 응답으로 보내기
	    response.getWriter().print(jsonResponse.toString());
	    //----------------------------------------------------
		/*request.getSession().setAttribute("pi", pi);
		System.out.println("list.po : "+pi);
		request.getSession().setAttribute("list", list);
		new Gson().toJson(pi, response.getWriter());*/
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
