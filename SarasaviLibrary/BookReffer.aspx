<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookReffer.aspx.cs" Inherits="SarasaviLibrary.BookReffer" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
   <script type="text/javascript">
        $(document).ready(function () {
            $('#Button1').click(function () {
                $('#form').toggle(1000);
                $('#Grid').toggle(1000);
            });
        });
    </script>
    <input id="Button1" class="btn btn-default fixed-btn" type="button" value="Display" />
    <div class="container" id="form">
        <div class="row">
            <div class="form-horizontal">
                <div class="col-sm-8">
                    <h1>Reffering Books</h1><hr />
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Guest Name</label>
                        <div class="col-sm-7">
                        <asp:TextBox ID="txtGName" runat="server" placeholder="Guest Name" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtGName" ErrorMessage="Fields Can not be Empty" ValidationGroup="Refer"></asp:RequiredFieldValidator>
                    </div></div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Book No</label>
                        <div class="col-sm-7">
                        <asp:TextBox ID="txtBNo" runat="server" placeholder="Book No" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtBNo" ErrorMessage="Fields Can not be Empty" ValidationGroup="Refer"></asp:RequiredFieldValidator>
                    </div></div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Book Name</label>
                        <div class="col-sm-7">
                        <asp:TextBox ID="txtBName" runat="server" placeholder="Book Name"  CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtBName" ErrorMessage="Fields Can not be Empty" ValidationGroup="Refer"></asp:RequiredFieldValidator>
                    </div></div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Book Reffering Date</label>
                        <div class="col-sm-7">
                        <asp:TextBox ID="txtBRefDate" TextMode="Date" runat="server"  CssClass="form-control Date"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtBRefDate" ErrorMessage="Fields Can not be Empty" ValidationGroup="Refer"></asp:RequiredFieldValidator>
                    </div></div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Book Reffering Time</label>
                        <div class="col-sm-7">
                        <asp:TextBox ID="txtBRefTime" runat="server" CssClass="form-control Time" TextMode="Time"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtBRefTime" ErrorMessage="Fields Can not be Empty" ValidationGroup="Refer"></asp:RequiredFieldValidator>
                    </div></div>
                    <div class="form-group">
                        <label class="col-sm-4 control-label">Book Reffering End Time</label>
                        <div class="col-sm-7">
                        <asp:TextBox ID="txtBRefETime" runat="server" CssClass="form-control Time" TextMode="Time"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtBRefETime" ErrorMessage="Fields Can not be Empty" ValidationGroup="Refer"></asp:RequiredFieldValidator>
                    </div></div>
                    <div class="col-sm-offset-4">
                        <p class="text-success"><asp:Literal runat="server" ID="Success"></asp:Literal></p>
                        <p class="text-danger"><asp:Literal runat="server" ID="Error"></asp:Literal></p>
                    </div>
                    <div class="col-sm-offset-4">
                        <asp:Button ID="btnAccept" runat="server" Text="Accept" CssClass="btn btn-default" OnClick="btnAccept_Click" ToolTip="Save Reffered Books" ValidationGroup="Refer"/>
                        <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-default" OnClick="btnClear_Click" ToolTip="Clear Data"/>
                    </div>                   
                </div>
                <div class="col-sm-4" style="padding-top:100px;">
                    <asp:GridView ID="GridView2" runat="server"  CssClass="table" AllowPaging="True" AutoGenerateColumns="False" CellPadding="7" DataKeyNames="BNo" DataSourceID="SqlDataSource3" ForeColor="#333333" GridLines="None" ToolTip="Books" EnableViewState="False" OnSelectedIndexChanged="GridView2_SelectedIndexChanged" PageSize="9">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="BNo" HeaderText="BNo" ReadOnly="True" SortExpression="BNo" />
                            <asp:BoundField DataField="BName" HeaderText="BName" SortExpression="BName" />
                            <asp:CommandField ShowSelectButton="True" >
                                <ControlStyle Font-Bold="True" ForeColor="#0066FF" />
                            </asp:CommandField>
                        </Columns>
                        <EditRowStyle BackColor="White" />
                        <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                        <HeaderStyle BackColor="#088B8B" Font-Bold="True" ForeColor="White" />
                        <PagerSettings Mode="NumericFirstLast" />
                        <PagerStyle BackColor="#088B8B" ForeColor="Blue" HorizontalAlign="Center" />
                        <RowStyle BackColor="White" />
                        <SelectedRowStyle BackColor="White" Font-Bold="True" ForeColor="#0066FF" />
                        <SortedAscendingCellStyle BackColor="#F8FAFA" />
                        <SortedAscendingHeaderStyle BackColor="#246B61" />
                        <SortedDescendingCellStyle BackColor="#D4DFE1" />
                        <SortedDescendingHeaderStyle BackColor="#15524A" />
                    </asp:GridView>
                    <asp:SqlDataSource ID="SqlDataSource3" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [BNo], [BName] FROM [BRegistration]"></asp:SqlDataSource>
                </div>
            </div>
        </div>
    </div>
    <div class="container" id="Grid" style="display:none;">
        <div class="row">
            <div class="col-sm-12">
            <h1>Book Refer Details</h1>
            <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="7" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" PageSize="10" ToolTip="Book Refer Details and Update, Detele the Data">
                <AlternatingRowStyle BackColor="White" />
                <Columns>                
                    <asp:BoundField DataField="UserName" HeaderText="UserName" SortExpression="UserName" ReadOnly="True">
                    </asp:BoundField>
                    <asp:BoundField DataField="BNo" HeaderText="BNo" SortExpression="BNo" ReadOnly="True">
                    </asp:BoundField>
                    <asp:BoundField DataField="BName" HeaderText="BName" SortExpression="BName" ReadOnly="True">
                    </asp:BoundField>
                    <asp:BoundField DataField="RefDate" HeaderText="RefDate" SortExpression="RefDate" >
                    <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:BoundField DataField="RefTime" HeaderText="RefTime" SortExpression="RefTime" >
                    <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:BoundField DataField="RefEndTime" HeaderText="RefEndTime" SortExpression="RefEndTime" >
                    <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                </Columns>
                <EditRowStyle BackColor="White" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerSettings PageButtonCount="5" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />
            </asp:GridView>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [UserName], [BNo], [BName], [RefDate], [RefTime], [RefEndTime] FROM [BReffer]" UpdateCommand="UPDATE [BReffer] SET [RefDate]=@RefDate, [RefTime]=@RefTime, [RefEndTime]=@RefEndTime WHERE @UserName=[UserName] AND @BNo=[BNo]" DeleteCommand="DELETE FROM [BReffer] WHERE @UserName=[UserName] AND @BNo=[BNo]">
            </asp:SqlDataSource>
        </div>
        </div>
    </div>

</asp:Content>
