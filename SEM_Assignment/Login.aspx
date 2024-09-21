<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SEM_Assignment.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <section class="heading-page header-text" id="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6>Administrator Login</h6>
                </div>
            </div>
        </div>
    </section>
    <div class=" my-3 d-flex justify-content-center align-items-center">
        <div>
            <asp:Login ID="Login1" runat="server" DisplayRememberMe="False" DestinationPageUrl="~/home.aspx">
                <LayoutTemplate>
                    <div class="container d-flex justify-content-center">
                        <div class="card shadow-sm" style="width: 400px;">
                            <div class="card-body">
                                <h3 class="text-center text-primary mb-4">Log In</h3>

                                <!-- Username Input -->
                                <div class="form-group">
                                    <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" class="form-label">User Name:</asp:Label>
                                    <asp:TextBox ID="UserName" runat="server" CssClass="form-control" placeholder="Enter your username"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="Login1" CssClass="text-danger"></asp:RequiredFieldValidator>
                                </div>

                                <!-- Password Input -->
                                <div class="form-group">
                                    <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password" class="form-label">Password:</asp:Label>
                                    <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control" placeholder="Enter your password"></asp:TextBox>
                                    <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="Login1" CssClass="text-danger"></asp:RequiredFieldValidator>
                                </div>

                               
                                <div class="form-group text-center text-danger">
                                    <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                                </div>

                   
                                <div class="d-grid gap-2">
                                    <asp:Button ID="LoginButton" runat="server" CommandName="Login" Text="Log In" CssClass="btn btn-primary btn-block" ValidationGroup="Login1" OnClick="LoginButton_Click" />
                                </div>

                                <div class="d-grid gap-2">
                                    <asp:HyperLink ID="HyperLink1" runat="server" Text="Forget Password?" NavigateUrl="~/PasswordRecovery.aspx"></asp:HyperLink>
                                </div>
                            </div>
                        </div>
                    </div>
                </LayoutTemplate>
            </asp:Login>


        </div>
    </div>
</asp:Content>
