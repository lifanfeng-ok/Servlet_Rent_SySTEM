package servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Objects;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import dao.User_dao;
import entity.User;
import javax.servlet.http.HttpSession;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import com.alibaba.fastjson.JSON;
/**
 * Servlet implementation class Login
 */
@WebServlet("/Login")
public class Login extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Login() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		HttpSession session = request.getSession();
		String uname = request.getParameter("userName");
		String password = request.getParameter("userPass");
		boolean result = false ;
		try {
			User_dao userdao = new User_dao();
			User user  = userdao.findByname(uname, password);
			if (user == null) {
				JSONObject jsonObject=new JSONObject();
				jsonObject.put("message", "Wrong username or password");
				out.write(jsonObject.toString());
				out.flush();
				return;
			}
			if (Objects.equals(user.getStatus(), 1)) {
				    JSONObject jsonObject=new JSONObject() ;
					jsonObject.put("message", "Your account has been forbidden, Please Contact Admin");
					out.write(jsonObject.toString());
					out.flush();  
					return;
		        }
			  else {
				    JSONObject jsonObject=new JSONObject() ;
					jsonObject.put("user", JSONObject.fromObject(user));
					jsonObject.put("message", "Successed");
					session.setAttribute("user", user);
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
