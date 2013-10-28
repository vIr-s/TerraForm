package servlet;

import java.io.IOException;
import java.util.UUID;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import terraform.common.Constants.CookieName;
import terraform.common.Constants.FB.ParamName;
import terraform.common.FBApiHelper;
import terraform.common.TokenStore;

@WebServlet(name = "LoginServlet", urlPatterns = { "/login" })
public class LoginServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String code = req.getParameter(ParamName.CODE);
		if (code == null) {
			System.out.println("No code. Redirecting to home page.");
			resp.sendRedirect("/");
			return;
		}

		String userToken = FBApiHelper.getUserToken(code);

		if (userToken.equalsIgnoreCase("null")) {
			ServletOutputStream out = resp.getOutputStream();
			out.write("Error during authorization".getBytes());
			out.flush();
			out.close();
		} else {
			String id = UUID.randomUUID().toString();

			TokenStore.addToken(id, userToken);
			Cookie cookie = new Cookie(CookieName.ID, id);
			resp.addCookie(cookie);

			resp.sendRedirect("main");
		}
	}
}