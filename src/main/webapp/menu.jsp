 <!-- Topbar Start -->
    <div class="container-fluid bg-dark py-3 px-lg-5 d-none d-lg-block">
        <div class="row">
            <div class="col-md-6 text-center text-lg-left mb-2 mb-lg-0">
                <div class="d-inline-flex align-items-center">
                    <a class="text-body pr-3" href=""><i class="fa fa-phone-alt mr-2"></i>+91 76666382872</a>
                    <span class="text-body">|</span>
                    <a class="text-body px-3" href=""><i class="fa fa-envelope mr-2"></i>info@vehicle.com</a>
                </div>
            </div>
            <div class="col-md-6 text-center text-lg-right">
                <div class="d-inline-flex align-items-center">
                    <a class="text-body px-3" href="">
                        <i class="fab fa-facebook-f"></i>
                    </a>
                    <a class="text-body px-3" href="">
                        <i class="fab fa-twitter"></i>
                    </a>
                    <a class="text-body px-3" href="">
                        <i class="fab fa-linkedin-in"></i>
                    </a>
                    <a class="text-body px-3" href="">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a class="text-body pl-3" href="">
                        <i class="fab fa-youtube"></i>
                    </a>
                </div>
            </div>
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar Start -->
    <div class="container-fluid position-relative nav-bar p-0">
        <div class="position-relative px-lg-5" style="z-index: 9;">
            <nav class="navbar navbar-expand-lg bg-secondary navbar-dark py-3 py-lg-0 pl-3 pl-lg-5">
                <a href="" class="navbar-brand">
                    <h1 class="text-uppercase text-primary mb-1">Vehicle Rental</h1>
                </a>
                <button type="button" class="navbar-toggler" data-toggle="collapse" data-target="#navbarCollapse">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse justify-content-between px-3" id="navbarCollapse">
                    <div class="navbar-nav ml-auto py-0">
                        <a href="index.jsp" class="nav-item nav-link active">Home</a>
                       
                        <%
       if(session.getAttribute("email")==null){
       
       %>
                         <a href="about.jsp" class="nav-item nav-link">About</a>
                        <a href="services.jsp" class="nav-item nav-link">Service</a>
                        <%-- <a href="contact.jsp" class="nav-item nav-link">Contact</a>--%>
                        <a href="register.jsp" class="nav-item nav-link">Register</a>
                        <a href="login.jsp" class="nav-item nav-link">Login</a>
        
      <%
       }
       else{
      %>
           
          <a class="nav-link" href="vehicle/">Add Vehicle</a>
                <a class="nav-link" href="welcome.jsp">Vehicle</a>
          <a class="nav-link" href="viewcart.jsp">My booking</a>
          <a class="nav-link" href="orders.jsp">My Orders</a>
          <a class="nav-link" href="logout.jsp">Logout</a>

       
        <%
       }
        %>
                         
                    </div>
                </div>
            </nav>
        </div>
    </div>
    <!-- Navbar End -->
