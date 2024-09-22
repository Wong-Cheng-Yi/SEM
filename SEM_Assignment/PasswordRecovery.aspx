<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="PasswordRecovery.aspx.cs" Inherits="SEM_Assignment.PasswordRecovery" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">
    <section class="heading-page header-text" id="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6>Password Recovery</h6>
                </div>
            </div>
        </div>
    </section>
    <div class="container-fluid d-flex align-items-center justify-content-center min-vh-100">
        <div class="row justify-content-center">
            <div class="col-12">
                <div class="card">
                    <div class="card-header bg-primary text-white text-center">
                        <h5>Identity Confirmation</h5>
                    </div>
                    <div class="card-body">
                        <div class="justify-content-center">
                            <asp:PasswordRecovery ID="PasswordRecovery3" runat="server">
                                <MailDefinition BodyFileName="~/EmailTemplate/EmailTEmplate.txt" From="no-reply@gmail.com" Subject="Password Recovery">
                                </MailDefinition>
                
                                <QuestionTemplate>
                                    <div class="text-center mb-4">
                                        <p>Answer the following question to receive your password.</p>
                                    </div>
                                    <div class="mb-3">
                                        <asp:Label ID="Label3" runat="server" Text="User Name:" CssClass="form-label" />
                                        <asp:Literal ID="UserName" runat="server"></asp:Literal>
                                    </div>
                                    <div class="mb-3">
                                        <asp:Label ID="Label4" runat="server" Text="Question:" CssClass="form-label" />
                                        <asp:Literal ID="Question" runat="server" ></asp:Literal>
                                    </div>
                                    <div class="mb-3">
                                        <asp:Label ID="AnswerLabel" runat="server" AssociatedControlID="Answer" CssClass="form-label">Answer:</asp:Label>
                                        <asp:TextBox ID="Answer" runat="server" CssClass="form-control" />
                                        <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Answer is required." ToolTip="Answer is required." ValidationGroup="PasswordRecovery3" CssClass="text-danger" />
                                    </div>
                                    <div class="mb-3">
                                        <asp:Label ID="FailureText" runat="server" EnableViewState="False" CssClass="form-label text-danger"></asp:Label>
                                    </div>
                                    <div class="text-center">
                                        <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" Text="Submit" ValidationGroup="PasswordRecovery3" CssClass="btn btn-primary" />
                                    </div>
                                </QuestionTemplate>

                                <SuccessTemplate>
                                    <div class="text-center mb-4">
                                        <p>Your password has been sent to you.</p>
                                        <asp:Button ID="Exit" runat="server" Text="Exit" OnClick="Exit_Click" CssClass="btn btn-secondary" />
                                    </div>
                                </SuccessTemplate>

                                <UserNameTemplate>
                                    <div class="text-center mb-4">
                                        <asp:Label ID="Label1" runat="server" Text="Identity Confirmation" CssClass="form-label" />
                                        <p>Enter your User Name to receive your password.</p>
                                    </div>
                                    <div class="mb-3">
                                        <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName" CssClass="form-label">User Name:</asp:Label>
                                        <asp:TextBox ID="UserName" runat="server" CssClass="form-control" />
                                        <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="PasswordRecovery3" CssClass="text-danger" />
                                    </div>
                                    <div class="text-center mb-3">
                                        <asp:Label ID="FailureText" EnableViewState="False" runat="server" CssClass="form-label text-danger"></asp:Label>
                                    
                                    </div>
                                    <div class="text-center">
                                        <asp:Button ID="SubmitButton" runat="server" CommandName="Submit" CssClass="btn btn-primary" Text="Submit" ValidationGroup="PasswordRecovery3" />
                                    </div>
                                </UserNameTemplate>
                            </asp:PasswordRecovery>
                        </div>
                    
                    </div>
                </div>
            </div>
        </div>
    </div>





</asp:Content>
