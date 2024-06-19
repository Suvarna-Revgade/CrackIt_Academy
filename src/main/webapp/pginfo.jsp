
    <%@ page import="java.util.List" %>
	<%@ page import="com.pgtimetablemess" %>
	<%@ page import="com.DB.pgTimetable" %>
	<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="css/style1.css">
    <link rel="stylesheet" href="css/swiper-bundle.min.css">
    <!-- Favicon -->
    <link href="img/favicon.ico" rel="icon">

    <!-- Google Web Fonts -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700;800&family=Rubik:wght@400;500;600;700&display=swap" rel="stylesheet">

    <!-- Icon Font Stylesheet -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.4.1/font/bootstrap-icons.css" rel="stylesheet">

    <!-- Libraries Stylesheet -->
    <link href="lib/owlcarousel/assets/owl.carousel.min.css" rel="stylesheet">
    <link href="lib/animate/animate.min.css" rel="stylesheet">

    <!-- Customized Bootstrap Stylesheet -->
    <link href="css/bootstrap.min.css" rel="stylesheet">

    <!-- Template Stylesheet -->
    <link href="css/style.css" rel="stylesheet">
    <style type="text/css">
    *{
    font-family:sans-serif;
    padding: 0;
    margin: 0;
    box-sizing: border-box;
}
.main{
    height: 100vh;
    width: 100%;
}
.wrapper,.slide{
    width: 100%;
    height: 100%;
}
.slide{
    overflow: hidden;
}
.slide::before{
    content: "";
    position: absolute;
    height: 100%;
    width: 100%;
    background-color:rgba(0,0,0,0.4);
    z-index: 10;
}
.slide .image{
    height: 100%;
    width: 100%;
    object-fit: cover;
}
.slide .image-date{
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%,-50%);
    text-align: center;
    width: 100%;
    z-index: 100;
}
.image-date span.text{
    font-size: 14px;
    font-weight: 400;
   color: #fff;

}
.image-date h2{
    font-size: 45px;
    font-weight: 600;
    color: #fff;
}

.container{
    /* width: 100%; */
    padding-left: 40px;
    padding-right: 40px;
    background-color: rgba(0,0,0,0.4);
}
.main-wrapper{
    display: flex;
    align-items: center;

}
.inner-image img{
    padding: 30px;
    
}
.inner-text {
    padding: 30px;
    color: #fff;
    line-height: 30px;
}
.inner-text  h1{
    text-align: center;
    line-height: 80px;
}
table{
/* position: absolute; */
left: 50%;
top: 50%;
border-collapse: collapse;
width: 800px;
height: 90px;
border: 2px solid black;
box-shadow: 2px 2px 12px rgba(0, 0, 0, 0.2), -1px,-1px 8px rgba(0, 0, 0, 0.2);
margin: auto;
}
tr{
transition: all .5s ease-in-out;
cursor: pointer;
}
th,td{
padding: 12px;
text-align: left;
border-bottom: 2px solid black;
}
#header{
background-color: rgba(9, 30, 62, .7);
color: #fff;
}
.feature{
height: 400px;
width: 100%;
background:linear-gradient(to right, rgba(9, 30, 62, .7), white ,rgba(9, 30, 62, .7));
}

table,th,td{
border: 2px solid black;
border-collapse: collapse;
text-align: center;
}
#fee{
text-align: center;
background-color:rgba(9, 30, 62, .7);
}
.descr{
margin: 10px;
height: 400px;
padding: 30px;
line-height: 25px ;
background-color: rgba(9, 30, 62, .7);
color: white;
}
    </style>
</head>
<body>
 <!-- Spinner Start -->
    <div id="spinner" class="show bg-white position-fixed translate-middle w-100 vh-100 top-50 start-50 d-flex align-items-center justify-content-center">
        <div class="spinner"></div>
    </div>
    <!-- Spinner End -->


     <div class="container-fluid bg-dark px-5 d-none d-lg-block">
        <div class="row gx-0">
            <div class="col-lg-8 text-center text-lg-start mb-2 mb-lg-0">
                <div class="d-inline-flex align-items-center" style="height: 45px;">
                    <small class="me-3 text-light"><i class="fa fa-map-marker-alt me-2"></i>Gulmohar Colony, Pimple Gurav, Pune</small>
                    <small class="me-3 text-light"><i class="fa fa-phone-alt me-2"></i>+91 8421835869</small>
                    <small class="text-light"><i class="fa fa-envelope-open me-2"></i>telphatech@gmail.com</small>
                </div>
            </div>
            <div class="col-lg-4 text-center text-lg-end">
                <div class="d-inline-flex align-items-center" style="height: 45px;">
                    <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-twitter fw-normal"></i></a>
                    <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-facebook-f fw-normal"></i></a>
                    <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-linkedin-in fw-normal"></i></a>
                    <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle me-2" href=""><i class="fab fa-instagram fw-normal"></i></a>
                    <a class="btn btn-sm btn-outline-light btn-sm-square rounded-circle" href=""><i class="fab fa-youtube fw-normal"></i></a>
                             <a href="index.jsp" name="testbutton"class="btn btn-primary py-2 px-4 mt-4">logout</a>
                
                </div>
            </div>
           
        </div>
    </div>
    <!-- Topbar End -->


    <!-- Navbar & Carousel Start -->
    <div class="container-fluid position-relative p-0">
        <nav class="navbar navbar-expand-lg navbar-dark px-5 py-3 py-lg-0">
            <a href="index.html" class="navbar-brand p-0">
                <h1 class="m-0"><i class="fa fa-university" aria-hidden="true"></i>CrackIt</h1>
            </a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarCollapse">
                <span class="fa fa-bars"></span>
            </button>
            

            <div class="collapse navbar-collapse" id="navbarCollapse">
                <div class="navbar-nav ms-auto py-0">
                    <a href="index.jsp" class="nav-item nav-link active">Home</a>
                    <a href="about.html" class="nav-item nav-link">About</a>
                    
                     <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Student Corner</a>
                        <div class="dropdown-menu m-0">
                            <a href="test.html" class="dropdown-item">Tests</a>
                            <a href="notes_subjectwise.html" class="dropdown-item">Notes Subject-wise</a>
                            <a href="question_bank.jsp" class="dropdown-item">Question Bank</a>
                            <a href="pastQuePaper.jsp" class="dropdown-item">Past Question Paper</a>
                             <a href="classquepaper.jsp" class="dropdown-item">class Questions</a>
                            <a href="class_features.html" class="dropdown-item">Class Features</a>
                        </div>
                    </div>
                    
                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Fee Structure</a>
                        <div class="dropdown-menu m-0">
                            <a href="all_details_fee.html" class="dropdown-item">All Details Fee Structure</a>
                            <a href="batch_fee.html" class="dropdown-item">Batch Fee</a>
                            <a href="pg_batch_fee.html" class="dropdown-item">PG + Batch Fee</a>
                        </div>
                    </div>

                   <a href="pginfo.jsp" class="nav-item nav-link">PG Info</a>


                   <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Exam Section</a>
                        <div class="dropdown-menu m-0">
                            <a href="upcoming_exam.html" class="dropdown-item">Upcoming Exam</a>
                            <a href="exam_timetable.html" class="dropdown-item">Exam Timetable</a>
                            <a href="exam_form_dates.html" class="dropdown-item">Exam Form Dates</a>
                            <a href="exam_results.html" class="dropdown-item">Exam Results</a>
                            <a href="cut_offs.html" class="dropdown-item">Cut-Offs</a>
                            <a href="exam_notices.html" class="dropdown-item">Exam Notices</a>
                        </div>
                    </div>

                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Webinar</a>
                        <div class="dropdown-menu m-0">
                            <a href="live_webinar.html" class="dropdown-item">Live Webinar</a>
                            <a href="upcoming_web.html" class="dropdown-item">Upcoming Webinar</a>
                        </div>
                    </div>

                    <div class="nav-item dropdown">
                        <a href="#" class="nav-link dropdown-toggle" data-bs-toggle="dropdown">Library</a>
                        <div class="dropdown-menu m-0">
                            <a href="library.html" class="dropdown-item">Library Info</a>
                            
                            <a href="BookReading.html" class="dropdown-item">Reading Room</a>
                            
                        </div>
                    </div>
                    
                    <a href="ground.html" class="nav-item nav-link">Ground </a>
                       


                    <a href="contact.html" class="nav-item nav-link">Contact</a>
                </div>
                
                
            </div>
        </nav>



        <div class="container-fluid bg-primary py-5 bg-header" style="margin-bottom: 90px;">
            <div class="row py-5">
                <div class="col-12 pt-lg-5 mt-lg-5 text-center">
                    <h1 class="display-4 text-white animated zoomIn">PG Info</h1>
                    <a href="" class="h5 text-white">Home</a>
                    <i class="far fa-circle text-white px-2"></i>
                    <a href="" class="h5 text-white">PG Info</a>
                </div>
            </div>
        </div>
    </div>
    <!-- Navbar End -->
     <!-- Full Screen Search Start -->
    <div class="modal fade" id="searchModal" tabindex="-1">
        <div class="modal-dialog modal-fullscreen">
            <div class="modal-content" style="background: rgba(9, 30, 62, .7);">
                <div class="modal-header border-0">
                    <button type="button" class="btn bg-white btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body d-flex align-items-center justify-content-center">
                    <div class="input-group" style="max-width: 600px;">
                        <input type="text" class="form-control bg-transparent border-primary p-3" placeholder="Type search keyword">
                        <button class="btn btn-primary px-4"><i class="bi bi-search"></i></button>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Full Screen Search End -->

    
    <secion class="main swiper mySwiper">
        <div class="wrapper swiper-wrapper">
            <div class="slide swiper-slide ">
                <img src="img/Room4.jpg" alt="" class="image">
                <div class="image-date">
                    <span class="text">This is our hostel rooms.</span>
                    <h2>
                       A comfortable, affordable place to stay. 
                    </h2>
                </div>
            </div>
            <div class="slide swiper-slide ">
                <img src="img/Room1.jpeg" alt="" class="image">
                <div class="image-date">
                    <span class="text">This is our hostel rooms.</span>
                    <h2>
                        A comfortable, affordable place to stay
                    </h2>
                </div>
            </div>
            <div class="slide swiper-slide ">
                <img src="img/Room2.jpg" alt="" class="image">
                <div class="image-date">
                    <span class="text">This is our hostel rooms.</span>
                    <h2>
                        A comfortable, affordable place to stay
                    </h2>
                </div>
            </div>
            <div class="slide swiper-slide ">
                <img src="img/room3.jpg" alt="" class="image">
                <div class="image-date">
                    <span class="text">This is our hostel rooms.</span>
                    <h2>
                        A comfortable, affordable place to stay
                    </h2>
                </div>
            </div>
        </div>
        <div class="swiper-button-next"></div>
        <div class="swiper-button-prev"></div>
        <div class="swiper-pagination"></div>
        
    </secion>
    <br><br><br><br>
    <div class="descr">
            <p>
                CRACKIT has a seperate hostel for boys and girls with well furnished rooms and 
                modern amenities. The overall atmosphere is very conductive for the students to concentrate on
                studies.The hostel have well-furnished air-conditioned and regular rooms with attached rest rooms providing 
                the right ambience for the students. <br>
                Hostel rooms are equipped with beds,cupboards,a fan and study tables and chairs. <br>
                Students sleep in rooms of three beds each(i.e three students per room). <br>
                Students are also monitored by a security guard and warden. <br>
                Doors lock at 8:30 PM every night.Only Pre-authorized visitors are allowed. <br>
                Females and males stay in seperate accomaodation ,and are not allowed to visti each other. <br>

                 
            </p>
        </div><br><br>
                  
            <div class="container">
               <marquee behavior="scroll" direction="left"><h1>Eat Healthy ,Stay Healthy</h1> </marquee>  <br><br>
            <div class="main-wrapper">
                <div class="inner-image">
                    <img src="img/mess1.png" >
                </div>
                <div class="inner-text">
                    <h2>Food Information</h2> <br>
                    <p>If you have ever got a chance to leave your house and live in hostels then you must be knowing the troubles of a hosteler especially when it comes to food. Surviving with the hostel food is such a pain especially when you are a foodie. You can’t even cook on your own as it is not allowed in many of the hostels. But there are smart ways to handle it. Here are 10 things that you can cook in the hostel where stove and induction is not allowed.
                    </p>
                    <p>The Canteen provides fresh, hot, hygenic and healthy food to quench the taste buds of the Students, Staff and Faculty Members. Vegetarian Breakfast, Lunch, High Tea, Snacks and Beverages are served in the Canteen. Canteen also caters to the Refreshments and Catering requirements for the different Events organized at Rai University. The campus also has Food Courts/Cafetaria which are favourite Hangout zones for the Students after a hectic day. Mess facility is available for the Residential Students.
                        Healthy meals are provided for students while staying on campus. The mess hall can accommodate 100 students at a time.
                    </p>
                </div>
            </div></div>
            <br><br><br>
       
                <h1 style="text-align: center;">TIMETABLE</h1>                                         
                     <table>
                <thead>
                <tr id="header">
                
                    <th>Days(Mon-Sun)</th>
                    <th>Breakfast</th>
                    <th>Lunch</th>
                    <th>Dinner</th>
                </tr>
                </thead>
                <tbody>
                <% 
                pgTimetable fDAO = new pgTimetable();
                List<pgtimetablemess> l = fDAO.getAllFiles();
                for (pgtimetablemess f : l) {
            %>
            <tr>
                <td><%= f.getDays() %></td>
                <td><%= f.getBreakfast() %></td>
             <td> <%= f.getLunch() %> </td>\
               <td> <%= f.getDinner() %> </td>
               
            </tr>
            <%
                }
            %>
        </tbody>
                
            </table>
            <br><br><br>
           <h1 style="text-align: center;">Features</h1>
           <div class="feature">
           <ul style="text-align: center;">
            <li>TV Room</li><br>
            <li>Wi-Fi Connectivity</li><br>
            <li>Daily Cleaning of Hostel and Mess</li><br>
            <li>Well Disciplined Environment</li><br>
            <li>CCTV Survillence</li><br>
            <li>RO water Purifier</li><br>
            <li>Solar Water Heater </li><br>
            <li>Water coolers are available on each floor of the hostel</li><br>
            <li>24*7 Security</li><br>
            <li>Healthy Meals</li><br>
           </ul>
        </div><br><br><br>
        <div class="fees">
            <table>
                <tr id="fee" >
                    <td colspan="4" style="text-align: center;">Fees</td>
                </tr>
                <tr>
                    <td colspan="2">For Boys</td>
                    <td colspan="2">Rs.40.0k</td>
                </tr>
                <tr>
                    <td colspan="2">For Girls</td>
                    <td colspan="2">Rs.40.0k</td>
                </tr>
            </table>
        </div>

        </div>


    <script src="js/swiper-bundle.min.js"></script>
    <script>
        var swiper = new Swiper(".mySwiper", {
          slidesPerView: 1,
          spaceBetween: 30,
          loop: true,
          pagination: {
            el: ".swiper-pagination",
            clickable: true,
          },
          navigation: {
            nextEl: ".swiper-button-next",
            prevEl: ".swiper-button-prev",
          },
        });
      </script>
     
    
    

    <!-- Footer Start -->
   <div class="container-fluid bg-dark text-light mt-5 wow fadeInUp" data-wow-delay="0.1s">
        <div class="container">
            <div class="row gx-5">
                <div class="col-lg-4 col-md-6 footer-about">
                    <div class="d-flex flex-column align-items-center justify-content-center text-center h-100 bg-primary p-4">
                        <a href="index.html" class="navbar-brand">
                            <h1 class="m-0 text-white"><i class="fa fa-user-tie me-2"></i>CrackIt</h1>
                        </a>
                        <p class="mt-3 mb-4">Welcome to our esteemed Crackit academy dedicated to shaping the future leaders for the competitive landscape of UPSC and MPSC examinations. With a relentless commitment to excellence, we provide a nurturing environment that fosters intellectual growth, strategic thinking, and comprehensive preparation. </p>
                        <!-- <form action="">
                            <div class="input-group">
                                <input type="text" class="form-control border-white p-3" placeholder="Your Email">
                                <button class="btn btn-dark">Sign Up</button>
                            </div>
                        </form> -->
                    </div>
                </div>
                <div class="col-lg-8 col-md-6">
                    <div class="row gx-5">
                        <div class="col-lg-4 col-md-12 pt-5 mb-5">
                            <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                <h3 class="text-light mb-0">Get In Touch</h3>
                            </div>
                            <div class="d-flex mb-2">
                                <i class="bi bi-geo-alt text-primary me-2"></i>
                                <p class="mb-0">Sr. No. 73/6/13, B-10, Gulmohar Colony, Pimple Gurav, Pune - 411061</p>
                            </div>
                            <div class="d-flex mb-2">
                                <i class="bi bi-envelope-open text-primary me-2"></i>
                                <p class="mb-0">telphatech@gmail.com</p>
                            </div>
                            <div class="d-flex mb-2">
                                <i class="bi bi-telephone text-primary me-2"></i>
                                <p class="mb-0">+91 8421835869</p>
                            </div>
                            
                        </div>
                        <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                            <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                <h3 class="text-light mb-0">Quick Links</h3>
                            </div>
                            <div class="link-animated d-flex flex-column justify-content-start">
                                <a class="text-light mb-2" href="index.html"><i class="bi bi-arrow-right text-primary me-2"></i>Home</a>
                                <a class="text-light mb-2" href="about.html"><i class="bi bi-arrow-right text-primary me-2"></i>About Us</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Student Corner</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Exam Section</a>
                                <a class="text-light mb-2" href="#"><i class="bi bi-arrow-right text-primary me-2"></i>Fee Structure</a>
                                <a class="text-light" href="contact.html"><i class="bi bi-arrow-right text-primary me-2"></i>Contact Us</a>
                            </div>
                        </div>
                        <div class="col-lg-4 col-md-12 pt-0 pt-lg-5 mb-5">
                           <!--  <div class="section-title section-title-sm position-relative pb-3 mb-4">
                                <h3 class="text-light mb-0"></h3>
                            </div> -->
                            <div class="d-flex mt-4">
                                <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-twitter fw-normal"></i></a>
                                <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-facebook-f fw-normal"></i></a>
                                <a class="btn btn-primary btn-square me-2" href="#"><i class="fab fa-linkedin-in fw-normal"></i></a>
                                <a class="btn btn-primary btn-square" href="#"><i class="fab fa-instagram fw-normal"></i></a>
                            </div>
                        </div> 
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <div class="container-fluid text-white" style="background: #061429;">
        <div class="container text-center">
            <div class="row justify-content-end">
                <div class="col-lg-8 col-md-6">
                    <div class="d-flex align-items-center justify-content-center" style="height: 75px;">
                        <p class="mb-0">&copy; <a class="text-white border-bottom" href="#">CrackIt Academy</a>. All Rights Reserved. 
						
						<!--/*** This template is free as long as you keep the footer author’s credit link/attribution link/backlink. If you'd like to use the template without the footer author’s credit link/attribution link/backlink, you can purchase the Credit Removal License from "https://htmlcodex.com/credit-removal". Thank you for your support. ***/-->
						Designed by <a class="text-white border-bottom" href="https://htmlcodex.com">telphatech LLP </a></p>
                        
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- Footer End -->


    <!-- Back to Top -->
    <a href="#" class="btn btn-lg btn-primary btn-lg-square rounded back-to-top"><i class="bi bi-arrow-up"></i></a>


    <!-- JavaScript Libraries -->
    <script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="lib/wow/wow.min.js"></script>
    <script src="lib/easing/easing.min.js"></script>
    <script src="lib/waypoints/waypoints.min.js"></script>
    <script src="lib/counterup/counterup.min.js"></script>
    <script src="lib/owlcarousel/owl.carousel.min.js"></script>

    <!-- Template Javascript -->
    <script src="js/main.js"></script>
</body>
</html>