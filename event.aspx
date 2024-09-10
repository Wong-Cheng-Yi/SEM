<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="event.aspx.cs" Inherits="SEM_Assignment._event" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <style>
        .pagination ul li {
            margin: 0 2px; /* Adjust margin between page numbers */
        }
    </style>

    <script type="text/javascript">
        let currentPage = 1;
        const eventsPerPage = 3; // Set the number of events per page
        let totalPages = Math.ceil(totalEvents / eventsPerPage); // Calculate the total number of pages

        function displayPagination() {
            let paginationHTML = '';

            // Generate page numbers dynamically based on the totalPages
            for (let i = 1; i <= totalPages; i++) {
                paginationHTML += `<li class="${i === currentPage ? 'active' : ''}"><a href="#" onclick="changePage(${i})">${i}</a></li>`;
            }

            document.querySelector('#pagination').innerHTML = paginationHTML;
        }

        function changePage(page) {
            if (page < 1 || page > totalPages) return;
            currentPage = page;

            // Handle disabling of 'prev' and 'next' buttons
            document.querySelector('#prevPage').style.visibility = currentPage === 1 ? 'hidden' : 'visible';
            document.querySelector('#nextPage').style.visibility = currentPage === totalPages ? 'hidden' : 'visible';

            // Load the appropriate events for the current page
            loadEventsForPage(currentPage);
            displayPagination();
        }

        // Handling 'prev' and 'next' buttons
        document.querySelector('#prevPage').addEventListener('click', () => {
            changePage(currentPage - 1);
        });

        document.querySelector('#nextPage').addEventListener('click', () => {
            changePage(currentPage + 1);
        });

        // Initial setup
        changePage(1);

    </script>

    <section class="heading-page header-text" id="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6>FOCS</h6>
                    <h2>Upcoming Events</h2>
                </div>
            </div>
        </div>
    </section>

    <section id="events" class="meetings-page">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="row">
                        <div class="col-lg-12">
                            <div class="filters">
                                <ul>
                                    <li class='<%= Request.QueryString["filter"] == null || Request.QueryString["filter"] == "all" ? "active" : "" %>'>
                                        <a href="event.aspx?filter=all">All Events</a>
                                    </li>
                                    <li class='<%= Request.QueryString["filter"] == "soon" ? "active" : "" %>'>
                                        <a href="event.aspx?filter=soon">Soon</a>
                                    </li>
                                </ul>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="row grid">
                                <asp:PlaceHolder ID="eventsPlaceholder" runat="server"></asp:PlaceHolder>
                            </div>
                        </div>
                        <div class="col-lg-12">
                            <div class="pagination">
                                <!-- Dynamic page numbers will be injected here -->
                                <asp:PlaceHolder ID="paginationPlaceholder" runat="server"></asp:PlaceHolder>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>

</asp:Content>