package servlets;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.House_dao;
import dao.User_dao;
import dao.Collect_dao;
import entity.Collect;
import entity.User;
import entity.House;
import com.alibaba.fastjson.JSON;

/**
 * Servlet implementation class House_detail
 */
@WebServlet("/House_detail")
public class House_detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public House_detail() {
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
			Long user_id = null;
			boolean is_col;
			HttpSession session = request.getSession(false);
			User user =(User)session.getAttribute("user");
			House_dao h_dao = new House_dao();
			User_dao u_dao = new User_dao();
			Collect_dao c_dao = new Collect_dao();
			Long id2 = Long.valueOf(id);
			House house = h_dao.findById(id2);
			if (user == null) {
				 is_col = false;
			}
			else {
					Long u_id = user.getId();
					user_id = u_id;
					is_col = c_dao.find_collect(user_id, house.getId());					
			}
			User owner = u_dao.getById(house.getUserId());
			List<String> slideList = JSON.parseArray(house.getSlideUrl(), String.class);
	        house.setSlideImgList(slideList);	     
	        if (house.getRentType().equals("share")) {	        	
	        	List<House> sharedhouses = h_dao.findBycerandid(house.getUserId(),house.getCertificateNo(),"share");
	        	house.setShareHouseList(sharedhouses);
	        }
	        if (is_col) {
	          request.setAttribute("is_col", true);
	        } else {
	          request.setAttribute("is_col", false);
	        }
	        request.setAttribute("house", house);
	        request.setAttribute("owner", owner);
			request.getRequestDispatcher("/Jsp/front-end/house_detail.jsp").forward(request, response); 
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
