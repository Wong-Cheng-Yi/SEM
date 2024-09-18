<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="event-management.aspx.cs" Inherits="SEM_Assignment.event_management" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <style>
        .crud-section {
            margin-bottom: 50px;
        }

        .gridview {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            font-size: 18px;
            min-width: 1000px;
            background-color: #fff;
        }

            /* Ensure header styling */
            .gridview th, .gridview td {
                padding: 12px 15px;
                text-align: left;
                border-bottom: 1px solid #ddd;
            }

            .gridview th {
                background-color: #0080B2;
                color: white;
                font-weight: bold;
            }

            .gridview td {
                background-color: #f9f9f9;
            }

        .date-field {
            text-align: center;
            white-space: nowrap;
        }

        .gridview-pager {
            padding: 10px;
            text-align: center;
        }

            .gridview-pager a {
                margin: 0 5px;
                padding: 8px 12px;
                background-color: #0080B2;
                color: white;
                text-decoration: none;
                border-radius: 5px;
            }

                .gridview-pager a.selected {
                    background-color: black;
                }

                .gridview-pager a:hover {
                    background-color: #E51B24;
                }
    </style>

    <!-- Modal for creating a new event -->
    <div class="modal fade" id="createEventModal" tabindex="-1" aria-labelledby="createEventModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
                <div class="modal-header">
                    <h5 class="modal-title" id="createEventModalLabel">Create New Event</h5>
                    <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                </div>
                <div class="modal-body">
                    <!-- Form to create a new event inside modal -->
                    <label for="NewEventName">Event Name:</label>
                    <asp:TextBox ID="NewEventName" runat="server" CssClass="form-control" />
                    <br />

                    <label for="NewStartDate">Start Date:</label>
                    <asp:TextBox ID="NewStartDate" runat="server" TextMode="Date" CssClass="form-control" />
                    <br />

                    <label for="NewEndDate">End Date:</label>
                    <asp:TextBox ID="NewEndDate" runat="server" TextMode="Date" CssClass="form-control" />
                    <br />

                    <label for="NewContent">Content:</label>
                    <asp:TextBox ID="NewContent" runat="server" TextMode="MultiLine" Rows="5" CssClass="form-control" />
                </div>
                <div class="modal-footer">
                    <asp:Button ID="ConfirmCreateEventButton" runat="server" Text="Confirm" OnClick="CreateNewEvent_Click" CssClass="btn btn-primary" />
                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        // JavaScript to show the modal when the button is clicked
        function showCreateEventForm() {
            var createEventModal = new bootstrap.Modal(document.getElementById('createEventModal'));
            createEventModal.show();
        }
    </script>

    <section class="heading-page header-text" id="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6>Administrator</h6>
                    <h2>Event Management</h2>
                </div>
            </div>
        </div>
    </section>

    <div class="container">

        <!-- Create Event Button -->
        <div style="margin-top: 20px;">
            <asp:Button ID="CreateNewEventButton" runat="server" Text="Create New Event" OnClientClick="showCreateEventForm(); return false;" CssClass="btn btn-danger" />
        </div>

        <!-- GridView for event management -->
        <asp:GridView ID="EventGridView" runat="server" AutoGenerateColumns="False" AllowPaging="True" PageSize="5" CssClass="gridview" DataKeyNames="eventID"
            OnRowEditing="EventGridView_RowEditing"
            OnRowUpdating="EventGridView_RowUpdating"
            OnRowCancelingEdit="EventGridView_RowCancelingEdit"
            OnRowDeleting="EventGridView_RowDeleting"
            OnPageIndexChanging="EventGridView_PageIndexChanging">

            <Columns>
                <asp:BoundField DataField="eventID" HeaderText="ID" ReadOnly="True" Visible="False" />

                <asp:TemplateField HeaderText="Event Name">
                    <ItemTemplate>
                        <%# Eval("eventName") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEventName" runat="server" Text='<%# Bind("eventName") %>' Columns="40" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Start Date">
                    <ItemTemplate>
                        <span class="date-field"><%# Eval("startDate", "{0:d/M/yyyy}") %></span>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtStartDate" runat="server" Text='<%# Bind("startDate", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="End Date">
                    <ItemTemplate>
                        <span class="date-field"><%# Eval("endDate", "{0:d/M/yyyy}") %></span>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtEndDate" runat="server" Text='<%# Bind("endDate", "{0:yyyy-MM-dd}") %>' TextMode="Date" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField HeaderText="Details">
                    <ItemTemplate>
                        <%# Eval("content") %>
                    </ItemTemplate>
                    <EditItemTemplate>
                        <asp:TextBox ID="txtContent" runat="server" Text='<%# Bind("content") %>' TextMode="MultiLine" Rows="10" Columns="50" />
                    </EditItemTemplate>
                </asp:TemplateField>

                <asp:CommandField ShowEditButton="True" />
                <asp:CommandField ShowDeleteButton="True" />
            </Columns>
            <HeaderStyle CssClass="gridview-header" />
            <PagerStyle CssClass="gridview-pager" />
        </asp:GridView>
    </div>

</asp:Content>
