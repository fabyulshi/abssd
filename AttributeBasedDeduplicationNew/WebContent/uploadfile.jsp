<!DOCTYPE html>

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
           <li class="active"><a href="uploadfile.jsp">Upload</a></li>
            <li><a href="download.jsp">Download</a></li>
            <li><a href="graph.jsp">Graph</a></li>
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
							
							<font style="color: black; font-size: 20px">Upload
				File</font> <br /> <br /> <br />
			<form action="UploadServlet" method="post" enctype="multipart/form-data">
				<table border="0" cellpadding="5" cellspacing="5">
					<tr>


						<td align="center">Select File:-</td>
						<td><input type="file" name="file"
							style="width: 170px; height: 30px" required /></td>
						<td></td>
						<td></td>

					</tr>
					<tr>
					<td>Start Date</td>
					<td><input type="datetime-local" name="sdate" style="width: 170px; height: 30px;" required/></td>
					<td>Last Date</td>
					<td><input type="datetime-local" name="ldate" style="width: 170px; height: 30px;" required/></td>

					</tr>

					
					<tr>
						<td>Select Attribute</td>
						<td><select name="prv1" style="height: 30px" required="required">
								<option value="">--Select--</option>
								<option value="Student">Student</option>
								<option value="Technical">Technical</option>
								<option value="nonTechnical">Non-Technical</option>

						</select>
							&nbsp;&nbsp; <select name="opr1" style="height: 30px">
								<option value="--Select--">--Select--</option>
								<option value="AND">AND</option>
								<option value="OR">OR</option>

						</select></td>
						<td>&nbsp;&nbsp;&nbsp;<select name="prv2" style="height: 30px">
								<option value="--Select--">--Select--</option>
								<option value="Student">Student</option>
								<option value="Technical">Technical</option>
								<option value="nonTechnical">Non-Technical</option>

						</select>&nbsp;&nbsp;<select
							name="opr2" style="height: 30px">
								<option value="--Select--">--Select--</option>
								<option value="AND">AND</option>
								<option value="OR">OR</option>

						</select></td>
						<td>&nbsp;&nbsp;<select name="prv3" style="height: 30px">
								<option value="--Select--">--Select--</option>
								<option value="Student">Student</option>
								<option value="Technical">Technical</option>
								<option value="nonTechnical">Non-Technical</option>

						</select></td>
					</tr>
					
					<tr></tr>
					<tr></tr>
					<tr>
						<td></td>
						<td><input type="submit" value="Upload"
							style="width: 130px; height: 35px" /></td>

					</tr>
				</table>
			</form>
							
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