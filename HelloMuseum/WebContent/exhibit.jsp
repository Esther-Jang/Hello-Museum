<%@page import="java.lang.ProcessBuilder.Redirect"%>
<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<%@ page errorPage="exceptionNoExhibitId.jsp"%>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>전시 정보</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">전시 정보</h1>
		</div>
	</div>
	<%@ include file="dbconn.jsp"%>
	<%
		String eId = request.getParameter("id");

	PreparedStatement pstmt = null;
	ResultSet rs = null;

	String sql = "select * from exhibit where e_id=?";
	pstmt = conn.prepareStatement(sql);
	pstmt.setString(1, eId);
	rs = pstmt.executeQuery();
	if (rs.next()) {
	%>
	<div class="container">
		<div class="row">
			<div class="col-md-4">
				<img src="./resources/images/<%=rs.getString("e_fileName")%>"
					style="width: 100%" />
			</div>
			<div class="col-md-8">
				<h4>
					<%=rs.getString("e_title")%></h4>
				<p><%=rs.getString("e_description")%>
				<p>
					<b>전시 번호 : </b><span class="badge badge-danger"><%=rs.getString("e_id")%></span>
				<p>
					<b>작가</b> :
					<%=rs.getString("e_author")%>
				<p>
					<b>전시 기간</b> :
					<%=rs.getString("e_openDate")%>
					~
					<%=rs.getString("e_closeDate")%>
				<p>
					<a href="<%=rs.getString("e_url")%>" class="btn btn-info">전시 관람
						&raquo;</a> <a href="./exhibits.jsp" class="btn btn-secondary">전시
						목록 &raquo;</a>
			</div>
		</div>
	</div>
	<%
		} else {
	throw new Exception();
	}
	if (rs != null)
	rs.close();
	if (pstmt != null)
	pstmt.close();
	if (conn != null)
	conn.close();
	%>
	<hr>
	<jsp:include page="footer.jsp" />
</body>
</html>