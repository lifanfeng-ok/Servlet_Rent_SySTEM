package back_servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.Collect_dao;
import dao.Comment_dao;
import entity.User;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class Mark_delete
 */
@WebServlet("/Mark_delete")
public class Mark_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Mark_delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String houseid = request.getParameter("id");	
		HttpSession session = request.getSession(false);
		User user =(User)session.getAttribute("user");
		Long id = user.getId();
		try {
			Long id2 = Long.valueOf(houseid);
			Long user_id = id;
			Collect_dao c_dao = new Collect_dao();			
			boolean is_del = c_dao.delete(user_id,id2);
			if (is_del) {
				 JSONObject jsonObject=new JSONObject() ;
				 jsonObject.put("status", 1);
			     jsonObject.put("message", "Cancel Successfully");
				 out.write(jsonObject.toString());
				 out.flush();  
				 return;
			} else {
				 JSONObject jsonObject=new JSONObject() ;
				 jsonObject.put("status", 0);
			     jsonObject.put("message", "Cancel Failed");
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
