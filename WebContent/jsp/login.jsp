<%@ page contentType="text/html; charset=iso-8859-1" language="java" import="java.sql.*" errorPage=""%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
<title>Untitled Document</title>
<script type="text/javascript">

	function validate() 
	{
		var flag = true;
		var alert = confirm("Do you want to connect to Twitter ?");
		if (alert == true) 
		{
			flag = true;
		} 
		else 
		{
			flag = false;
		}
		return flag;
	}
</script>
</head>

<body>
	<form name="login" action="/twitterservlet" method="get">
		
		<input type="submit" name="login" value="Login" onclick="return validate()"/>
		
	</form>
</body>
</html>
