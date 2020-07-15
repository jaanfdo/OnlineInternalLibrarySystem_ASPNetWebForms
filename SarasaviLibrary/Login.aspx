<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="SarasaviLibrary.Login" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="padding-top:40px;">
    <div class="row">        
        <div class="col-md-8 col-sm-offset-2">
            <h1>Login</h1>
            <section id="loginForm">
                <div class="form-horizontal">
                    <hr />
                    <p class="label label-success" style="font-size:14px;">You have to Refer book or Barrow book then you can Login with System</p><br /><br />
                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label" Font-Bold="true">User Name</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txtUName" CssClass="form-control" ToolTip="User Name"/>
                            <asp:RequiredFieldValidator ID="valUName" runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtUName" ErrorMessage="User Name Can't Be Empty"></asp:RequiredFieldValidator>
                        </div>
                    </div>
                    <div class="form-group">
                        <asp:Label runat="server" CssClass="col-md-2 control-label" Font-Bold="true">Password</asp:Label>
                        <div class="col-md-10">
                            <asp:TextBox runat="server" ID="txtPass" TextMode="Password" CssClass="form-control" ToolTip="Password" />
                            <asp:RequiredFieldValidator ID="valPass" ControlToValidate="txtPass"  Display="Dynamic" runat="server" CssClass="text-danger" ErrorMessage="Password Can't Be Empty"></asp:RequiredFieldValidator>
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
                            <p class="text-danger"><asp:Literal runat="server" Visible="false" ID="FailureText" /></p>
                            <p class="text-success"><asp:Literal runat="server" Visible="false" ID="Message" /></p>
                        </div>
                    </div>
                    <div class="form-group">
                        <div class="col-md-offset-2 col-md-10">
                            <asp:Button runat="server" OnClick="LogIn" Text="Log in" CssClass="btn btn-default" ToolTip="To Login" />
                        </div>
                    </div>
                    <asp:PlaceHolder runat="server" ID="ErrorMessage" Visible="false">
                            <asp:Label ID="lbl1" runat="server"></asp:Label><br />
                            <asp:Label ID="lbl2" runat="server"></asp:Label><br />
                            <asp:Label ID="lbl4" runat="server"></asp:Label><br />
                            <asp:Label ID="lbl5" runat="server"></asp:Label><br />
                    </asp:PlaceHolder>
                </div>      
                <div class="col-md-4">
                <p><asp:HyperLink runat="server" ID="RegisterHyperLink" NavigateUrl="~/Registration.aspx" ViewStateMode="Disabled">Register as a new user</asp:HyperLink></p>
                </div>
            </section>
        </div>

        
    </div>
    </div>
</asp:Content>
