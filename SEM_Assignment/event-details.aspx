<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="event-details.aspx.cs" Inherits="SEM_Assignment.event_details" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <section class="heading-page header-text" id="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6>Here are the</h6>
                    <h2>Event Details</h2>
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
                            <div class="meeting-single-item">
                                <div class="thumb">
                                    <div class="price">
                                        <span id="priceSpan" runat="server"></span>
                                        <!-- Day of week will be shown here -->
                                    </div>
                                    <div class="date">
                                        <h6 id="dateSpan" runat="server"></h6>
                                        <!-- Date will be shown here -->
                                    </div>
                                    <a href="event.aspx">
                                        <img src="assets/images/single-meeting.jpg" alt=""></a>
                                </div>
                                <div class="down-content">
                                    <h4 id="eventTitle" runat="server"></h4>
                                    <!-- Event title will be shown here -->
                                    <p>FOCS Event</p>
                                    <p id="eventContent" runat="server" class="description"></p>
                                    <!-- Event content will be shown here -->
                                    <div class="row">
                                        <div class="col-lg-4">
                                            <div class="hours">
                                                <h5>Time</h5>
                                                <p>09:00 AM - 5:00 PM</p>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="location">
                                                <h5>Location</h5>
                                                <p>
                                                    Tunku Abdul Rahman University of Management and Technology (TAR UMT),<br>
                                                    Bangunan Tun Tan Siew Sin,<br>
                                                    53100 Kuala Lumpur,<br>
                                                    Federal Territory of Kuala Lumpur.
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-lg-4">
                                            <div class="book now">
                                                <h5>Contacts</h5>
                                                <p>
                                                    016-4472169<br>
                                                    012-8852169
                                                </p>
                                            </div>
                                        </div>
                                        <div class="col-lg-12">
                                            <div class="share">
                                                <h5>Share:</h5>
                                                <ul>
                                                    <li><a href="https://www.facebook.com/">Facebook</a>,</li>
                                                    <li><a href="https://x.com/">Twitter</a></li>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="main-button-red">
                                <a href="event.aspx">Back To Events List</a>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>
