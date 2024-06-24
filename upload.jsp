<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.io.*, javax.servlet.http.*, javax.servlet.annotation.*, java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>File Upload</title>
</head>
<body>
<h2>File Upload Form</h2>
<form action="upload.jsp" method="post" enctype="multipart/form-data">
<input type="file" name="file" required>
<button type="submit">Upload</button>
</form>
<%
if ("POST".equalsIgnoreCase(request.getMethod())) {
// 파일 업로드 처리
 try {
Part filePart = request.getPart("file"); // form의 name 속성값과 일치해야 함
String fileName = filePart.getSubmittedFileName();
String uploadPath = application.getRealPath("") + File.separator + "uploads";
File uploadDir = new File(uploadPath);
if (!uploadDir.exists()) uploadDir.mkdirs();
File uploadedFile = new File(uploadDir, fileName);
try (InputStream fileContent = filePart.getInputStream();
OutputStream fileOut = new FileOutputStream(uploadedFile)) {
byte[] buffer = new byte[1024];
int bytesRead;
while ((bytesRead = fileContent.read(buffer)) != -1) {
fileOut.write(buffer, 0, bytesRead);
}
}
out.println("File uploaded to: " + uploadedFile.getAbsolutePath());
} catch (Exception e) {
e.printStackTrace(new PrintWriter(out));
out.println("File upload failed: " + e.getMessage());
}
}
%>
</body>
</html>