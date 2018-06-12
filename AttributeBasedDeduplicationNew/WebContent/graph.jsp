<!DOCTYPE html>
<%@page import="com.source.GlobalFunction"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="com.util.DbConnection"%>
<%@page import="java.sql.Connection"%>
<html>
  <head>
    <title>ABD</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
   
    <link href="css/bootstrap.min.css" rel="stylesheet">
    
   
    <link href='http://fonts.googleapis.com/css?family=Duru+Sans|Actor' rel='stylesheet' type='text/css'>
    
   
    <link href="css/bootshape.css" rel="stylesheet">

     </head>
  <body>
  <%
		if (request.getParameter("upload") != null) {
			out.print("<script>alert('File Upload Successfully')</script>");
		}
if (request.getParameter("dedup") != null) {
	out.print("<script>alert('File Duplicated')</script>");
}
	%>
    <!-- Navigation bar -->
    <div class="navbar navbar-default navbar-fixed-top" role="navigation">
      <div class="container">
        <div class="navbar-header">
          <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
            <span class="sr-only">Toggle navigation</span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </button>
          <a class="navbar-brand" href="#"><span class="green"><%@include file="logo.jsp"%></span></a>
        </div>
        <nav role="navigation" class="collapse navbar-collapse navbar-right">
          <ul class="navbar-nav nav">
            <li><a href="home.jsp">Home</a></li>
           <li><a href="uploadfile.jsp">Upload</a></li>
            <li><a href="download.jsp">Download</a></li>
            <li  class="active"><a href="graph.jsp">Graph</a></li>
             <li><a href="profile.jsp">My Profile</a></li>
             <li><a href="index.jsp?logout">Logout</a></li>
            </ul>
        </nav>
      </div>
    </div><!-- End Navigation bar -->

    <!-- Slide gallery -->
    <div class="jumbotron">
      <div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
        <!-- Indicators -->
        <ol class="carousel-indicators">
          <li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
          <li data-target="#carousel-example-generic" data-slide-to="1"></li>
          <li data-target="#carousel-example-generic" data-slide-to="2"></li>
        </ol>
        <!-- Wrapper for slides -->
        <div class="carousel-inner">
          <div class="item active">
            <img src="img/carousel1.jpg" style="height:400px; width:1520px;" alt="">
            <div class="carousel-caption">
            </div>
          </div>
          <div class="item">
            <img src="img/carousel2.jpg" style="height:400px; width:1520px;" alt="">
            <div class="carousel-caption">
            </div>
          </div>
          <div class="item">
            <img src="img/carousel3.jpg" style="height:400px; width:1520px;" alt="">
            <div class="carousel-caption">
            </div>
          </div>
        </div>
        <!-- Controls -->
        <a class="left carousel-control" href="#carousel-example-generic" data-slide="prev">
          <span class="glyphicon glyphicon-chevron-left"></span>
        </a>
        <a class="right carousel-control" href="#carousel-example-generic" data-slide="next">
          <span class="glyphicon glyphicon-chevron-right"></span>
        </a>
      </div>
    </div><!-- End Slide gallery -->
    <div id="featured">
			<div class="container">
				<div class="row">
					<div class="12u">
						<section>
							
							<div align="center">
							
							<font style="color: black; font-size: 20px">Download
				File</font> <br /> <br /> <br />
			
	
	<table border="1">
	<tr style="font-weight: bold;">
	<td>Srno</td>
	<td>Filename</td>
	<td>Upload Graph</td>
	<td>Download Graph</td>

	</tr>
	<%
	GlobalFunction GF = new GlobalFunction();
	int srno=1;
	String userid = session.getAttribute("userid").toString();
	System.out.println(userid);
	Connection con = DbConnection.getConnection();
	PreparedStatement  ps = con.prepareStatement("select * from files where userid=?");
	ps.setString(1, userid);
	ResultSet rs = ps.executeQuery();
	while(rs.next())
	{
		String fname = GF.getFname(rs.getString("userid"));
		String lname = GF.getLname(rs.getString("userid"));
		String filename = rs.getString("file_name");
		String email = rs.getString("uplaod_by");
		String file_id=rs.getString("file_id");
		
		
		%>
		<tr>
		<td><%=srno++ %></td>
		
		<td><%=filename %></td>
		<td><a style="color: blue;" href="graphUpload.jsp?file_id=<%=file_id%>">Upload Graph</a></td>
		<td><a style="color: blue;" href="graphDownload.jsp?file_id=<%=file_id%>">Download Graph</a></td>
		<%
	}
	
	%>
	</tr>
	
	<%
	PreparedStatement ps1 = con.prepareStatement("select * from dedup_data where userid=?");
	ps1.setString(1, userid);
	ResultSet rs1 = ps1.executeQuery();
	while(rs1.next())
	{
		String fname = GF.getFname(rs1.getString("userid"));
		String lname = GF.getLname(rs1.getString("userid"));
		String filename = rs1.getString("filename");
		String email = GF.getEmail(rs1.getString("userid"));
		String file_id=rs.getString("file_id");
		%>
		<tr>
		<td><%=srno++ %></td>
		
		<td><%=filename %></td>
		<td><a href="graphUpload.jsp?file_id=<%=file_id%>">Upload Graph</a></td>
		<td><a href="graphDownload.jsp?file_id=<%=file_id%>">Download Graph</a></td>
		
		<%
	}
	
	%>
	</tr>
	
	
	</table>


<br></br>
<br></br>
	
							</div>
							
							
							
								
						</section>
					</div>		
				</div>
			</div>
		</div>
    <!-- Thumbnails -->
       <!-- Content -->
   

    <!-- jQuery (necessary for Bootstrap's JavaScript plugins) -->
    <script src="https://code.jquery.com/jquery.js"></script>
    <!-- Include all compiled plugins (below), or include individual files as needed -->
    <script src="js/bootstrap.min.js"></script>
    <script src="js/bootshape.js"></script>
  <%@include file="footer.jsp"%></body>
</html>