package servlets;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Post_dao;
import dao.User_dao;
import dao.Comment_dao;
import entity.Post;
import entity.User;
import entity.Comment;

/**
 * Servlet implementation class Post_detail
 */
@WebServlet("/Post_detail")
public class Post_detail extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Post_detail() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		if (id==null || id.length() == 0) {
			   id ="1";
		}
		Post post = new Post();
		List<Comment> real_comments = new ArrayList<Comment>();
		try {
			Post_dao p_dao = new Post_dao();
			User_dao u_dao = new User_dao();
			Comment_dao c_dao =new Comment_dao();
			Long id2 = Long.valueOf(id);
			Post newpost = p_dao.findById(id2);
			List<Comment> comments = c_dao.findById(id2);
			for(Comment comment : comments) {
				    User user = u_dao.getById(comment.getUserId());
		            comment.setUser(user);
		        }
			real_comments = comments;
	        request.setAttribute("commentList", real_comments);
			post = newpost;
			User user = u_dao.getById(post.getUserId());
			post.setUser(user);
			request.setAttribute("post", post);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		request.getRequestDispatcher("/Jsp/front-end/post_detail.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
