<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>전시 편집</title>
<style>
.text-truncate {
	display: -webkit-box !important;
	-webkit-line-clamp: 3;
	-webkit-box-orient: vertical;
	white-space: normal;
}
</style>
<script type="text/javascript">
	function deleteConfirm(id) {
		if (confirm("해당 전시를 삭제합니다.") == true)
			location.href = "./deleteExhibit.jsp?id=" + id;
		else
			return;
	}
</script>
<%
	String edit = request.getParameter("edit");
%>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">전시 편집</h1>
		</div>
	</div>
	<div class="container">
		<div class="row" align="center">
			<%@ include file="dbconn.jsp"%>
			<%
				PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from exhibit";
			pstmt = conn.prepareStatement(sql);
			rs = pstmt.executeQuery();
			while (rs.next()) {
			%>
			<div class="col-md-4">
				<img src="./resources/images/<%=rs.getString("e_fileName")%>"
					style="width: 100%">
				<h3><%=rs.getString("e_author")%> : <%=rs.getString("e_title")%></h3>
				<p class="text-truncate"><%=rs.getString("e_description")%>
				<p>
					<%
						if (edit.equals("update")) {
					%>
					<a href="./updateExhibit.jsp?id=<%=rs.getString("e_id")%>"
						class="btn btn-success">수정 &raquo;</a>
					<%
						} else if (edit.equals("delete")) {
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("e_id")%>')"
						class="btn btn-danger" role="button">삭제 &raquo;</a>
					<%
						}
					%>
				
			</div>
			<%
				}
			if (rs != null)
			rs.close();
			if (pstmt != null)
			pstmt.close();
			if (conn != null)
			conn.close();
			%>
		</div>
		<hr>
	</div>
	<jsp:include page="footer.jsp" />
</body>
</html>