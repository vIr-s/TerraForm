package servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.Business;
import model.Search;

import org.dom4j.DocumentException;

import terraform.common.Constants.RequestAttrName;

@WebServlet(name = "Suggestions", urlPatterns = { "/suggestions" })
public class SuggestionsServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@SuppressWarnings("unchecked")
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		// ServletOutputStream out = resp.getOutputStream();

		String reqCity = (String) req.getAttribute(RequestAttrName.LOCATION);

		String city = reqCity == null ? "atlanta" : reqCity;
		Search search = new Search(city);
		List<String> fbSearchTerms = (List<String>) req.getAttribute(RequestAttrName.SEARCH_TERM);
		// fbSearchTerms.add("burritos");
		// fbSearchTerms.add("pizza");
		// fbSearchTerms.add("pad thai");
		// fbSearchTerms.add("samosa");
		// fbSearchTerms.add("coffee");
		// fbSearchTerms.add("biryani");
		List<Business> businesses = search.search(fbSearchTerms);
		List<String> userReviewFavorites;
		try {
			userReviewFavorites = search.userReviewFavorites();
			businesses.addAll(search.search(userReviewFavorites));
		} catch (DocumentException e) {
			e.printStackTrace();
		}

		HttpSession session = req.getSession();
		session.setAttribute("businesses", businesses);
		getServletContext().getRequestDispatcher("/suggestions_edit.jsp").forward(req, resp);
		// resp.sendRedirect("/suggestions_edit.jsp");
		// out.write(businesses.get(0).getPicUrl().getBytes());
		// out.flush();
		// out.close();
	}
}