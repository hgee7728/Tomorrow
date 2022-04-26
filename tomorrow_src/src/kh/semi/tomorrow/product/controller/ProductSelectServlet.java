package kh.semi.tomorrow.product.controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kh.semi.tomorrow.product.model.service.ProductService;
import kh.semi.tomorrow.product.model.vo.ProductVo;

/**
 * Servlet implementation class ProductSelectServlet
 */
@WebServlet("/detail")
public class ProductSelectServlet extends HttpServlet {
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public ProductSelectServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String pNoStr = request.getParameter("p_no");
		int pNo = 0;
		try {
			pNo = Integer.parseInt(pNoStr);
		}catch(NumberFormatException e) {
			e.printStackTrace();
		}
		if(pNo < 1 ) {
			//오류 페이지로 이동. 또는 boardlist로 이동
			return;
		}
		ProductVo result = new ProductService().selectProduct(pNo);
		System.out.println(result);
		result.setpContent(result.getpContent().replaceAll("(\r\n|\n)", "<br>"));
		
		System.out.println(result);
		request.setAttribute("optvo", result);
		request.getRequestDispatcher("WEB-INF/view/board/read.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
//	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		// TODO Auto-generated method stub
//		doGet(request, response);
//	}

}
