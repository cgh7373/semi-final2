package com.kh.posts.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.common.model.vo.PageInfo;
import com.kh.posts.model.service.PostsService;
import com.kh.posts.model.vo.Post;

/**
 * Servlet implementation class MinglesManagingPostsController
 */
@WebServlet("/postsForm.mi")
public class MinglesManagingPostsController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MinglesManagingPostsController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{

		int listCount; 	 
		int currentPage;
		int pageLimit;   
		int boardLimit; 
		int maxPage;     
		int startPage;
		int endPage;
		listCount = new PostsService().selectListCount();
		currentPage = Integer.parseInt(request.getParameter("cpage"));
		pageLimit = 10;
		boardLimit = 7;
		maxPage = (int)Math.ceil((double)listCount/boardLimit);
		startPage = ((currentPage-1)/pageLimit) * pageLimit+1;
		endPage = startPage + pageLimit-1;
		if(endPage > maxPage)
		{
			endPage = maxPage;
		}
		PageInfo pi = new PageInfo(listCount, currentPage, pageLimit, boardLimit,maxPage ,startPage, endPage);
		int writer = Integer.parseInt(request.getParameter("writer")); 
		ArrayList<Post> list= new PostsService().selectList(writer,pi);
		request.setAttribute("pi", pi);
		request.setAttribute("list", list);
		request.getRequestDispatcher("views/posts/minglesManagingPosts.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
