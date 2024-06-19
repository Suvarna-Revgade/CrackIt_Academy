<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.ByteArrayInputStream" %>
<%@ page import="java.net.URLEncoder" %>

<%@ page import="java.sql.*" %>
<%@ page import="com.file" %>
<%@ page import="com.DB.fileDAO" %>
<%@ page contentType="application/octet-stream" %>

<%
    String idParam = request.getParameter("id");
  if (idParam != null && !idParam.isEmpty()) 
    { 
    	 int fileId = Integer.parseInt(idParam);
        fileDAO fDAO = new fileDAO();
         file f =fDAO.getFileById(fileId);

            if (f != null && f.getFiledata() != null) { 
            String encodedFileName = URLEncoder.encode(f.getFilename(), "UTF-8");
            response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\"");
            response.setContentType("application/pdf");
            /* try (OutputStream out1 = response.getOutputStream()) {
                out1.write(f.getFiledata()); */
                try (ByteArrayInputStream bis = new ByteArrayInputStream(f.getFiledata());
                		OutputStream   out1 = response.getOutputStream()) {

                       byte[] buffer = new byte[4096];
                       int bytesRead;
                       while ((bytesRead = bis.read(buffer)) != -1) {
                           out1.write(buffer, 0, bytesRead);

                       }
                       

                } catch (Exception e) {
                    e.printStackTrace();
                }
            }
        }
        /* if (idParam != null && !idParam.isEmpty()) 
        { 
        	 int fileId = Integer.parseInt(idParam);
            fileDAO fDAO = new fileDAO();
             file f =fDAO.getFileById(fileId);

                if (f != null && f.getFiledata() != null) { 
                String encodedFileName = URLEncoder.encode(f.getFilename(), "UTF-8");
                response.setHeader("Content-Disposition", "attachment; filename=\"" + encodedFileName + "\"");
                response.setContentType("application/pdf");
                
                    try (ByteArrayInputStream bis = new ByteArrayInputStream(f.getFiledata());
                    		OutputStream   out11 = response.getOutputStream()) {

                           byte[] buffer = new byte[4096];
                           int bytesRead;
                           while ((bytesRead = bis.read(buffer)) != -1) {
                               out11.write(buffer, 0, bytesRead);

                           }
                           

                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            } */
%>
