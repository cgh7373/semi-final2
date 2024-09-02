package com.kh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;
import com.kh.admin.model.vo.Notice;

/**
 * Servlet implementation class AjaxInsertNoticeController
 */
@WebServlet("/insertNotice.am")
public class AjaxInsertNoticeController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AjaxInsertNoticeController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8"); 
		
		String title = request.getParameter("nTitle");
		String content = request.getParameter("nContent");
		String imgPath = request.getParameter("nImg");
		String html = request.getParameter("html");
		String writer = request.getParameter("writer");
		
		title = title.substring(title.indexOf(":") +2);
		content = content.substring(content.indexOf(":") + 2);

		Notice notice = new Notice(title, content, imgPath, writer);
		
		// 공지사항 미리보기를 위한 저장, 공지사항작성된 html 저장
		int result = new AdminService().insertNotice(notice, html);
		
		if(result > 0 ) {
			response.setContentType("html/text; charset=utf-8");
			response.getWriter().print("noitceY");
		}else {
			response.setContentType("html.text; charset=utf-8");
			response.getWriter().print("noticeN");
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
