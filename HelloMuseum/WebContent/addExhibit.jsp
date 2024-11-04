<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<title>도서 등록</title>
</head>
<script type="text/javascript" src="./resources/js/validation.js"></script>
<body>
	<fmt:setLocale value='<%=request.getParameter("language")%>' />
	<fmt:bundle basename="bundle.message">
		<jsp:include page="menu.jsp" />
		<div class="jumbotron">
			<div class="container">
				<h1 class="display-3">
					<fmt:message key="title" />
				</h1>
			</div>
		</div>
		<div class="container">
			<div class="text-right">
				<a href="?language=ko">Korean</a>|<a href="?language=en">English</a>
				<a href="logout.jsp" class="btn-sm btn-success pull-right">logout</a>
			</div>
			<form action="processAddExhibit.jsp" method="post"
				class="form-horizontal" name="newExhibit" enctype="multipart/form-data">
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="exhibitId" /></label>
					<div class="col-sm-3">
						<input type="text" name="exhibitId" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="name" /></label>
					<div class="col-sm-3">
						<input type="text" name="title" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="author" /></label>
					<div class="col-sm-3">
						<input type="text" name="author" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="url" /></label>
					<div class="col-sm-3">
						<input type="text" name="url" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="openDate" /></label>
					<div class="col-sm-3">
						<input type="text" name="openDate" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="closeDate" /></label>
					<div class="col-sm-3">
						<input type="text" name="closeDate" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="description" /></label>
					<div class="col-sm-5">
						<textarea name="description" cols="50" rows="2"
							class="form-control"></textarea>
					</div>
				</div>
				<div class="form-group row">
					<label class="col-sm-2"><fmt:message key="exhibitImage" /></label>
					<div class="col-sm-5">
						<input type="file" name="exhibitImg" class="form-control">
					</div>
				</div>
				<div class="form-group row">
					<div class="col-sm-10 col-sm-offset-2">
						<input type="button" class="btn btn-primary"
							value="<fmt:message key="button"/>" onclick="check()">
					</div>
				</div>
			</form>
		</div>
		<jsp:include page="footer.jsp" />
	</fmt:bundle>
</body>
</html>