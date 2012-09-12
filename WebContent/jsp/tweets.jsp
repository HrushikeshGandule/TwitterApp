<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
	<%@page import="twitter4j.Twitter"%>
		<%@page import="twitter4j.User"%>
		<%@page import="twitter4j.IDs"%>
	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Twitter Application</title>
</head>
<body>
<hr>
Profile Image<br>
<img id="image" src="<%=(String)request.getSession().getAttribute("twitterImage")%>">
<hr>
	<%
	Twitter twitter = (Twitter)request.getSession().getAttribute("twitter");
	User user=	(User)request.getSession().getAttribute("user");	
	%>
		
	<div>Followers : <%=user.getFollowersCount() %></div>
	<div>Following : <%=user.getFriendsCount() %></div>
<hr>
	Last five tweets :
<br><br>
	<%for(int i=0;i<5;i++)
	    {%>
		<div><%=twitter.getUserTimeline().get(i).getText()%></div>
	<%} %>	
<hr>	
</body>
</html>