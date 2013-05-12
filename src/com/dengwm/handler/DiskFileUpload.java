package com.dengwm.handler;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.*;
import java.util.*;
import org.apache.commons.fileupload.*;
import org.apache.commons.beanutils.*;
public class DiskFileUpload
    extends HttpServlet {
  private static final String CONTENT_TYPE = "text/html; charset=GBK";

  //Initialize global variables
  public void init() throws ServletException {

  }

  //Process the HTTP Get request
  public void doPost(HttpServletRequest request, HttpServletResponse response) throws
      ServletException, IOException {
     response.setContentType(CONTENT_TYPE);
  try{
      System.out.println("start----------------------");
    org.apache.commons.fileupload.DiskFileUpload fu=new org.apache.commons.fileupload.DiskFileUpload();
    fu.setSizeMax(1000000);
    fu.setSizeThreshold(1096);
    fu.setRepositoryPath("c:\\");
    if(request!=null)
   {
     List<?> fileItems=fu.parseRequest(request);
     System.out.println("to here-----------------");
     Iterator<?> i = fileItems.iterator();
     Hashtable<String, String> ht = new Hashtable<String, String>();
     InputStream in = null;
     int size = 0;
     while (i.hasNext()) {
       FileItem fi = (FileItem) i.next();
       if (fi.isFormField()) {
         ht.put(fi.getFieldName(), fi.getString());
         System.out.println("" + fi.getFieldName() + ":" + fi.getString());
       }
       else {
         in = fi.getInputStream();
         size = (int) fi.getSize();
         if (in != null && size > 0) {
           ht.put("filetype", fi.getContentType());
           System.out.println("filetype:" + fi.getContentType());
           ht.put("filename", fi.getName());
           System.out.println("filename:" + fi.getName());
         }
       }
     }
   }
  }catch(Exception e){
    e.printStackTrace(System.err);
  }
  }
  public void doGet(HttpServletRequest request, HttpServletResponse response) throws
      ServletException, IOException {
    doPost(request,response);
  }
  //Clean up resources
  public void destroy() {
  }
}

