package back_servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.User;
import entity.Collect;
import entity.House;
import dao.Collect_dao;
import dao.House_dao;

/**
 * Servlet implementation class Mark_list
 */
@WebServlet("/Mark_list")
public class Mark_list extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mark_list() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		HttpSession session = request.getSession(false);
		User user =(User)session.getAttribute("user");
		Long id = user.getId();
		Long user_id = id;
		try {
			Collect_dao c_dao = new Collect_dao();
			List<Long> house_Id = c_dao.find_houseId(user_id);
			House_dao h_dao = new House_dao();
			List<House> houseInfo = h_dao.findByHouseId(house_Id);								
			request.setAttribute("house", houseInfo);
			request.setAttribute("tab", "mark-list");
			request.getRequestDispatcher("/Jsp/back-end/mark_list.jsp").forward(request, response); 			
		}catch (Exception e) {
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
