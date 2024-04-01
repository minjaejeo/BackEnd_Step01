package spms.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/member/add")
@SuppressWarnings("serial")
public class MemberAddServlet extends HttpServlet {
	
	@Override
	protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		System.out.println("MemberAddServlet::doPost() 호출");
		
		Connection conn = null;
		/*
		 * Statement
		 * 	- 질의할 때마다 sql을 컴파일한다. 
		 * 	- 입력 매개변수가 여러 개 필요할 때 문자열 결합연산자인 + 를 이용해서 해야한다.(불편)
		 * 	- 전송 직전에 sql문을 입력받고, 컴파일 후, 서버로 전송
		 * 
		 * PrepareStatement
		 * 	- sql문을 미리 입력하여 컴파일한 상태에서 객체를 받는다.
		 * 	- 만약에 sql문 구조가 변경되지 않고, 파라미터값만 바뀌는 경우 Statement보다 훨씬 빠르다.
		 * 	- 입력 매개변수가 여러 개 필요할 때 ? 로 sql의 파라미터를 표시라고, 나중에 전달하므로 편하다.
		 * 	- Statement < PreparedStatement 를 사용한다.
		 */
		PreparedStatement stmt = null;
		
		try {
			ServletContext sc = this.getServletContext();
			conn = DriverManager.getConnection(
						sc.getInitParameter("url"),
						sc.getInitParameter("username"),
						sc.getInitParameter("password")
					);	
			stmt = conn.prepareStatement("INSERT INTO members(email,pwd,mname,cre_date,mod_date)" + 
					" VALUES(?,?,?,NOW(),NOW())");
			stmt.setString(1, req.getParameter("email"));
			stmt.setString(2, req.getParameter("password"));
			stmt.setString(3, req.getParameter("name"));
			stmt.executeUpdate();
			
			resp.setContentType("text/html;charset=UTF-8");
			PrintWriter out = resp.getWriter();
			out.println("<html><head><title>회원등록결과</html></head></title>");
			// 아래와 같은 코드이다. 1초 후에 Refresh
//			out.println("<meta http-equiv='Refresh' content='1;url=list'");
			out.println("<body>");
			out.println("<p>등록 성공입니다.</p>");
			out.println("</body></html>");
			
			resp.sendRedirect("list");
			
		}catch(Exception e) {
			req.setAttribute("error", e);
			RequestDispatcher rd = req.getRequestDispatcher("/Error.jsp");
			rd.forward(req, resp);
		}finally {
			try {if(stmt!=null) stmt.close();} catch(Exception e) {}
			// Connection객체를 1개 생성해서 ServletContext영역에 보관하고
			
			//try {if(conn!=null) conn.close();} catch(Exception e) {}
		}
		
	}
}
