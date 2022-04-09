package back_servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Post_dao;
import entity.User;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class Post_submit
 */
@WebServlet("/Post_submit")
public class Post_submit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Post_submit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String title = request.getParameter("title");
		String content = request.getParameter("content");
		Long user_id = null;
		HttpSession session = request.getSession(false);
		User user =(User)session.getAttribute("user");
		Long id = user.getId();
		user_id = id;
		try {
			Post_dao p_dao =new Post_dao();
			boolean posted = p_dao.insert_post(user_id, title,content);
			if (posted == true) {
			    	 JSONObject jsonObject=new JSONObject() ;
					 jsonObject.put("status", 1);
				     jsonObject.put("message", "Post Successfully");
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
