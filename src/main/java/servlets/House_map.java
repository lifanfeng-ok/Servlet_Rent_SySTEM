package servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.House_dao;
import dao.User_dao;
import dao.Collect_dao;
import entity.Collect;
import entity.User;
import entity.House;

/**
 * Servlet implementation class House_map
 */
@WebServlet("/House_map")
public class House_map extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public House_map() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		try {
			House_dao h_dao = new House_dao();
			Long id2 = Long.valueOf(id);
			House house = h_dao.findByid2(id2);
			String l_a = house.getLongitudeLatitude();
			String[] arr = l_a.split(",");
			String longitude = arr[0];
			String latitude = arr[1];
			String address = house.getAddress();
			request.setAttribute("longitude", longitude);
		    request.setAttribute("latitude", latitude);
		    request.setAttribute("address", address);
			request.getRequestDispatcher("/Jsp/front-end/house_map.jsp").forward(request, response); 
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
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
