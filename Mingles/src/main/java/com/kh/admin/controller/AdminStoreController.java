package com.kh.admin.controller;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;
import com.kh.admin.model.service.AdminService;
import com.kh.admin.model.vo.Item;
import com.kh.admin.model.vo.ItemCategory;

/**
 * Servlet implementation class AdminStoreController
 */
@WebServlet("/store.am")
public class AdminStoreController extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public AdminStoreController() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		
		// 아이템 테이블 조회 
		ArrayList<Item> itemList = new AdminService().selectItem();
		ArrayList<ItemCategory> itemCategory = new AdminService().selectItemCategory();
		// 상품등록시 첨부파일
		request.setAttribute("itemCategory", itemCategory);
		request.setAttribute("item", itemList);
		
		
		request.getRequestDispatcher("/views/admin/adminStore.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
