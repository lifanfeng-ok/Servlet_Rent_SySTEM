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

import entity.User;
import dao.Comment_dao;
import dao.User_dao;
import dao.Post_dao;
import entity.Comment;
import entity.Post;

/**
 * Servlet implementation class Comment_list
 */
@WebServlet("/Comment_list")
public class Comment_list extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Comment_list() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		Long user_id = null;
		HttpSession session = request.getSession(false);
		List<Comment> comments = new ArrayList<Comment>();
		User user =(User)session.getAttribute("user");
		Long id = user.getId();
		user_id = id;
		try {
			Comment_dao c_dao = new Comment_dao();
			User_dao u_dao = new User_dao();
			Post_dao p_dao = new Post_dao();
			if (user.getRole().equals("admin")) {
				 comments = c_dao.findall();
				 for(Comment comment : comments) {
					    User user2 = u_dao.getById(comment.getUserId());
					    Post post = p_dao.findById(comment.getPostId());
					    comment.setUser(user2);
					    comment.setPost(post);
			        }  
			} else {
				comments =c_dao.findByUserId(user_id);
				for(Comment comment : comments) {
					    User user2 = u_dao.getById(comment.getUserId());
					    Post post = p_dao.findById(comment.getPostId());
					    comment.setUser(user);
					    comment.setPost(post);
			        }  
			}
			request.setAttribute("tab", "comment-list");
			request.setAttribute("comments", comments);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("/Jsp/back-end/comment_list.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
