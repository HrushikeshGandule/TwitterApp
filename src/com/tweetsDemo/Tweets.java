package com.tweetsDemo;

import java.io.IOException;
import java.net.URL;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import twitter4j.*;
import twitter4j.auth.RequestToken;

public class Tweets extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		try {
			Twitter twitter = (Twitter) request.getSession().getAttribute(
					"twitter");
			RequestToken requestToken = (RequestToken) request.getSession()
					.getAttribute("requestToken");
			String verifier = request.getParameter("oauth_verifier");

			request.getSession().setAttribute("oauthVerifier", verifier);
			String newVerifier = request.getSession()
					.getAttribute("oauthVerifier").toString();

			twitter.getOAuthAccessToken(requestToken, newVerifier);

			response.getWriter().print(
					twitter.getUserTimeline().get(0).getText());

			request.getSession().setAttribute("timeline",
					twitter.getUserTimeline().get(0).getText());
			request.getSession().setAttribute("twitter", twitter);
			User user = twitter.showUser(twitter.getId());
			request.getSession().setAttribute("user", user);
			URL url = user.getProfileImageURL();
			request.getSession().setAttribute("twitterImage", url.toString());

			response.sendRedirect("jsp/tweets.jsp");
		} catch (TwitterException e) {
			throw new ServletException(e);
		}
	}
}
