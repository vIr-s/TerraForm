package servlet;

import model.Business;
import model.Search;
import org.dom4j.DocumentException;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(
        name = "Suggestions",
        urlPatterns = {"/suggestions"}
)
public class SuggestionsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        ServletOutputStream out = resp.getOutputStream();
        String city = "atlanta";
        Search search = new Search(city);
        List<String> fbSearchTerms = new ArrayList<String>();
        fbSearchTerms.add("burritos");
        List<Business> businesses = search.search(fbSearchTerms);
        List<String> userReviewFavorites;
        try {
             userReviewFavorites = search.userReviewFavorites();
             businesses.addAll(search.search(userReviewFavorites));
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        out.write("hello heroku".getBytes());
        out.flush();
        out.close();
    }

}