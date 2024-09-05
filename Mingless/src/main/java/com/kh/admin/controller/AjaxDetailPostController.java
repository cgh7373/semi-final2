package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.admin.model.service.AdminService;
import com.kh.admin.model.vo.Post;
import com.kh.admin.model.vo.Reply;

/**
 * Servlet implementation class AjaxDetailPostController
 */
@WebServlet("/userPostDetail.am")
public class AjaxDetailPostController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxDetailPostController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		int postNo = Integer.parseInt(request.getParameter("postNo"));
		
		Post p = new AdminService().selectpost(postNo);
		ArrayList<Reply> replyList = new AdminService().selectReply(postNo);
		
		System.out.println(replyList);
		
		response.setContentType("application/json; charset=utf-8");
		Map<String, Object> result = new HashMap<String, Object>();
		
		if(p != null) {
			result.put("post", p);
			result.put("reply", (replyList != null) ? replyList : new ArrayList<Reply>());
		}else {
			result.put("nodata", "NNNN");
		}
		
		Gson gson = new Gson();
		String jsonResponse = gson.toJson(result);
		response.getWriter().print(jsonResponse);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
