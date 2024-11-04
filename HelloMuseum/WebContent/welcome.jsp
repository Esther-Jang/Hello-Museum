<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<link rel="stylesheet"
	href="./resources/css/bootstrap.min.css">
<title>Welcome</title>
</head>
<body>
	<%@ include file="menu.jsp"%>
	<%!String greeting = "경기대 소성박물관 온라인 전시";
	String tagline = "Welcome to Museum!";%>
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
				<b><%=greeting%></b>
			</h1>
		</div>
	</div>
	<main role="main">
		<div class="container">
			<div class="text-center">
				<h5>
					<%=tagline%>
				</h5>
			</div>
			<hr>
		</div>
	</main>
	<%@ include file="footer.jsp"%>
</body>
</html>