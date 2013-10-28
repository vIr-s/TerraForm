package terraform.common;

import javax.servlet.http.HttpServletRequest;

public class URLHelper {
	public static String getRedirectURL(HttpServletRequest req, String redirectTo) {
		StringBuilder redirectURL = new StringBuilder();

		if ("localhost".equalsIgnoreCase(req.getServerName())) {
			redirectURL.append(redirectTo);
		} else {
			redirectURL.append("https");
			redirectURL.append("://");
			redirectURL.append(req.getServerName());
			redirectURL.append("/");
			redirectURL.append(redirectTo);
		}

		return redirectURL.toString();
	}
}
