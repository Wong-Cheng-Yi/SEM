<%@ Page Title="" Language="C#" MasterPageFile="~/HeaderAndFooter.Master" AutoEventWireup="true" CodeBehind="CreateUser.aspx.cs" Inherits="SEM_Assignment.CreateUser" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentPlaceHolder" runat="server">

    <section class="heading-page header-text" id="top">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <h6>Administrator</h6>
                    <h2>Create New User</h2>
                </div>
            </div>
        </div>
    </section>


    <div class="container mt-5 my-3">
        <div  class="row justify-content-center" >
            <div class="col-md-6 col-lg-5 bg-light p-4 shadow rounded">
                <asp:CreateUserWizard runat="server" ID="ctl10">
                    <wizardsteps>
                        <asp:CreateUserWizardStep runat="server">
                            <ContentTemplate>
                                <div class="d-flex justify-content-center align-items-center" >
                                    <div>
                                        <h2 class="text-center mb-4">Sign Up for Your New Account</h2>
                                        <div class="mb-3 row">
                                            <label for="UserName" class="col-sm-4 col-form-label text-end">User Name:</label>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="UserName" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server" ControlToValidate="UserName" ErrorMessage="User Name is required." ToolTip="User Name is required." ValidationGroup="ctl10" CssClass="text-danger">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="Password" class="col-sm-4 col-form-label text-end">Password:</label>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="Password" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="PasswordRequired" runat="server" ControlToValidate="Password" ErrorMessage="Password is required." ToolTip="Password is required." ValidationGroup="ctl10" CssClass="text-danger">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="ConfirmPassword" class="col-sm-4 col-form-label text-end">Confirm Password:</label>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="ConfirmPassword" runat="server" TextMode="Password" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="ConfirmPasswordRequired" runat="server" ControlToValidate="ConfirmPassword" ErrorMessage="Confirm Password is required." ToolTip="Confirm Password is required." ValidationGroup="ctl10" CssClass="text-danger">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="mb-3 row">
                                            <label for="Email" class="col-sm-4 col-form-label text-end">E-mail:</label>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="Email" runat="server" CssClass="form-control"></asp:TextBox>
                                                <asp:RequiredFieldValidator ID="EmailRequired" runat="server" ControlToValidate="Email" ErrorMessage="E-mail is required." ToolTip="E-mail is required." ValidationGroup="ctl10" CssClass="text-danger">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="mb-3 row" style="display: none;">
                                            <label for="Question" class="col-sm-4 col-form-label text-end">Security Question:</label>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="Question" runat="server" CssClass="form-control">Not Yet</asp:TextBox>
                                                <asp:RequiredFieldValidator ID="QuestionRequired" runat="server" ControlToValidate="Question" ErrorMessage="Security question is required." ToolTip="Security question is required." ValidationGroup="ctl10" CssClass="text-danger">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="mb-3 row" style="display: none;">
                                            <label for="Answer" class="col-sm-4 col-form-label text-end">Security Answer:</label>
                                            <div class="col-sm-6">
                                                <asp:TextBox ID="Answer" runat="server" CssClass="form-control">Not Yet</asp:TextBox>
                                                <asp:RequiredFieldValidator ID="AnswerRequired" runat="server" ControlToValidate="Answer" ErrorMessage="Security answer is required." ToolTip="Security answer is required." ValidationGroup="ctl10" CssClass="text-danger">*</asp:RequiredFieldValidator>
                                            </div>
                                        </div>
                                        <div class="row mb-3" >
                                            <div class="col-sm-12 text-center">
                                                <asp:CompareValidator ID="PasswordCompare" runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword" Display="Dynamic" ErrorMessage="The Password and Confirmation Password must match." ValidationGroup="ctl10" CssClass="text-danger"></asp:CompareValidator>
                                            </div>
                                        </div>
                                        <div class="row mb-3" >
                                            <div class="col-sm-12 text-center text-danger">
                                                <asp:Literal ID="ErrorMessage" runat="server" EnableViewState="False"></asp:Literal>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                            <CustomNavigationTemplate>
                                <table border="0" cellspacing="5" style="width:100%;height:100%;">
                                    <tr align="right">
                                        <td align="right" colspan="0">
                                            <asp:Button ID="StepNextButton" runat="server" CommandName="MoveNext" Text="Create User" ValidationGroup="ctl10" CssClass="btn btn-primary" />
                                        </td>
                                    </tr>
                                </table>
                            </CustomNavigationTemplate>
                        </asp:CreateUserWizardStep>
                        <asp:CompleteWizardStep runat="server">

                            <ContentTemplate>
                                <div class="container">
                                    <div class="row justify-content-center">
                                        <div class="col-md-12">
                                            <div class="card shadow-sm">
                                                <div class="card-body text-center">
                                                    <p>Your account has been successfully created.</p>
                                                    <div class="text-center">
                                                        <asp:Button ID="ContinueButton" runat="server" CausesValidation="False" CommandName="Continue" Text="Continue" CssClass="btn btn-primary" OnClientClick="btn_Next" />
                                                    </div>
                                                 </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </ContentTemplate>
                        </asp:CompleteWizardStep>
                    </wizardsteps>
                </asp:CreateUserWizard>
            </div>
            
        </div>

    </div>
    


</asp:Content>
