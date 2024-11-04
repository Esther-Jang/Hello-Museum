<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>전시 수정</title>
</head>
<body>
	<jsp:include page="menu.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">전시 수정</h1>
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
					style="width: 100%" alt="image">
			</div>
			<div class="col-md-7">
				<form name="newExhibit" action="./processUpdateExhibit.jsp"
					class="form-horizontal" method="post" enctype="multipart/form-data">
					<div class="form-group row">
						<label class="col-sm-2">전시 번호</label>
						<div class="col-sm">
							<input type="text" id="exhibitId" name="exhibitId"
								class="form-control" value='<%=rs.getString("e_id")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">전시명</label>
						<div class="col-sm">
							<input type="text" id="title" name="title" class="form-control"
								value='<%=rs.getString("e_title")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">작가</label>
						<div class="col-sm">
							<input type="text" id="author" name="author" class="form-control"
								value='<%=rs.getString("e_author")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">URL</label>
						<div class="col-sm">
							<input type="text" id="url" name="url" class="form-control"
								value='<%=rs.getString("e_url")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">전시 오픈일</label>
						<div class="col-sm">
							<input type="text" id="openDate" name="openDate"
								class="form-control" value='<%=rs.getString("e_openDate")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">전시 마감일</label>
						<div class="col-sm">
							<input type="text" id="closeDate" name="closeDate"
								class="form-control" value='<%=rs.getString("e_closeDate")%>'>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">설명</label>
						<div class="col-sm">
							<textarea id="description" name="description" cols="50" rows="2"
								class="form-control"><%=rs.getString("e_description")%></textarea>
						</div>
					</div>
					<div class="form-group row">
						<label class="col-sm-2">이미지</label>
						<div class="col-sm">
							<input type="file" id="exhibitImg" name="exhibitImg"
								class="form-control" value='<%=rs.getString("e_filename")%>'>
						</div>
					</div>
					<div class="form-group row">
						<div class="col-sm-offset-2 col-sm-10">
							<input type="submit" class="btn btn-primary" value="등록">
						</div>
					</div>
				</form>
			</div>
		</div>
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

	<jsp:include page="footer.jsp" />
</body>
</html>