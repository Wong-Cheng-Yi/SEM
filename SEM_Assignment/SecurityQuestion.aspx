<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="SecurityQuestion.aspx.cs" Inherits="SEM_Assignment.SecurityQuestion" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Reset Security Question</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">


    <!-- Additional CSS Files -->
    <link rel="stylesheet" href="assets/css/fontawesome.css">
    <link rel="stylesheet" href="assets/css/templatemo-edu-meeting.css">
    <link rel="stylesheet" href="assets/css/owl.css">
    <link rel="stylesheet" href="assets/css/lightbox.css">
</head>
<body>
    <form id="form1" runat="server">
        <div class="container mt-5">
            <div class="row justify-content-center">
                <div class="col-md-6">
                    <div class="card">
                        <div class="card-header bg-primary text-white">
                            <h4>Please Set Your Security Question</h4>
                        </div>
                        <div class="card-body">
                            <%--<asp:Label ID="LabelPassword" runat="server" Text="Password:" CssClass="form-label" />
                            <asp:TextBox ID="txtPassword" runat="server" TextMode="Password" CssClass="form-control mb-3"/>--%>
                    
                            <asp:Label ID="lblQuestion" runat="server" Text="Security Question:" CssClass="form-label" />
                            <asp:DropDownList ID="QuestionDropDownList" runat="server" CssClass="form-control"></asp:DropDownList>
                            <%--<asp:TextBox ID="txtQuestion" runat="server" CssClass="form-control mb-3" placeholder="What is my pet's name?" />
                            <asp:DropDownList ></asp:DropDownList>--%>
                    
                            <asp:Label ID="lblAnswer" runat="server" Text="Security Answer:" CssClass="form-label" />
                            <asp:TextBox ID="txtAnswer" runat="server" CssClass="form-control mb-3" />
                    
                            <asp:Button ID="btnSubmit" runat="server" Text="Submit" CssClass="btn btn-primary" OnClick="btnSubmit_Click" />
                            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger" />
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
</body>
</html>
