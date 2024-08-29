package com.kh.admin.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.kh.admin.model.service.AdminService;

/**
 * Servlet implementation class AdminCancelDeleteItemController
 */
@WebServlet("/cancleDeleteItem.am")
public class AdminCancelDeleteItemController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminCancelDeleteItemController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int itemNo = Integer.parseInt(request.getParameter("itemNo"));
		String itemCategory = request.getParameter("itemCategory");
		int result = new AdminService().cancelDeleteItem(itemNo, itemCategory);
		
		if(result > 0) {
			request.getSession().setAttribute("alertMsg", "상품이 재등록 되었습니다!");
			response.sendRedirect(request.getContextPath() + "/store.am");
		}else {
			request.getSession().setAttribute("errorMsg", "상품 재등록에 실패했습니다");
			response.sendRedirect(request.getContextPath() + "/store.am");
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
