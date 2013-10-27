package servlet;

import java.io.IOException;
import java.util.Properties;
import java.util.Set;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PropServlet", urlPatterns = { "/prop" })
public class PropServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		String msg;

		ServletOutputStream out = resp.getOutputStream();

		try {
			Properties prop = new Properties();
			prop.load(getClass().getResourceAsStream("/config/env.properties"));

			StringBuilder res = new StringBuilder();
			Set<Object> keySet = prop.keySet();
			for (Object key : keySet) {
				if (res.length() > 0) {
					res.append(",");
				}
				res.append("'");
				res.append(key);
				res.append("'");
				res.append(":");
				res.append("'");
				res.append(prop.getProperty((String) key));
				res.append("'");
			}

			msg = "{" + res.toString() + "}";
		} catch (Exception e) {
			msg = "{}";
			e.printStackTrace();
		}

		out.write(msg.getBytes());
		out.flush();
		out.close();
	}
}