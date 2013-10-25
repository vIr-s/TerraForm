package servlet;

import model.Business;
import model.Search;
import org.dom4j.DocumentException;

import java.io.IOException;
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
        Search search = new Search();
        List<Business> businesses = search.businessSearch("burritos", 30.361471, -87.164326);
        try {
            search.userReviewSearch();
        } catch (DocumentException e) {
            e.printStackTrace();
        }
        out.write("hello heroku".getBytes());
        out.flush();
        out.close();
    }

}