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

import dao.Post_dao;
import dao.User_dao;
import entity.Post;
import entity.User;

/**
 * Servlet implementation class Post_list_back
 */
@WebServlet("/Post_list_back")
public class Post_list_back extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Post_list_back() {
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
		String role = user.getRole();
		List<Post> posts = new ArrayList<Post>();
		try {
			User_dao u_dao = new User_dao();
			if(role.equals("admin")) {
				Post_dao p_dao = new Post_dao();
				posts = p_dao.findall1();
				for(Post post : posts) {
				    User user1 = u_dao.getById(post.getUserId());
		            post.setUser(user1);
		        }
			}else{
				Post_dao p_dao = new Post_dao();
				posts = p_dao.findAllById(user_id);
				for(Post post : posts) {
				    User user1 = u_dao.getById(post.getUserId());
		            post.setUser(user1);
				} 
			}
			request.setAttribute("posts", posts);
			request.setAttribute("tab", "post-list");
			request.getRequestDispatcher("/Jsp/back-end/post_list.jsp").forward(request, response); 
		}catch(Exception e) {
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
