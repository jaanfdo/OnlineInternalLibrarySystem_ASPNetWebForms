<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookBarrow.aspx.cs" Inherits="SarasaviLibrary.BookBarrow" %>
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
                    <h1>Barrow Books</h1>
                <hr />
                <div class="form-group">
                    <label class="col-sm-3 control-label">Member No</label>
                    <div class="col-sm-4">
                    <asp:TextBox ID="txtMNo" runat="server" placeholder="Member No" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtMNo" ErrorMessage="Fields Can not be Empty" ValidationGroup="Barrow"></asp:RequiredFieldValidator>
                    </div></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Member Name</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtMName" runat="server" placeholder="Member Name" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtMName" ErrorMessage="Fields Can not be Empty" ValidationGroup="Barrow"></asp:RequiredFieldValidator>
                    </div></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Book No</label>
                    <div class="col-sm-4">
                    <asp:TextBox ID="txtBNo" runat="server" placeholder="Book No" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtBNo" ErrorMessage="Fields Can not be Empty" ValidationGroup="Barrow"></asp:RequiredFieldValidator>
                    </div></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Book Name</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtBName" runat="server" placeholder="Book Name" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtBName" ErrorMessage="Fields Can not be Empty" ValidationGroup="Barrow"></asp:RequiredFieldValidator>
                    </div></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">No of Copies</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtNACopies" runat="server" placeholder="No of Copies" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtNACopies" ErrorMessage="Fields Can not be Empty" ValidationGroup="Barrow"></asp:RequiredFieldValidator>
                    </div></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Issue Date</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtIDate" TextMode="Date" runat="server" CssClass="form-control Date"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtIDate" ErrorMessage="Fields Can not be Empty" ValidationGroup="Barrow"></asp:RequiredFieldValidator>
                    </div></div>
                <div class="form-group">
                    <label class="col-sm-3 control-label">Due Date</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtDDate" TextMode="Date" runat="server" CssClass="form-control Date"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtDDate" ErrorMessage="Fields Can not be Empty" ValidationGroup="Barrow"></asp:RequiredFieldValidator>
                    </div></div>
                <div class="col-sm-offset-4">
                    <p class="text-success"><asp:Literal runat="server" ID="Success"></asp:Literal></p>
                    <p class="text-danger"><asp:Literal runat="server" ID="Error"></asp:Literal></p>
                </div>
                <div class="col-sm-offset-3 col-sm-8">
                    <asp:Button ID="btnAccept" runat="server" Text="Accept" CssClass="btn btn-default" OnClick="btnAccept_Click" ToolTip="Save Borrow Books" ValidationGroup="Barrow"/>
                    <asp:Button ID="btnClear" runat="server" Text="Reset" CssClass="btn btn-default" OnClick="btnClear_Click" ToolTip="Clear All Data"/>
                </div>
                </div>
                <div class="col-sm-4" style="padding-top:100px;">
                    <asp:GridView ID="GridView2" runat="server"  CssClass="table" AllowPaging="True" AutoGenerateColumns="False" CellPadding="7" DataKeyNames="BNo" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" ShowFooter="false" ToolTip="Books" ViewStateMode="Disabled" OnSelectedIndexChanged="GridView2_SelectedIndexChanged">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="BNo" HeaderText="Book No" ReadOnly="True" SortExpression="BNo" />
                            <asp:BoundField DataField="BName" HeaderText="Book Name" SortExpression="BName" />
                            <asp:CommandField ShowSelectButton="True">
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [BNo], [BName] FROM [BRegistration]"></asp:SqlDataSource>
                </div>
            </div>
        </div>      
    </div>
    <div class="container" id="Grid" style="display:none;">
        <div class="row">
            <div class="col-sm-12">
                <h1>Book Borrow Details</h1> <hr />
                <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AutoGenerateColumns="False" EnableViewState="false" CellPadding="7" DataKeyNames="MNo" DataSourceID="BarrowBookDataSource" ToolTip="Book Borrow Details and Update, Detele the Data" ForeColor="#333333" GridLines="None" PageSize="10" ShowHeaderWhenEmpty="True">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="MNo" HeaderText="MNo" ReadOnly="True" SortExpression="MNo" />
                        <asp:BoundField DataField="MName" HeaderText="MName" SortExpression="MName" ReadOnly="True" >
                        </asp:BoundField>
                        <asp:BoundField DataField="BNo" HeaderText="BNo" SortExpression="BNo" ReadOnly="True" >
                        </asp:BoundField>
                        <asp:BoundField DataField="BName" HeaderText="BName" SortExpression="BName" ReadOnly="True" >
                        </asp:BoundField>
                        <asp:BoundField DataField="NoCopies" HeaderText="NoCopies" SortExpression="NoCopies" >
                        <ControlStyle CssClass="form-control" Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IssueDate" HeaderText="IssueDate" SortExpression="IssueDate" >
                        <ControlStyle CssClass="form-control" Width="180px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" >
                        <ControlStyle CssClass="form-control" Width="180px" />
                        </asp:BoundField>                       
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="White" />
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerSettings Mode="NumericFirstLast" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedAscendingHeaderStyle BackColor="#246B61" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />

                </asp:GridView>
                <asp:SqlDataSource ID="BarrowBookDataSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [MNo], [MName], [BNo], [BName], [NoCopies], [IssueDate], [DueDate] FROM [BBarrow]" UpdateCommand="UPDATE [BBarrow] SET [NoCopies]=@NoCopies, [DueDate]=@DueDate, [IssueDate]=@IssueDate WHERE @MNo=[MNo] AND @BNo=[BNo]" DeleteCommand="DELETE FROM [BBarrow] WHERE @MNo=[MNo] AND @BNo=[BNo]"></asp:SqlDataSource>
            </div>
        </div>
    </div>

</asp:Content>
