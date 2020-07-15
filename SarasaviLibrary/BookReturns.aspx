<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookReturns.aspx.cs" Inherits="SarasaviLibrary.BookReturns" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#Button1').click(function () {
                $('.form-horizontal').toggle(1000);
                $('#Grid').toggle(1000);
            });
        });
    </script>
    <input id="Button1" class="btn btn-default fixed-btn" type="button" value="Display" />
    <div class="container">
        <div class="row">
            <div class="form-horizontal">
                <div class="col-sm-8">
                <div class="col-sm-offset-1">
                    <h1>Return Books</h1>
                </div>
                <hr />
                <div class="form-group">
                    <label class="col-sm-4 control-label">Member No</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtMNo" runat="server" placeholder="Member No" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtMNo" ErrorMessage="Fields Can not be Empty" ValidationGroup="ReturnValidation"></asp:RequiredFieldValidator>
                    </div></div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Member Name</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtMName" runat="server" placeholder="Member Name" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtMName" ErrorMessage="Fields Can not be Empty" ValidationGroup="ReturnValidation"></asp:RequiredFieldValidator>
                    </div></div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Book No</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtBNo" runat="server" placeholder="Book No" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtBNo" ErrorMessage="Fields Can not be Empty" ValidationGroup="ReturnValidation"></asp:RequiredFieldValidator>
                    </div></div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Book Name</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtBName" runat="server" placeholder="Book Name" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtBName" ErrorMessage="Fields Can not be Empty" ValidationGroup="ReturnValidation"></asp:RequiredFieldValidator>
                    </div></div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">No of Return Copies</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtNRCopies" runat="server" placeholder="No of Return Copies" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtNRCopies" ErrorMessage="Fields Can not be Empty" ValidationGroup="ReturnValidation"></asp:RequiredFieldValidator>
                    </div></div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Books Issue Date</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtIDate" TextMode="Date" runat="server" CssClass="form-control Date"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtIDate" ErrorMessage="Fields Can not be Empty" ValidationGroup="ReturnValidation"></asp:RequiredFieldValidator>
                    </div></div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Books Due Date</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtDDate" TextMode="Date" runat="server" CssClass="form-control Date"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtDDate" ErrorMessage="Fields Can not be Empty" ValidationGroup="ReturnValidation"></asp:RequiredFieldValidator>
                    </div></div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Books Return Date</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtRDate" TextMode="Date" runat="server" CssClass="form-control Date"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtRDate" ErrorMessage="Fields Can not be Empty" ValidationGroup="ReturnValidation"></asp:RequiredFieldValidator>
                    </div></div>
                <div class="col-sm-offset-4">
                    <p class="text-success"><asp:Literal runat="server" ID="Success"></asp:Literal></p>
                    <p class="text-danger"><asp:Literal runat="server" ID="Error"></asp:Literal></p>
                </div>
                <div class="form-group">
                        <div class="col-sm-offset-4 col-sm-4">
                            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-default" OnClick="btnSave_Click" ToolTip="Save Return Books" ValidationGroup="ReturnValidation"/>
                            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-default" OnClick="btnClear_Click" ToolTip="Clear All Data"/>
                        </div>
                </div>
            </div>
                <div class="col-sm-4" style="padding-top:100px;">
                    <asp:GridView ID="GridView1" runat="server"  CssClass="table" AllowPaging="True" AutoGenerateColumns="False" CellPadding="7" DataKeyNames="BNo" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" OnSelectedIndexChanged="GridView1_SelectedIndexChanged" ShowFooter="false" ToolTip="Books" EnableViewState="false">
                        <AlternatingRowStyle BackColor="White" />
                        <Columns>
                            <asp:BoundField DataField="BNo" HeaderText="Book No" ReadOnly="True" SortExpression="BNo" />
                            <asp:BoundField DataField="BName" HeaderText="Book Name" SortExpression="BName" />
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
                    <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [BNo], [BName] FROM [BRegistration]"></asp:SqlDataSource>
                </div>
            </div>
        </div>     
    </div>

    <div class="container" id="Grid" style="display:none;">
        <div class="row">
            <div class="col-sm-12">
            <h1>Book Return Details</h1>   
            <hr />
            <asp:GridView ID="GVReturn" runat="server" AllowPaging="True" AutoGenerateColumns="False" CellPadding="7" DataKeyNames="MNo" DataSourceID="ReturnSource" ForeColor="#333333" GridLines="None" PageSize="10" ToolTip="Book Returns Details and Update, Detele the Data">
                <AlternatingRowStyle BackColor="White" />
                <Columns>
                    <asp:BoundField DataField="MNo" HeaderText="MNo" ReadOnly="True" SortExpression="MNo" />
                    <asp:BoundField DataField="MName" HeaderText="MName" SortExpression="MName" ReadOnly="true">
                    </asp:BoundField>
                    <asp:BoundField DataField="BNo" HeaderText="BNo" SortExpression="BNo">
                    </asp:BoundField>
                    <asp:BoundField DataField="BName" HeaderText="BName" SortExpression="BName" ReadOnly="true">
                    </asp:BoundField>
                    <asp:BoundField DataField="NoRCopies" HeaderText="NoRCopies" SortExpression="NoRCopies" >
                    <ControlStyle CssClass="form-control" Width="50px" />
                    </asp:BoundField>
                    <asp:BoundField DataField="IssueDate" HeaderText="IssueDate" SortExpression="IssueDate" >
                    <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" >
                    <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:BoundField DataField="ReturnDate" HeaderText="ReturnDate" SortExpression="ReturnDate" >
                    <ControlStyle CssClass="form-control" />
                    </asp:BoundField>
                    <asp:CommandField ShowEditButton="True"></asp:CommandField>
                    <asp:CommandField ShowDeleteButton="True" />
                </Columns>
                <EditRowStyle BackColor="White" />
                <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
                <RowStyle BackColor="White" />
                <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                <SortedAscendingCellStyle BackColor="#F8FAFA" />
                <SortedAscendingHeaderStyle BackColor="#246B61" />
                <SortedDescendingCellStyle BackColor="#D4DFE1" />
                <SortedDescendingHeaderStyle BackColor="#15524A" />

            </asp:GridView>
            <asp:SqlDataSource ID="ReturnSource" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [MNo], [MName], [BNo], [BName], [NoRCopies], [IssueDate], [DueDate], [ReturnDate] FROM [BReturn]" UpdateCommand="UPDATE [BReturn] SET @NoRCopies=[NoRCopies], @IssueDate=[IssueDate], @DueDate=[DueDate], @ReturnDate=[ReturnDate] WHERE @MNo=[MNo] AND @BNo=[BNo]" DeleteCommand="DELETE FROM [BReturn] WHERE @MNo=[MNo] AND @BNo=[BNo]"></asp:SqlDataSource>
            </div>   
       </div>
    </div>
    


 
</asp:Content>
