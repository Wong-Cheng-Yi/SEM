﻿<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="event.aspx.cs" Inherits="SEM_Assignment._event" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <section class="heading-page header-text" id="top">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <h6>Here are our upcoming events</h6>
          <h2>Upcoming Events</h2>
        </div>
      </div>
    </div>
  </section>

  <section class="meetings-page" id="meetings">
    <div class="container">
      <div class="row">
        <div class="col-lg-12">
          <div class="row">
            <div class="col-lg-12">
              <div class="filters">
                <ul>
                  <li data-filter="*"  class="active">All Events</li>
                  <li data-filter=".soon">Soon</li>
                  <li data-filter=".imp">Important</li>
                  <li data-filter=".att">Attractive</li>
                </ul>
              </div>
            </div>
            <div class="col-lg-12">
              <div class="row grid">
                <div class="col-lg-4 templatemo-item-col all soon">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$14.00</span>
                      </div>
                      <a href="event-details.aspx"><img src="assets/images/meeting-01.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>12</span></h6>
                      </div>
                      <a href="event-details.aspx"><h4>New Lecturers Meeting</h4></a>
                      <p>Morbi in libero blandit lectus<br>cursus ullamcorper.</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 templatemo-item-col all imp">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$22.00</span>
                      </div>
                      <a href="event-details.aspx"><img src="assets/images/meeting-02.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>14</span></h6>
                      </div>
                      <a href="event-details.aspx"><h4>Online Teaching Techniques</h4></a>
                      <p>Morbi in libero blandit lectus<br>cursus ullamcorper.</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 templatemo-item-col all soon">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$24.00</span>
                      </div>
                      <a href="event-details.aspx"><img src="assets/images/meeting-03.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>16</span></h6>
                      </div>
                      <a href="event-details.aspx"><h4>Network Teaching Concept</h4></a>
                      <p>Morbi in libero blandit lectus<br>cursus ullamcorper.</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 templatemo-item-col all att">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$32.00</span>
                      </div>
                      <a href="event-details.aspx"><img src="assets/images/meeting-04.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>18</span></h6>
                      </div>
                      <a href="event-details.aspx"><h4>Online Teaching Tools</h4></a>
                      <p>Morbi in libero blandit lectus<br>cursus ullamcorper.</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 templatemo-item-col all att">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$34.00</span>
                      </div>
                      <a href="event-details.aspx"><img src="assets/images/meeting-02.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>22</span></h6>
                      </div>
                      <a href="event-details.aspx"><h4>New Teaching Techniques</h4></a>
                      <p>Morbi in libero blandit lectus<br>cursus ullamcorper.</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 templatemo-item-col all imp">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$45.00</span>
                      </div>
                      <a href="event-details.aspx"><img src="assets/images/meeting-03.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>24</span></h6>
                      </div>
                      <a href="event-details.aspx"><h4>Technology Conference</h4></a>
                      <p>TemplateMo is the best website<br>when it comes to Free CSS.</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 templatemo-item-col all imp att">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$52.00</span>
                      </div>
                      <a href="event-details.aspx"><img src="assets/images/meeting-01.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>27</span></h6>
                      </div>
                      <a href="event-details.aspx"><h4>Online Teaching Techniques</h4></a>
                      <p>Morbi in libero blandit lectus<br>cursus ullamcorper.</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 templatemo-item-col all soon imp">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$64.00</span>
                      </div>
                      <a href="event-details.aspx"><img src="assets/images/meeting-02.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>28</span></h6>
                      </div>
                      <a href="event-details.aspx"><h4>Instant Lecture Design</h4></a>
                      <p>Morbi in libero blandit lectus<br>cursus ullamcorper.</p>
                    </div>
                  </div>
                </div>
                <div class="col-lg-4 templatemo-item-col all att soon">
                  <div class="meeting-item">
                    <div class="thumb">
                      <div class="price">
                        <span>$74.00</span>
                      </div>
                      <a href="event-details.aspx"><img src="assets/images/meeting-03.jpg" alt=""></a>
                    </div>
                    <div class="down-content">
                      <div class="date">
                        <h6>Nov <span>30</span></h6>
                      </div>
                      <a href="event-details.aspx"><h4>Online Social Networking</h4></a>
                      <p>Morbi in libero blandit lectus<br>cursus ullamcorper.</p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-12">
              <div class="pagination">
                <ul>
                  <li><a href="#">1</a></li>
                  <li class="active"><a href="#">2</a></li>
                  <li><a href="#">3</a></li>
                  <li><a href="#"><i class="fa fa-angle-right"></i></a></li>
                </ul>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
  </section>

</asp:Content>