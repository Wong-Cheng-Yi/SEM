<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="home.aspx.cs" Inherits="SEM_Assignment.home" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <!-- ***** Main Banner Area Start ***** -->
    <section class="section main-banner" id="top" data-section="section1">
        <video autoplay muted loop id="bg-video">
            <source src="assets/images/video.mp4" type="video/mp4" />
        </video>

        <div class="video-overlay header-text">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="caption">
                            <h6>TUNKU ABDUL RAHMAN UNIVERSITY OF MANAGEMENT AND TECHNOLOGY</h6>
                            <h2>Faculty of Computing and Information Technology</h2>
                            <%--<p>This is an edu meeting HTML CSS template provided by <a rel="nofollow" href="https://templatemo.com/page/1" target="_blank">TemplateMo website</a>. This is a Bootstrap v5.1.3 layout. The video background is taken from Pexels website, a group of young people by <a rel="nofollow" href="https://www.pexels.com/@pressmaster" target="_blank">Pressmaster</a>.</p>
              <div class="main-button-red">
                  <div class="scroll-to-section"><a href="#contact">Join Us Now!</a></div>
              </div>--%>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- ***** Main Banner Area End ***** -->

    <section class="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="owl-service-item owl-carousel">

                        <div class="item">
                            <div class="icon">
                                <img src="assets/images/service-icon-01.png" alt="">
                            </div>
                            <div class="down-content">
                                <h4>Best Education</h4>
                                <p>Suspendisse tempor mauris a sem elementum bibendum. Praesent facilisis massa non vestibulum.</p>
                            </div>
                        </div>

                        <div class="item">
                            <div class="icon">
                                <img src="assets/images/service-icon-02.png" alt="">
                            </div>
                            <div class="down-content">
                                <h4>Best Teachers</h4>
                                <p>Suspendisse tempor mauris a sem elementum bibendum. Praesent facilisis massa non vestibulum.</p>
                            </div>
                        </div>

                        <div class="item">
                            <div class="icon">
                                <img src="assets/images/service-icon-03.png" alt="">
                            </div>
                            <div class="down-content">
                                <h4>Best Students</h4>
                                <p>Suspendisse tempor mauris a sem elementum bibendum. Praesent facilisis massa non vestibulum.</p>
                            </div>
                        </div>

                        <div class="item">
                            <div class="icon">
                                <img src="assets/images/service-icon-02.png" alt="">
                            </div>
                            <div class="down-content">
                                <h4>Online Event</h4>
                                <p>Suspendisse tempor mauris a sem elementum bibendum. Praesent facilisis massa non vestibulum.</p>
                            </div>
                        </div>

                        <div class="item">
                            <div class="icon">
                                <img src="assets/images/service-icon-03.png" alt="">
                            </div>
                            <div class="down-content">
                                <h4>Best Networking</h4>
                                <p>Suspendisse tempor mauris a sem elementum bibendum. Praesent facilisis massa non vestibulum.</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="upcoming-meetings" id="meetings">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h2>Upcoming Events</h2>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="categories">
                        <h4>Event Categories</h4>
                        <ul>
                            <li><a href="event.aspx">Technology & Innovation</a></li>
                            <li><a href="event.aspx">Leadership & Management</a></li>
                            <li><a href="event.aspx">Education & Training</a></li>
                            <li><a href="event.aspx">Health & Wellness</a></li>
                            <li><a href="event.aspx">Entrepreneurship & Business</a></li>
                            <li><a href="event.aspx">Sustainability & Environment</a></li>
                            <li><a href="event.aspx">Community & Networking</a></li>
                            <li><a href="event.aspx">Arts & Culture</a></li>
                        </ul>
                        <div class="main-button-red">
                            <a href="event.aspx">All Upcoming Events</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-8">
                    <div class="row">
                        <!-- PlaceHolder for upcoming events -->
                        <asp:PlaceHolder ID="eventsPlaceholder" runat="server"></asp:PlaceHolder>
                        <!-- The dynamically loaded events will be rendered here -->
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="apply-now" id="apply">
        <div class="container">
            <div class="row">
                <div class="col-lg-6 align-self-center">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="item">
                                <h3>APPLY FOR BACHELOR DEGREE</h3>
                                <p>You are allowed to use this edu meeting CSS template for your school or university or business. You can feel free to modify or edit this layout.</p>
                                <div class="main-button-red">
                                    <div class="scroll-to-section"><a href="#contact">Join Us Now!</a></div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="item">
                                <h3>APPLY FOR BACHELOR DEGREE</h3>
                                <p>You are not allowed to redistribute the template ZIP file on any other template website. Please contact us for more information.</p>
                                <div class="main-button-yellow">
                                    <div class="scroll-to-section"><a href="#contact">Join Us Now!</a></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6">
                    <div class="accordions is-first-expanded">
                        <article class="accordion">
                            <div class="accordion-head">
                                <span>About Edu Meeting HTML Template</span>
                                <span class="icon">
                                    <i class="icon fa fa-chevron-right"></i>
                                </span>
                            </div>
                            <div class="accordion-body">
                                <div class="content">
                                    <p>If you want to get the latest collection of HTML CSS templates for your websites, you may visit <a rel="nofollow" href="https://www.toocss.com/" target="_blank">Too CSS website</a>. If you need a working contact form script, please visit <a href="https://templatemo.com/contact" target="_parent">our contact page</a> for more info.</p>
                                </div>
                            </div>
                        </article>
                        <article class="accordion">
                            <div class="accordion-head">
                                <span>HTML CSS Bootstrap Layout</span>
                                <span class="icon">
                                    <i class="icon fa fa-chevron-right"></i>
                                </span>
                            </div>
                            <div class="accordion-body">
                                <div class="content">
                                    <p>
                                        Etiam posuere metus orci, vel consectetur elit imperdiet eu. Cras ipsum magna, maximus at semper sit amet, eleifend eget neque. Nunc facilisis quam purus, sed vulputate augue interdum vitae. Aliquam a elit massa.<br>
                                        <br>
                                        Nulla malesuada elit lacus, ac ultricies massa varius sed. Etiam eu metus eget nibh consequat aliquet. Proin fringilla, quam at euismod porttitor, odio odio tempus ligula, ut feugiat ex erat nec mauris. Donec viverra velit eget lectus sollicitudin tincidunt.
                                   
                                    </p>
                                </div>
                            </div>
                        </article>
                        <article class="accordion">
                            <div class="accordion-head">
                                <span>Please tell your friends</span>
                                <span class="icon">
                                    <i class="icon fa fa-chevron-right"></i>
                                </span>
                            </div>
                            <div class="accordion-body">
                                <div class="content">
                                    <p>
                                        Ut vehicula mauris est, sed sodales justo rhoncus eu. Morbi porttitor quam velit, at ullamcorper justo suscipit sit amet. Quisque at suscipit mi, non efficitur velit.<br>
                                        <br>
                                        Cras et tortor semper, placerat eros sit amet, porta est. Mauris porttitor sapien et quam volutpat luctus. Nullam sodales ipsum ac neque ultricies varius.
                                   
                                    </p>
                                </div>
                            </div>
                        </article>
                        <article class="accordion last-accordion">
                            <div class="accordion-head">
                                <span>Share this to your colleagues</span>
                                <span class="icon">
                                    <i class="icon fa fa-chevron-right"></i>
                                </span>
                            </div>
                            <div class="accordion-body">
                                <div class="content">
                                    <p>
                                        Maecenas suscipit enim libero, vel lobortis justo condimentum id. Interdum et malesuada fames ac ante ipsum primis in faucibus.<br>
                                        <br>
                                        Sed eleifend metus sit amet magna tristique, posuere laoreet arcu semper. Nulla pellentesque ut tortor sit amet maximus. In eu libero ullamcorper, semper nisi quis, convallis nisi.
                                   
                                    </p>
                                </div>
                            </div>
                        </article>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="our-courses" id="courses">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-heading">
                        <h2>Our Popular Courses</h2>
                    </div>
                </div>
                <div class="col-lg-12">
                    <div class="owl-courses-item owl-carousel">
                        <div class="item">
                            <img src="assets/images/course-01.jpg" alt="Course One">
                            <div class="down-content">
                                <h4>Morbi tincidunt elit vitae justo rhoncus</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                            <span>$160</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-02.jpg" alt="Course Two">
                            <div class="down-content">
                                <h4>Curabitur molestie dignissim purus vel</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                            <span>$180</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-03.jpg" alt="">
                            <div class="down-content">
                                <h4>Nulla at ipsum a mauris egestas tempor</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                            <span>$140</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-04.jpg" alt="">
                            <div class="down-content">
                                <h4>Aenean molestie quis libero gravida</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                            <span>$120</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-01.jpg" alt="">
                            <div class="down-content">
                                <h4>Lorem ipsum dolor sit amet adipiscing elit</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                            <span>$250</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-02.jpg" alt="">
                            <div class="down-content">
                                <h4>TemplateMo is the best website for Free CSS</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                            <span>$270</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-03.jpg" alt="">
                            <div class="down-content">
                                <h4>Web Design Templates at your finger tips</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                            <span>$340</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-04.jpg" alt="">
                            <div class="down-content">
                                <h4>Please visit our website again</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                            <span>$360</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-01.jpg" alt="">
                            <div class="down-content">
                                <h4>Responsive HTML Templates for you</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                            <span>$400</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-02.jpg" alt="">
                            <div class="down-content">
                                <h4>Download Free CSS Layouts for your business</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                            <span>$430</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-03.jpg" alt="">
                            <div class="down-content">
                                <h4>Morbi in libero blandit lectus cursus</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                            <span>$480</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="item">
                            <img src="assets/images/course-04.jpg" alt="">
                            <div class="down-content">
                                <h4>Curabitur molestie dignissim purus</h4>
                                <div class="info">
                                    <div class="row">
                                        <div class="col-8">
                                            <ul>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                                <li><i class="fa fa-star"></i></li>
                                            </ul>
                                        </div>
                                        <div class="col-4">
                                            <span>$560</span>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="our-facts">
        <div class="container">
            <div class="row">
                <div class="col-lg-6">
                    <div class="row">
                        <div class="col-lg-12">
                            <h2>FOCS at a Glance</h2>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-12">
                                    <div class="count-area-content">
                                        <div class="count-digit">1972</div>
                                        <div class="count-title">FOUNDED</div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="count-area-content">
                                        <div class="count-digit">5</div>
                                        <div class="count-title">DEPARTMENTS</div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="count-area-content">
                                        <div class="count-digit">16</div>
                                        <div class="count-title">PROGRAMMES</div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="count-area-content">
                                        <div class="count-digit">6</div>
                                        <div class="count-title">RESEARCH CENTRES</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-6">
                            <div class="row">
                                <div class="col-12">
                                    <div class="count-area-content new-students">
                                        <div class="count-digit">3500</div>
                                        <div class="count-title">ACTIVE STUDENTS</div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="count-area-content">
                                        <div class="count-title"><b>1</b> <sup>ST</sup>  FACULTY</div>
                                        <div class="count-title">MDEC PDTI RECOGNITION</div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="count-area-content">
                                        <div class="count-digit">10</div>
                                        <div class="count-title">PROGRAMMES MDEC PDTI RECOGNITION</div>
                                    </div>
                                </div>
                                <div class="col-12">
                                    <div class="count-area-content">
                                        <div class="count-digit">2</div>
                                        <div class="count-title">CENTRES OF EXCELLENCE</div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <div class="col-lg-6 align-self-center">
                    <div class="video">
                        <a href="https://www.youtube.com/watch?v=HndV87XpkWg" target="_blank">
                            <img src="assets/images/play-icon.png" alt=""></a>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
