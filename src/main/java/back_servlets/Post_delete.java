package back_servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Comment_dao;
import dao.Post_dao;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class Post_delete
 */
@WebServlet("/Post_delete")
public class Post_delete extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Post_delete() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");	
		try {
			Long id2 = Long.valueOf(id);
			Post_dao c_dao = new Post_dao();			
			boolean is_del = c_dao.delete(id2);
			if (is_del) {
				 JSONObject jsonObject=new JSONObject() ;
				 jsonObject.put("status", 1);
			     jsonObject.put("message", "Delete Successfully");
				 out.write(jsonObject.toString());
				 out.flush();  
				 return;
			} else {
				 JSONObject jsonObject=new JSONObject() ;
				 jsonObject.put("status", 0);
			     jsonObject.put("message", "Delete Failed");
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
