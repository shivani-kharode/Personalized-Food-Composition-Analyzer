<%@ page import="java.io.*,java.util.*, javax.servlet.*"%>
<%@ page import="javax.servlet.http.*"%>
<%@ page import="org.apache.commons.fileupload.*"%>
<%@ page import="org.apache.commons.fileupload.disk.*"%>
<%@ page import="org.apache.commons.fileupload.servlet.*"%>
<%@ page import="org.apache.commons.io.output.*"%>
<%@ page import="java.sql.*" %>


<%!
String fileName;

%>

<%
	File file;
	int maxFileSize = 5000 * 1024;
	int maxMemSize = 5000 * 1024;
	ServletContext context = pageContext.getServletContext();
	String filePath = "\\Images\\";

	// Verify the content type
	String contentType = request.getContentType();
	if ((contentType.indexOf("multipart/form-data") >= 0)) {
   
		 String str1= request.getParameter("keyword");
		 out.println("check value"+str1+"<br/>");
		
		
		
		
		DiskFileItemFactory factory = new DiskFileItemFactory();
		// maximum size that will be stored in memory
		factory.setSizeThreshold(maxMemSize);
		// Location to save data that is larger than maxMemSize.
		factory.setRepository(new File("\\Images\\"));

		// Create a new file upload handler
		ServletFileUpload upload = new ServletFileUpload(factory);
		// maximum file size to be uploaded.
		upload.setSizeMax(maxFileSize);
		try {
			// Parse the request to get file items.
			List fileItems = upload.parseRequest(request);

			// Process the uploaded file items
			Iterator i = fileItems.iterator();
           
			
			
			out.println("<html>");
			out.println("<head>");
			out.println("<title>JSP File upload</title>");
			out.println("</head>");
			out.println("<body>");
			while (i.hasNext()) {
				FileItem fi = (FileItem) i.next();
				if (!fi.isFormField()) {
					// Get the uploaded file parameters
					String fieldName = fi.getFieldName();
					fileName = fi.getName();
					boolean isInMemory = fi.isInMemory();
					long sizeInBytes = fi.getSize();
					String absoluteDiskPath = "";
					
					// Write the file
					if (fileName.lastIndexOf("\\") >= 0) {
						absoluteDiskPath = getServletContext().getRealPath(filePath
								+ fileName.substring(fileName
										.lastIndexOf("\\")));
						out.println("FileName Path ***********"
								+ absoluteDiskPath+"<br/>");
						
					} else {
						absoluteDiskPath = getServletContext().getRealPath(filePath
								+ fileName.substring(fileName
										.lastIndexOf("\\") + 1));
						out.println("FileName Path ***********"
								+ absoluteDiskPath);
						
					}
					file = new File(absoluteDiskPath);
					
					fi.write(file);
					out.println("Uploaded Filename: " + filePath
							+ fileName + "<br>");
					out.println("Relative Path"
							+ file.getAbsolutePath()+"");
					
					String relative = new File(filePath).toURI().relativize(new File(filePath).toURI()).getPath();
					
					out.println("<br/>"+relative);
					
				}
			}
			 	
			//storing data to databasae
			
			try{
				HttpSession hs=request.getSession();
				//hs.setAttribute("pid", request.getParameter("pid"));
				String pid=hs.getAttribute("pid").toString();
				Class.forName("com.mysql.jdbc.Driver");
				Connection con= DriverManager.getConnection("jdbc:mysql://localhost:3306/personalized_food_composition_analyzer","root","root");

					//String keyword=request.getParameter("keyword");
					//String keyworddesc=request.getParameter("keyword_desc");
					PreparedStatement prst=con.prepareStatement("update addproduct set ProductImagePath=? where uid=?");
					prst.setString(1, fileName);
					prst.setString(2,pid);
					prst.executeUpdate();

				   response.sendRedirect("ViewProduct.jsp");
					
				}catch(Exception e){
					out.println(""+e);
				}
           
            
            
			
			out.println("</body>");
			out.println("</html>");
		} catch (Exception ex) {
			System.out.println(ex);
		}
	} else {
		out.println("<html>");
		out.println("<head>");
		out.println("<title>Servlet upload</title>");
		out.println("</head>");
		out.println("<body>");
		out.println("<p>No file uploaded</p>");
		
	
		out.println("</body>");
		out.println("</html>");

	}
%>



