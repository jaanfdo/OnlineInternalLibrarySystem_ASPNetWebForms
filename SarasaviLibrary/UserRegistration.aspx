<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="UserRegistration.aspx.cs" Inherits="SarasaviLibrary.UserRegistration" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
    <div class="row">
            <div class="col-sm-7 form-horizontal">
                <div class="col-sm-offset-1">
                    <h1>Member Registration</h1>
                </div>
                <hr />
                <div class="form-group">
                    <label class="col-sm-3 control-label">Member No</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtMNo" runat="server"  CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Member Name</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtMName" runat="server" placeholder="Member Name" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rfv1" runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtMName" ErrorMessage="Fields Can not be Empty">
                    </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">User Name</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtUName" runat="server" placeholder="User Name" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtUName" ErrorMessage="Fields Can not be Empty">
                    </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Address</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtAddress" TextMode="MultiLine" placeholder="Address....." rows="4" runat="server" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtAddress" ErrorMessage="Fields Can not be Empty">
                    </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Gender</label>
                    <div class="col-sm-7">
                        <asp:RadioButtonList ID="rdoGender" runat="server">
                            <asp:ListItem Text="Male" Selected="True"></asp:ListItem>
                            <asp:ListItem Text="Female"></asp:ListItem>
                        </asp:RadioButtonList>    
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">NIC No</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtNIC" runat="server" placeholder="NIC No" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtNIC" ErrorMessage="Fields Can not be Empty">
                    </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Telephone No</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtTelNo" runat="server" placeholder="Telephone No" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtTelNo" ErrorMessage="Fields Can not be Empty">
                    </asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="col-sm-offset-3">
                    <p class="text-success"><asp:Literal runat="server" ID="SuccessText" /></p>
                    <p class="text-danger"><asp:Literal runat="server" ID="FailerText" /></p>
                </div>
                
                <div class="form-group">
                    <div class="col-sm-offset-3 col-sm-4">
                        <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-default" OnClick="btnSave_Click" ToolTip="Save Member Registration Details"/>
                        <asp:Button ID="btnClear" runat="server" Text="Clear" OnClick="btnClear_Click" CssClass="btn btn-default" ToolTip="Clear Data"/>
                    </div>
                </div>
            </div>
            </div>
        </div>
</asp:Content>
