package com.kh.posts.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.posts.model.service.PostsService;
import com.kh.posts.model.vo.Post;

/**
 * Servlet implementation class UpdatePostController
 */
@WebServlet("/update.po")
public class UpdatePostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public UpdatePostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
	{
		int pNum = Integer.parseInt(request.getParameter("postNum"));
		String scope = request.getParameter("scope");
		String title = request.getParameter("title");
		String tag = request.getParameter("tag");
		String content = request.getParameter("content");
		
		Post p = new Post();
		
		p.setPostNum(pNum);
		p.setPostScope(scope);
		p.setPostTitle(title);
		p.setPostTag(tag);
		p.setPostContent(content);
		
		int result = new PostsService().updatePost(p); 
		if(result>0)
		{
			response.sendRedirect(request.getContextPath()+"/detail.po?pno="+p.getPostNum());
			//request.getRequestDispatcher(request.getContextPath()+"/detail.po?pno="+p.getPostNum()).forward(request, response);
		}
		
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
