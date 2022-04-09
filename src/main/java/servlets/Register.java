package servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.User_dao;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class Register
 */
@WebServlet("/Register")
public class Register extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Register() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
//		HttpSession session = request.getSession();
		String d_name = request.getParameter("userDisplayName");
		String email = request.getParameter("email");
		String phone = request.getParameter("phone");
		String uname = request.getParameter("userName");
		String pass = request.getParameter("userPass");
		String role = request.getParameter("role");
		try {
			User_dao userdao = new User_dao();
			boolean has_name = userdao.findUsernameExists(uname);
			if (has_name == true) {
			   JSONObject jsonObject=new JSONObject() ;
		       jsonObject.put("message", "userName already exists");
		       out.write(jsonObject.toString());
			   out.flush();
			   return;
			}
			boolean x = userdao.register(uname,email,phone,d_name,pass,role);
			if (x == true) {
			    JSONObject jsonObject=new JSONObject();
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
