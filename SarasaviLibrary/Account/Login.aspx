<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SarasaviLibrary.Account.Login" Async="true" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">

    
    <div class="container">
    <div class="row">        
        <div class="col-md-8">
            <h2>Login</h2>
            <section id="loginForm">
                <div class="form-horizontal">
                    <hr />
                      <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                        <p class="text-danger">
                            <asp:Literal runat="server" ID="FailureText" />
                        </p>
                    </asp:PlaceHolder>
                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label">User Name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txtUName" CssClass="form-control"/>
                            <asp:RequiredFieldValidator ID="valUName" runat="server" Visible="false" CssClass="text-danger" ControlToValidate="txtUName" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txtPass" TextMode="Password" CssClass="form-control" />
                            <asp:RequiredFieldValidator ID="valPass" ControlToValidate="txtPass"  Visible="false" runat="server" CssClass="text-danger" ErrorMessage="RequiredFieldValidator"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <div class="checkbox">
                                <asp:CheckBox runat="server" ID="RememberMe" />
                                <asp:Label runat="server" AssociatedControlID="RememberMe">Remember me?</asp:Label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" />
                        </div>
                    </div>
                </div> 
                <div class="col-md-10">
                <p>
                    <asp:HyperLink runat="server" ID="ForgotPasswordHyperLink" ViewStateMode="Disabled">Forgot your password?</asp:HyperLink>
                </p>
                    </div>
            </section>
        </div>

        <div class="col-md-4">
            <p>
                <asp:HyperLink runat="server" ID="RegisterHyperLink" ViewStateMode="Disabled">Register as a new user</asp:HyperLink>
            </p>
        </div>
    </div>
    </div>
</asp:Content>
