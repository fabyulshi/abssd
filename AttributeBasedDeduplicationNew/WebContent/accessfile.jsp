<!DOCTYPE html>
<%@page import="com.util.Test"%>
<%@page import="com.source.DateDifference"%>
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
            <li><a href="home.jsp" class="active">Home</a></li>
				
				<li  class="active"><a href="accessfile.jsp">Access Files</a></li>
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
							
							<font style="color: black; font-size: 20px">Access
				Files</font> <br /> <br /> <br />
			
	

				<table border="0">
			
			<tr align="center">
			<th>Sr. No.</th>
			<th>Filename</th>
			<th>Upload By</th>
			<th>Upload Date</th>
			<th>Last Date</th>
			<th>Operation</th>
			</tr>
			
			<%
			String filename="",uplaod_by="",lsdate="",update="",ffl_id="";
			Connection con = DbConnection.getConnection();
			String privileges=session.getAttribute("privileges").toString();
			String userid = session.getAttribute("userid").toString();
			PreparedStatement ps=con.prepareStatement("select * from files where not userid=?");
			ps.setString(1, userid);
			ResultSet rs=ps.executeQuery();
			String file_id="",in_file_id="";
			int sr_no=1;
			while(rs.next())
			{
				System.out.println("1");
				
				file_id=rs.getString("file_id");
				lsdate=rs.getString("last_date");//last date
				update=rs.getString("upload_date");// first date
				System.out.println("file id Is "+file_id);
				
				System.out.println(" user Is "+privileges);
				
				
				PreparedStatement ps2=con.prepareStatement("SELECT * FROM `fileaccess` where file_id='"+file_id+"' AND privileges='"+privileges+"'");
				ResultSet rs2=ps2.executeQuery();
				while(rs2.next())
				{
					System.out.println(" found ");
					
					
					uplaod_by=rs.getString("uplaod_by");
					lsdate=rs.getString("last_date");
					update=rs.getString("upload_date");
					filename=rs.getString("file_name");
					ffl_id=rs.getString("file_id");
					
					//long diff = DateDifference.getDateDifference(update, lsdate);
					int flag = Test.dateDiffernce(lsdate, lsdate);
					//System.out.println("Diff1 = "+diff);
					//if(diff>=0){
						if(flag>=0){
					%>
					<tr align="center">
					
					<td><%=sr_no++ %></td>
					<td><%=filename %></td>
					<td><%=uplaod_by %></td>
					<td><%=update %></td>
					<td><%= lsdate%></td>
					<td><a href="Download?filename=<%=filename %>">Download</a></td>
					
					</tr>
					
					
					
					
									
					<%
					}
				}
			}
			
			
			
			%>
			
			
			<%
			String filename3="",uplaod_by3="",lsdate3="",update3="",ffl_id3="";
			PreparedStatement ps3=con.prepareStatement("select * from dedup_data where not userid=?");
			ps3.setString(1, userid);
			ResultSet rs3=ps3.executeQuery();
			String file_id3="",in_file_id3="";
			
			while(rs3.next())
			{
				System.out.println("1");
				
				file_id3=rs3.getString("id");
				lsdate3=rs3.getString("last_date");//last date
				update3=rs3.getString("upload_date");// first date
				
				
				PreparedStatement ps4=con.prepareStatement("SELECT * FROM `fileaccess` where dedup_id='"+file_id+"' AND privileges='"+privileges+"'");
				ResultSet rs4=ps4.executeQuery();
				while(rs4.next())
				{
					
					uplaod_by3=rs3.getString("uplaod_by");
					lsdate3=rs3.getString("last_date");
					update3=rs3.getString("upload_date");
					filename3=rs3.getString("file_name");
					ffl_id3=rs3.getString("file_id");
					
					//long diff3 = DateDifference.getDateDifference(update3, lsdate3);
					int flag = Test.dateDiffernce(lsdate, lsdate);
					//System.out.println("Diff2 = "+diff3);
					//if(diff3>=0){
						if(flag>=0){
					%>
					<tr align="center">
					
					<td><%=sr_no++ %></td>
					<td><%=filename3 %></td>
					<td><%=uplaod_by3 %></td>
					<td><%=update3 %></td>
					<td><%= lsdate3%></td>
					<td><a href="Download?filename=<%=filename3 %>">Download</a></td>
					
					</tr>
					
					
					
					
									
					<%
					}
				}
			}
			
			
			
			%>
			</table>
				



	
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