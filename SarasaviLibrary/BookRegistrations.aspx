<%@ Page Title="Book Registration" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookRegistrations.aspx.cs" Inherits="SarasaviLibrary.BookRegistrations" %>

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
            <div class="col-sm-8 col-sm-offset-2">
                <div class="col-sm-offset-1">
                    <h1>Book Registration</h1>
                </div>
                <hr />
                <div class="form-group">
                    <label class="col-sm-4 control-label">Book Name</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtBName" runat="server" placeholder="Book Name" CssClass="form-control"></asp:TextBox>
                    <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtBName" ErrorMessage="Fields Can not be Empty" ValidationGroup="Registration"></asp:RequiredFieldValidator></div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Categories</label>
                    <div class="col-sm-7">
                    <asp:DropDownList ID="cboBCatogarie" runat="server" OnSelectedIndexChanged="cboBCatogarie_SelectedIndexChanged" CssClass="form-control DropDown">
                        <asp:ListItem Text="Select Items"></asp:ListItem>
                        <asp:ListItem Text="Information Technology" Value="IT"></asp:ListItem>
                        <asp:ListItem Text="Engineering" Value="E"></asp:ListItem>
                        <asp:ListItem Text="Science" Value="S"></asp:ListItem>
                        <asp:ListItem Text="Social Science" Value="SS"></asp:ListItem>
                        <asp:ListItem Text="Sport" Value="Sp"></asp:ListItem>
                        <asp:ListItem Text="Games" Value="G"></asp:ListItem>
                        </asp:DropDownList>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Book No</label>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtCat" runat="server" placeholder="Category ID" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtNo" runat="server" placeholder="Book No" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-2">
                        <asp:TextBox ID="txtCNo" runat="server" placeholder="Copies" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-3 col-sm-offset-4" >
                        <asp:TextBox ID="txtBNo" runat="server" placeholder="Book No" CssClass="form-control"></asp:TextBox>
                    </div>
                    <div class="col-sm-3">
                        <asp:Button ID="btnBNo" runat="server" Text="Book No" CssClass="btn btn-default" style="margin:0px;" OnClick="btnBNo_Click" ToolTip="Genarate Book Number"/>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Language</label>
                    <div class="col-sm-7">
                    <asp:DropDownList ID="cboBLanguage" runat="server" CssClass="form-control DropDown">
                        <asp:ListItem>English</asp:ListItem>
                        <asp:ListItem>Sinhala</asp:ListItem>
                        <asp:ListItem>French</asp:ListItem>
                        <asp:ListItem>Hindi</asp:ListItem>
                    </asp:DropDownList>
                    </div>
                </div> 
                <div class="form-group">
                    <label class="col-sm-4 control-label">Book ISBN</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtBISBN" runat="server" placeholder="Book ISBN" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtBISBN" ErrorMessage="Fields Can not be Empty" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Book Author</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtBAuthor" runat="server" placeholder="Book Author" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtBAuthor" ErrorMessage="Fields Can not be Empty" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Publication Date</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="dtpPublicatonDate" TextMode="Date" runat="server" CssClass="form-control Date"></asp:TextBox>
                        <asp:RequiredFieldValidator CssClass="text-danger" Display="Dynamic" runat="server" ControlToValidate="dtpPublicatonDate" ErrorMessage="Fields Can not be Empty" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Book Edition</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtBEdition" runat="server" placeholder="Book Edition" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtBEdition" ErrorMessage="Fields Can not be Empty" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">No of Copies</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtNCopies" runat="server" placeholder="No of Copies" CssClass="form-control"></asp:TextBox>
                        <asp:RequiredFieldValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtNCopies" ErrorMessage="Fields Can not be Empty" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                        <asp:RangeValidator runat="server" Display="Dynamic" CssClass="text-danger" ControlToValidate="txtNCopies" ErrorMessage="10 is maximum number" MaximumValue="10" ValidationGroup="Registration"></asp:RangeValidator>
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Picture</label>
                    <div class="col-sm-7">
                    <asp:FileUpload ID="txtFile" runat="server" ToolTip="Browse the File"  />
                    </div>
                </div>
                <div class="form-group">
                    <label class="col-sm-4 control-label">Price</label>
                    <div class="col-sm-7">
                    <asp:TextBox ID="txtPrice" runat="server" placeholder="Price" CssClass="form-control"></asp:TextBox>
                    </div>
                </div>
                <div class="form-group">
                    <div class="col-sm-offset-4">
                        <p class="text-danger"><asp:Literal ID="Error" runat="server"></asp:Literal></p>
                        <p class="text-success"><asp:Literal ID="Success" runat="server"></asp:Literal></p>
                    </div>
                </div>
                
                <div class="form-group">
                        <div class="col-sm-offset-4">
                            <asp:Button ID="btnSave" runat="server" Text="Save" CssClass="btn btn-default" OnClick="btnSave_Click" ValidationGroup="Registration" ToolTip="Save Books"/>
                            <asp:Button ID="btnClear" runat="server" Text="Clear" CssClass="btn btn-default" OnClick="btnClear_Click" ToolTip="Clear All Data"/>
                        </div>
                </div>
                </div>
                </div>
            </div>
        </div>
    <div class="container" id="Grid" style="display:none;">
            <div class="col-sm-12">
                <h1>Book Details</h1> <hr />
                <asp:GridView ID="BRegistrationGV" runat="server" CellPadding="5" ForeColor="#333333" GridLines="None" AutoGenerateColumns="False" AllowPaging="True" DataKeyNames="BNo" PageSize="10" ToolTip="Book Details" DataSourceID="BRegistrationDataSource1">
                    <AlternatingRowStyle BackColor="White" />
                    <Columns>
                        <asp:BoundField DataField="BNo" HeaderText="BNo" ReadOnly="True" SortExpression="BNo" />
                        <asp:BoundField DataField="BName" HeaderText="BName" SortExpression="BName" >
                        <ControlStyle CssClass="form-control" Width="150px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Catogarie" HeaderText="Catogarie" SortExpression="Catogarie" >
                        <ControlStyle CssClass="form-control" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Language" HeaderText="Language" SortExpression="Language" >
                        <ControlStyle CssClass="form-control" Width="70px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="ISBN" HeaderText="ISBN" SortExpression="ISBN" >
                        <ControlStyle CssClass="form-control" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Author" HeaderText="Author" SortExpression="Author" >
                        <ControlStyle CssClass="form-control" />
                        </asp:BoundField>
                        <asp:BoundField DataField="PublicationDate" HeaderText="PublicationDate" SortExpression="PublicationDate" >
                        <ControlStyle CssClass="form-control" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Edition" HeaderText="Edition" SortExpression="Edition" >
                        <ControlStyle CssClass="form-control" Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NoCopies" HeaderText="NoCopies" SortExpression="NoCopies" >
                        <ControlStyle CssClass="form-control" Width="50px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="Price" HeaderText="Price" SortExpression="Price" >
                        <ControlStyle CssClass="form-control" Width="80px" />
                        </asp:BoundField>
                        <asp:CommandField ShowEditButton="True" />
                        <asp:CommandField ShowDeleteButton="True" />
                    </Columns>
                    <EditRowStyle BackColor="White" />
                    <EmptyDataTemplate>
                        No Record Found
                    </EmptyDataTemplate>
                    <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
                    <PagerSettings PageButtonCount="5" Mode="NumericFirstLast" FirstPageText="&lt;&lt; First" LastPageText=" Last&gt;&gt;" NextPageText="Next&gt; " PreviousPageText="&lt;Previous" />
                    <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" Font-Bold="False" Font-Overline="False" Font-Underline="False" />
                    <RowStyle BackColor="White" />
                    <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
                    <SortedAscendingCellStyle BackColor="#F8FAFA" />
                    <SortedDescendingCellStyle BackColor="#D4DFE1" />
                    <SortedDescendingHeaderStyle BackColor="#15524A" />

                </asp:GridView>
                <asp:SqlDataSource ID="BRegistrationDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT [BNo], [BName], [Catogarie], [Language], [ISBN], [Author], [PublicationDate], [Edition], [NoCopies], [Price] FROM [BRegistration] ORDER BY [BNo]" UpdateCommand="UPDATE [BRegistration] SET [BName]=@BName, [Catogarie]=@Catogarie, [Language]=@Language, [ISBN]=@ISBN, [Author]=@Author, [PublicationDate]=@PublicationDate, [Edition]=@Edition, [NoCopies]=@NoCopies, [Price]=@Price WHERE [BNo]=@BNo" DeleteCommand="DELETE FROM [BRegistration] WHERE [BNo]=@BNo"></asp:SqlDataSource>
            </div>
        </div>


      

</asp:Content>