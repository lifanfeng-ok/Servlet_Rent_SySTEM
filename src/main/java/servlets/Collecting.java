package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import entity.User;
import entity.Collect;
import dao.Collect_dao;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class Collecting
 */
@WebServlet("/Collecting")
public class Collecting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Collecting() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String house_id = request.getParameter("houseId");
		Long h_id = Long.valueOf(house_id);
		Long user_id = null;
		HttpSession session = request.getSession(false);
		User user =(User)session.getAttribute("user");
		if (user !=null) {
		  Long id = user.getId();
		  user_id = id;
		}
		else {
		    JSONObject jsonObject=new JSONObject() ;
		    jsonObject.put("status", 0);
			jsonObject.put("message", "Please Log in first!");
			out.write(jsonObject.toString());
			out.flush();  
				return;
		}
		try {
			Collect_dao c_dao = new Collect_dao();
			boolean is_collect = c_dao.find_collect(user_id,h_id);
			if (is_collect == true) {
				 JSONObject jsonObject=new JSONObject() ;
				 jsonObject.put("status", 1);
			     jsonObject.put("message", "Already Collected");
				 out.write(jsonObject.toString());
				 out.flush();  
				   return;
			}
			else {
			 boolean collected = c_dao.insert_collect(user_id,h_id);
			    if (collected == true) {
			    	 JSONObject jsonObject=new JSONObject() ;
					 jsonObject.put("status", 2);
				     jsonObject.put("message", "Collect Successfully");
					 out.write(jsonObject.toString());
					 out.flush();  
					   return;
			    }
			    else {
			    	 JSONObject jsonObject=new JSONObject() ;
					 jsonObject.put("status", 3);
				     jsonObject.put("message", "Collect Failed");
					 out.write(jsonObject.toString());
					 out.flush();  
					   return;
			    }
			}
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
