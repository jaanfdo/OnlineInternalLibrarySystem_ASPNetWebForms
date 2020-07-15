<%@ Page Title="Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Registration.aspx.cs" Inherits="SarasaviLibrary.Registration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container" style="padding-top:40px;">    
    <div class="col-sm-8 col-sm-offset-2">
        <h1>Create a new account</h1>
        <hr />
        <div class="form-horizontal">
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-3 control-label" Font-Bold="true">First Name</asp:Label>
            <div class="col-md-9">
                <asp:TextBox runat="server" ID="txtFName" CssClass="form-control" placeholder="First Name"/>
            </div>
        </div>
          <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-3 control-label" Font-Bold="true">Last Name</asp:Label>
            <div class="col-md-9">
                <asp:TextBox runat="server" ID="txtLName" CssClass="form-control" placeholder="Last Namee"/>
            </div>
        </div>
          <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-3 control-label" Font-Bold="true">User Name</asp:Label>
            <div class="col-md-9">
                <asp:TextBox runat="server" ID="txtUName" CssClass="form-control" placeholder="User Name"/>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtUName" CssClass="text-danger" ErrorMessage="User Name Cannot Be Empty" ValidationGroup="Registration"></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-3 control-label" Font-Bold="true">Email</asp:Label>
            <div class="col-md-9">
                <asp:TextBox runat="server" ID="txtEmail" CssClass="form-control" TextMode="Email" placeholder="Email"/>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtEmail" CssClass="text-danger" ErrorMessage="The email field is required." ValidationGroup="Registration" ></asp:RequiredFieldValidator>
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-3 control-label" Font-Bold="true">Password</asp:Label>
            <div class="col-md-9">
                <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" CssClass="form-control" placeholder="Password"/>
                <asp:RequiredFieldValidator runat="server" Display="Dynamic" ControlToValidate="txtPassword" CssClass="text-danger" ErrorMessage="The password field is required." ValidationGroup="Registration"></asp:RequiredFieldValidator>
            </div>  
        </div>
        <div class="form-group">
            <asp:Label runat="server" CssClass="col-md-3 control-label" Font-Bold="true">Confirm password</asp:Label>
            <div class="col-md-9">
                <asp:TextBox runat="server" ID="txtConfirmPassword" TextMode="Password" CssClass="form-control" placeholder="Confirm Password"/>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." ValidationGroup="Registration" ></asp:RequiredFieldValidator>
                <asp:CompareValidator runat="server" ControlToCompare="txtPassword" ControlToValidate="txtConfirmPassword" CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." ValidationGroup="Registration" ></asp:CompareValidator>
            </div>
        </div>
        <p class="text-danger col-md-offset-3">
            <asp:Literal runat="server" ID="ErrorMessage" />
        </p>
        <p class="text-success col-md-offset-3">
            <asp:Literal runat="server" ID="SuccessMessage" />
        </p>

        <div class="form-group">
            <div class="col-md-offset-3 col-md-9">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Register" CssClass="btn btn-default" ID="btnRegister" ValidationGroup="Registration" ToolTip="Save Registration Details" />
                <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CssClass="btn btn-default" ToolTip="Clear Data"/>
            </div>
        </div>
        <div class="col-md-10">
            <p><asp:HyperLink runat="server" NavigateUrl="~/Login.aspx" ViewStateMode="Disabled">Login, All Ready You Have Account?</asp:HyperLink></p>
        </div>
        </div>
    </div>
</div>
</asp:Content>
