<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	String path = request.getRealPath("./resources/images");
int maxSize = 5 * 1024 * 1024;
String encType = "utf-8";

MultipartRequest multi = new MultipartRequest(request, path, maxSize, encType, new DefaultFileRenamePolicy());

String eId = multi.getParameter("exhibitId");
String title = multi.getParameter("title");
String author = multi.getParameter("author");
String openDate = multi.getParameter("openDate");
String closeDate = multi.getParameter("closeDate");
String description = multi.getParameter("description");
String url = multi.getParameter("url");

Enumeration files = multi.getFileNames();
String fname = (String) files.nextElement();
String fileName = multi.getFilesystemName(fname);

PreparedStatement pstmt = null;
ResultSet rs = null;

String sql = "select * from exhibit where e_id=?";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, eId);
rs = pstmt.executeQuery();
if (rs.next()) {
	if (fileName != null) {
		sql = "update exhibit set e_title=?, e_author=?, e_description=?, e_url=?, e_openDate=?, e_closeDate=?, e_filename=? where e_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, author);
		pstmt.setString(3, description);
		pstmt.setString(4, url);
		pstmt.setString(5, openDate);
		pstmt.setString(6, closeDate);
		pstmt.setString(7, fileName);
		pstmt.setString(8, eId);
		pstmt.executeUpdate();
	} else {
		sql = "update exhibit set e_title=?, e_author=?, e_description=?, e_url=?, e_openDate=?, e_closeDate=? where e_id=?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, title);
		pstmt.setString(2, author);
		pstmt.setString(3, description);
		pstmt.setString(4, url);
		pstmt.setString(5, openDate);
		pstmt.setString(6, closeDate);
		pstmt.setString(7, eId);
		pstmt.executeUpdate();
	}
}
if (rs != null)
	rs.close();
if (pstmt != null)
	pstmt.close();
if (conn != null)
	pstmt.close();

response.sendRedirect("editExhibit.jsp?edit=update");
%>
