<%@ Page Title="" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookCart.aspx.cs" Inherits="SarasaviLibrary.BookCart" %>
<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="container">
        <div class="row">
            <div style="text-align:center; padding-bottom:20px; padding-top:20px;">
                <h1>Your Book Cart</h1>
            </div>
            <div class="col-sm-12">
  		        <div class="col-sm-6">
                      <asp:Label runat="server" Text="Cart No : " CssClass="col-sm-2 control-label" style="margin-left:50px"></asp:Label>
                      <asp:TextBox ID="txtCNo" CssClass="form-control" Width="100px" runat="server" ToolTip="Cart Number"></asp:TextBox>
                </div>
    	        <div class="col-sm-5 col-sm-offset-1">
                    <asp:Label runat="server" Text="Date : " CssClass="col-sm-2 control-label" style="margin-left:80px;"></asp:Label>
                    <asp:TextBox ID="dtpRDate" CssClass="form-control Date" Width="200px" TextMode="Date" runat="server"></asp:TextBox>
                </div>
            </div>
		    <div class="col-sm-12" style="float:left; margin-top:20px;">
                <p style="margin-left:30px">* Only You can Buy Five Products in One Time!</p>
		    </div>
        </div>
    </div>
    <div class="container">
        <div class="row">            
            <div class="col-sm-12">
                <asp:GridView ID="GridView1" runat="server" CssClass="table" AllowPaging="True" EnableViewState="false" AutoGenerateColumns="False" CellPadding="5" DataKeyNames="MNo,BNo" DataSourceID="sdsCart" PageSize="5" BackColor="White" BorderColor="#CCCCCC" BorderStyle="None" BorderWidth="1px" ToolTip="Display All Barrow Books in Book Cart">
                    <Columns>
                        <asp:BoundField DataField="BNo" HeaderText="BNo" ReadOnly="True" SortExpression="BNo" />
                        <asp:BoundField DataField="BName" HeaderText="BName" SortExpression="BName" ReadOnly="True" >
                        <ItemStyle Width="300px" />
                        </asp:BoundField>
                        <asp:BoundField DataField="NoCopies" HeaderText="NoCopies" SortExpression="NoCopies" >
                        <ControlStyle CssClass="form-control" />
                        </asp:BoundField>
                        <asp:BoundField DataField="IssueDate" HeaderText="IssueDate" SortExpression="IssueDate" ReadOnly="True" />
                        <asp:BoundField DataField="DueDate" HeaderText="DueDate" SortExpression="DueDate" ReadOnly="True" />
                        <asp:CommandField ShowDeleteButton="True" ShowEditButton="True" />
                    </Columns>
                    <FooterStyle BackColor="White" ForeColor="#000066" />
                    <HeaderStyle BackColor="Teal" Font-Bold="True" ForeColor="White" />
                    <PagerSettings FirstPageText="First" LastPageText="Last" Mode="NextPrevious" NextPageText="Next" PreviousPageText="Previous" />
                    <PagerStyle BackColor="White" ForeColor="#0066FF" HorizontalAlign="Center" />
                    <RowStyle ForeColor="Teal" />
                    <SelectedRowStyle BackColor="#669999" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#007DBB" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#00547E" />

                </asp:GridView>
                <asp:SqlDataSource ID="sdsCart" runat="server" ConnectionString="<%$ ConnectionStrings:DefaultConnection %>" SelectCommand="SELECT * FROM [Cart] WHERE ([UName] = @UName)" UpdateCommand="UPDATE [Cart] SET [NoCopies]=@NoCopies WHERE ([UName] = @UName) AND @BNo=[BNo]" DeleteCommand="DELETE FROM [Cart] WHERE ([UName] = @UName) AND @BNo=[BNo]">
                    <SelectParameters>
                        <asp:SessionParameter Name="UName" SessionField="User" Type="String" />
                    </SelectParameters>
                    <UpdateParameters>
                        <asp:SessionParameter Name="UName" SessionField="User" Type="String" />
                    </UpdateParameters>
                    <DeleteParameters>
                        <asp:SessionParameter Name="UName" SessionField="User" Type="String" />
                    </DeleteParameters>
                </asp:SqlDataSource>
            </div>
            <div class="col-sm-12 ">  
                <div class="col-sm-2 col-sm-offset-1">
                    <asp:Label runat="server" Text="No of Items "></asp:Label><asp:Label runat="server" CssClass="badge" ID="lblCount" ToolTip="Number of Items for Barrow"></asp:Label>
                    <asp:Label runat="server" CssClass="badge" Visible="false" ID="lbl1"></asp:Label>
                </div>
                <div class="col-sm-2" style="margin-left:-30px;">
                    <asp:Label runat="server" Text="No of Quantities "></asp:Label><asp:Label runat="server" CssClass="badge" ToolTip="Number of Quantities in Items" ID="lblSum"></asp:Label>
                </div>
                <div class="col-sm-7">
                    <p class="text-danger" style="float:right;"><asp:Literal ID="Error" runat="server"></asp:Literal></p>
                    <p class="text-success" style="float:right;"><asp:Literal ID="Success" runat="server"></asp:Literal></p>
                </div>   
            </div>
            <div class="col-sm-4 col-sm-offset-8">
                <asp:Button runat="server" ID="btnReserv" Text="Reserv" OnClick="btnReserv_Click" CssClass="btn btn-default" ToolTip="To Reserv Books"/>
            </div>          
        </div>
    </div>

    <div class="col-sm-12" >
        <asp:Label ID="lblMNo" Visible="false" runat="server"></asp:Label>
        <asp:Label ID="lblMName" Visible="false" runat="server"></asp:Label>
        <asp:Label ID="lblUName" Visible="false" runat="server"></asp:Label>
    </div>
                    
</asp:Content>
