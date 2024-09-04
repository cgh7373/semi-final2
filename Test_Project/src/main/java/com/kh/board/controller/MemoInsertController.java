package com.kh.board.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.board.model.dao.BoardDao;
import com.kh.board.model.service.BoardService;
import com.kh.board.model.vo.Memo;
import com.kh.board.model.vo.MemoReadStatus;

/**
 * Servlet implementation class MemoInsertController
 */
@WebServlet("/memoInsert.mi")
public class MemoInsertController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public MemoInsertController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String content = request.getParameter("content");
		String date = request.getParameter("date");
		int writer = Integer.parseInt(request.getParameter("writer"));
		int owner = Integer.parseInt(request.getParameter("owner"));
		String scope = request.getParameter("scope");
		
		
		Memo m = new Memo();
		
		m.setMemoOwner(owner);
		m.setMemoWriter(writer);
		m.setMemoContent(content);
		m.setMemoDate(date);
		m.setMemoScope(scope);
		
		if (writer != owner) {
			
			int year = Integer.parseInt(request.getParameter("year"));
			int month = Integer.parseInt(request.getParameter("month"));
			
			MemoReadStatus rs = new MemoReadStatus();
			
			rs.setOwnerNo(owner);
			rs.setReadYear(year);
			rs.setReadMonth(month);
			rs.setReadDate(date);
			
			new BoardService().insertReadStatus(rs);
		}
		
		int result = new BoardService().insertMemo(m);
		
		response.setContentType("json/application; charset=utf-8;");
		
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
