<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="EventBcast.aspx.cs" Inherits="SEM_Assignment.EventBcast" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <style>
        .emailGrid {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                font-size: 16px;
                text-align: left;
            }

            .emailGrid th, .emailGrid td {
                padding: 12px 15px; /* Add padding for spacing */
                border: 1px solid #ddd; /* Add border to cells */
            }

            .emailGrid th {
                background-color: #f4f4f4; /* Light gray background for headers */
            }

            .emailGrid .gridHeader {
                font-weight: bold;
                background-color: #f2f2f2; /* Light background for header */
            }

            .emailGrid .gridItem {
                background-color: #fff; /* White background for items */
            }

            .emailGrid .btn {
                padding: 6px 12px; /* Add padding for the button */
                border: none;
                border-radius: 4px; /* Rounded corners */
                cursor: pointer;
            }

            .emailGrid .btn-danger {
                background-color: #dc3545; /* Bootstrap danger color */
                color: white; /* White text for the button */
            }

            .emailGrid .btn-danger:hover {
                background-color: #c82333; /* Darker on hover */
            }

    </style>

    <section class="heading-page header-text" id="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6>Administrator</h6>
                    <h2>Boardcast Events</h2>
                </div>
            </div>
        </div>
    </section>

    <div>
        <div class="container mt-5 my-3">
        <div  class="row justify-content-center" >
            <div class="col-md-6 col-lg-5 bg-light p-4 shadow rounded">
        
                            <ContentTemplate>
                                <div class="d-flex justify-content-center align-items-center" >
                                    <div>   
                                            <h3  class="text-center mb-4">Boardcast Event</h3>

                                            <!-- Event Link Input -->
                                            <label for="txtEventLink">Event Link:</label>
                                            <asp:TextBox ID="txtEventLink" runat="server" Width="400px"   placeholder="Paste the event link here"/>
                                            <br /><br />

                                            <!-- Broadcast Button -->
                                            <div class="d-flex justify-content-center align-items-center">
                                                <asp:Button ID="btnBroadcast" runat="server" Text="Broadcast Event" OnClick="btnBroadcast_Click" CssClass="btn-broadcast" />
                                            </div>

                                            <!-- Status Message -->
                                            <asp:Label ID="lblStatus" runat="server" ForeColor="Red" />

                                            <hr style="color: red; width: 100%; height: 3px;">

                                            <!-- Search Function -->
                                            <label for="txtSearch">Search Email:</label>
                                            <asp:TextBox ID="txtSearch" runat="server" Width="300px" />
                                            <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
                                            <br /><br />

                                            <!-- Add Email Input -->
                                            <label for="txtEmail">Add Email:</label>
                                            <asp:TextBox ID="txtEmail" runat="server" Width="300px" />
                                            <asp:Button ID="btnAddEmail" runat="server" Text="Add Email" OnClick="btnAddEmail_Click" />
                                            <br /><br />

                                            <!-- Email List Table with Select All Option -->
                                            <asp:CheckBox ID="chkSelectAll" runat="server" Text="Select All" AutoPostBack="true" OnCheckedChanged="chkSelectAll_CheckedChanged" />

                                        <div class="d-flex justify-content-center align-items-center" style="width: 100%;">
                                           <asp:GridView ID="gvEmailList" runat="server" AutoGenerateColumns="False" DataKeyNames="Email" 
                                            OnRowDeleting="gvEmailList_RowDeleting" CssClass="emailGrid">
                                            <Columns>
                                                <asp:TemplateField HeaderText="Select">
                                                    <ItemTemplate>
                                                        <asp:CheckBox ID="chkSelectEmail" runat="server" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                                <asp:BoundField DataField="RowNumber" HeaderText="No." HeaderStyle-CssClass="gridHeader" ItemStyle-CssClass="gridItem" />
                                                <asp:BoundField DataField="Email" HeaderText="Email" HeaderStyle-CssClass="gridHeader" ItemStyle-CssClass="gridItem" />
                                                <asp:TemplateField HeaderText="Action" HeaderStyle-CssClass="gridHeader">
                                                    <ItemTemplate>
                                                        <asp:Button ID="btnDeleteEmail" runat="server" CommandName="Delete" Text="Delete" CssClass="btn btn-danger" />
                                                    </ItemTemplate>
                                                </asp:TemplateField>
                                            </Columns>
                                        </asp:GridView>
                                        </div>
                                    

                                    </div>
                            </ContentTemplate>



              
            </div>
            
        </div>

    </div>
        </div>


   

</asp:Content>
