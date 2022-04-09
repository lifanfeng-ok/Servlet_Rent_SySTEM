package back_servlets;

import java.io.IOException;
import java.io.PrintWriter;

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
import net.sf.json.JSONObject;
/**
 * Servlet implementation class Change
 */
@WebServlet("/Change")
public class Change extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Change() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
//		HttpSession session = request.getSession();
		String d_name = request.getParameter("userDisplayName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String sex = request.getParameter("sex");
		String job = request.getParameter("job");
		String country = request.getParameter("country");
		String hobby = request.getParameter("hobby");
		Long user_id = null;
		System.out.println(country);
		HttpSession session = request.getSession(false);
		User user =(User)session.getAttribute("user");
		user_id = user.getId();
		
		try {
			User_dao userdao = new User_dao();
			boolean x = userdao.change(email, phone, d_name, sex, country, hobby, job, user_id);
			if (x == true) {
			    JSONObject jsonObject=new JSONObject();
			    User user2 = userdao.getById(user_id);
			    session.setAttribute("user", user2);
				jsonObject.put("message", "Successed");
				out.write(jsonObject.toString());
				out.flush();   
				return;
			}
			else {
				JSONObject jsonObject=new JSONObject();
				jsonObject.put("message", "unsuccessful");
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
