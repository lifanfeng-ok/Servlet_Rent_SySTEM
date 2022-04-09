package back_servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import entity.Comment;
import entity.Notice;
import dao.Announcements_dao;

/**
 * Servlet implementation class Annouc_publish
 */
@WebServlet("/Annouc_publish")
public class Annouc_publish extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public Annouc_publish() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");	
		Announcements_dao ac_dao;
		try {
		   if (id != null) {
			Long id2 = Long.valueOf(id);
			ac_dao = new Announcements_dao();
			Notice notice = ac_dao.findById(id2);
			request.setAttribute("news", notice);
			request.setAttribute("tab", "announc-list");
		   } else {
			   request.setAttribute("news", null); 
			   request.setAttribute("tab", "announc-list");
		   }
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}		
		request.getRequestDispatcher("/Jsp/back-end/anc_publish.jsp").forward(request, response); 
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
