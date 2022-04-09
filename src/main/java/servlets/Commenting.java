package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import dao.Comment_dao;
import dao.Post_dao;
import entity.Comment;
import entity.User;
import entity.Post;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class Commenting
 */
@WebServlet("/Commenting")
public class Commenting extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Commenting() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String post_id = request.getParameter("postId");
		String content = request.getParameter("content");
		Long p_id = Long.valueOf(post_id);
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
			Post_dao p_dao =new Post_dao();
			Post post = p_dao.findById(p_id);
			Comment_dao cm_dao = new Comment_dao();
			Long p_user_id = post.getUserId();
			boolean commented = cm_dao.insert_comment(user_id,p_id,p_user_id, content);
			if (commented == true) {
			    	 JSONObject jsonObject=new JSONObject() ;
					 jsonObject.put("status", 1);
				     jsonObject.put("message", "Comment Successfully");
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
