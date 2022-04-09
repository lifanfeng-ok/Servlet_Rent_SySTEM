package back_servlets;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import dao.Announcements_dao;
import net.sf.json.JSONObject;

/**
 * Servlet implementation class Annouc_submit
 */
@WebServlet("/Annouc_submit")
public class Annouc_submit extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Annouc_submit() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		System.out.print(id);
		String title = request.getParameter("title");
		String summary = request.getParameter("summary");
		String content = request.getParameter("content");
		Announcements_dao ac_dao;
		try {
			ac_dao = new Announcements_dao();
			if (id.equals("")) {
				boolean is_add = ac_dao.add(title,summary,content);
				if (is_add) {
					 JSONObject jsonObject=new JSONObject() ;
					 jsonObject.put("status", 1);
				     jsonObject.put("message", "Published Successfully");
					 out.write(jsonObject.toString());
					 out.flush();  
					 return;
				} else {
					 JSONObject jsonObject=new JSONObject() ;
					 jsonObject.put("status", 0);
				     jsonObject.put("message", "Published Failed");
					 out.write(jsonObject.toString());
					 out.flush();  
					 return;
				}
			}	else {			
			    Long id2 = Long.valueOf(id);
			    boolean is_update = ac_dao.update(id2,title,summary,content);
			    if (is_update) {
					 JSONObject jsonObject=new JSONObject() ;
					 jsonObject.put("status", 2);
				     jsonObject.put("message", "Updated Successfully");
					 out.write(jsonObject.toString());
					 out.flush();  
					 return;
				} else {
					 JSONObject jsonObject=new JSONObject() ;
					 jsonObject.put("status", 3);
				     jsonObject.put("message", "Updated Failed");
					 out.write(jsonObject.toString());
					 out.flush();  
					 return;
				}
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
