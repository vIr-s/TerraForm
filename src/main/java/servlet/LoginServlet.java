package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import terraform.common.Constants.FB.ParamName;
import terraform.common.FBApiHelper;

import com.restfb.DefaultFacebookClient;
import com.restfb.Facebook;
import com.restfb.FacebookClient;

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

		ServletOutputStream out = resp.getOutputStream();
		String userToken = FBApiHelper.getUserToken(code);

		if (userToken.equalsIgnoreCase("null")) {
			out.write("Error during authorization".getBytes());
			out.flush();
			out.close();
		} else {
			// FBApiHelper.getUserLikes(userToken);

			FacebookClient facebookClient = new DefaultFacebookClient(userToken);

			String query = "SELECT name,type FROM page WHERE page_id IN (SELECT page_id FROM page_fan WHERE uid=me() )";
			List<UserLike> userLikes = facebookClient.executeFqlQuery(query,
					UserLike.class);
			System.out.println(userLikes);

			resp.sendRedirect("main.jsp");
			return;
		}
	}

	public static class UserLike {
		@Facebook
		String type;

		@Facebook
		String name;

		@Override
		public String toString() {
			return String.format("%s (%s)", name, type);
		}
	}
}