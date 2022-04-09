package back_servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.User_dao;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class User_enable
 */
@WebServlet("/User_enable")
public class User_enable extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public User_enable() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String u_id =request.getParameter("id");
		Long id2 = Long.valueOf(u_id);
		try {
			User_dao u_dao = new User_dao();
			boolean is_enable = u_dao.enable(id2);
			if (is_enable == true) {
		    	 JSONObject jsonObject=new JSONObject() ;
				 jsonObject.put("status", 1);
			     jsonObject.put("message", "Enable Successfully");
				 out.write(jsonObject.toString());
				 out.flush();  
				   return;
		    } else {
		    	 JSONObject jsonObject=new JSONObject() ;
				 jsonObject.put("status", 0);
			     jsonObject.put("message", "Failed");
				 out.write(jsonObject.toString());
				 out.flush();  
				   return;
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
