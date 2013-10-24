package servlet;

import model.Search;
import org.dom4j.DocumentException;

import java.io.IOException;

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
        search.businessSearch("", 0, 0);
        try {
            search.userReviewSearch();
        } catch (DocumentException e) {
            e.printStackTrace();
        }

        out.flush();
        out.close();
    }

}