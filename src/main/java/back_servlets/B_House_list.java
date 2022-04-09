package back_servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.Comment;
import entity.User;
import entity.House;
import dao.House_dao;

/**
 * Servlet implementation class B_House_list
 */
@WebServlet("/B_House_list")
public class B_House_list extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public B_House_list() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long user_id = null;
		boolean is_admin =false;
		HttpSession session = request.getSession(false);
		List<House> houses = new ArrayList<House>();
		User user =(User)session.getAttribute("user");
		Long id = user.getId();
		user_id = id;
		try {
			House_dao h_dao = new House_dao();
			if (user.getRole().equals("admin")) {
				houses = h_dao.findall();
				is_admin = true;
			} else {
				houses = h_dao.findByUserId(user_id);				
			}
			request.setAttribute("isAdmin", is_admin);
			request.setAttribute("houses", houses);
			request.setAttribute("tab", "house-list");
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("/Jsp/back-end/b_house_list.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
