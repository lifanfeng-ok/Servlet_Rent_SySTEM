package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.House;
import dao.House_dao;
/**
 * Servlet implementation class House_list
 */
@WebServlet("/House_list")
public class House_list extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public House_list() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		   List<House> houses = new ArrayList<House>();
		   String address = request.getParameter("address");
		   String region = request.getParameter("region");
		   String rentType = request.getParameter("rentType");
		   String priceRange = request.getParameter("priceRange");
		   Integer minPrice = 0;
	       Integer maxPrice = 300;
	       if (priceRange!=null && priceRange.length() !=0) {
	           String[] arr = priceRange.split(";");
	           if (arr.length == 2) {
	                    minPrice = Integer.valueOf(arr[0]);
	                    maxPrice = Integer.valueOf(arr[1]);
	                }
	            }
	       else {
	    	   minPrice = 0;
               maxPrice = 10000;
	       }
		try {
			House_dao h_dao = new House_dao();
			houses = h_dao.findByParameter(address,region,rentType,priceRange);
			request.setAttribute("houses", houses);
			request.setAttribute("address", address);
			request.setAttribute("region", region);
			request.setAttribute("rentType", rentType);
			request.setAttribute("minPrice", minPrice);
			request.setAttribute("maxPrice", maxPrice);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("/Jsp/front-end/house_list.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
