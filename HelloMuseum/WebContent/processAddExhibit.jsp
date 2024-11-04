<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="com.oreilly.servlet.*"%>
<%@ page import="com.oreilly.servlet.multipart.*"%>
<%@ page import="java.util.*"%>
<%@ page import="java.sql.*"%>
<%@ include file="dbconn.jsp"%>
<%
	request.setCharacterEncoding("utf-8");

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
String filename = multi.getFilesystemName(fname);

PreparedStatement pstmt = null;
String sql = "insert into exhibit values(?,?,?,?,?,?,?,?)";
pstmt = conn.prepareStatement(sql);
pstmt.setString(1, eId);
pstmt.setString(2, title);
pstmt.setString(3, author);
pstmt.setString(4, description);
pstmt.setString(5, url);
pstmt.setString(6, openDate);
pstmt.setString(7, closeDate);
pstmt.setString(8, filename);
pstmt.executeUpdate();

if (pstmt != null)
	pstmt.close();
if (conn != null)
	pstmt.close();

response.sendRedirect("exhibits.jsp");
%>
