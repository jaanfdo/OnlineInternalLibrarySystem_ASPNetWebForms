<%@ Page Title="Book Request" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="BookRequest.aspx.cs" Inherits="SarasaviLibrary.BookRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">

    <div class="container">
        <div class="row">
            <div class="col-sm-8 frame">
                    <div class="col-sm-4">
                        <h1 class="badge lg"><asp:Label ID="lblBNo" ForeColor="White" runat="server"></asp:Label></h1>
                    </div>
                    <div class="col-sm-8">
                        <h2><span class="white"><asp:Label ID="lblBName" runat="server" ToolTip="Book Name"></asp:Label></span></h2><hr />
                    </div>
            <asp:DataList ID="RDetails" runat="server">
                <ItemTemplate>
                    <div class="col-sm-4" style="padding-left:40px;">
                        <img ID="Image2" style="width:200px; height:250px;" src="Images/<%#Eval("File") %>"/>
                    </div>
                    <div class="col-sm-8" style="padding-top:20px;">
                        <asp:Label ID="lblAuthor" runat="server" class="col-sm-11 frame-padding" Font-Bold="True" Text="Author : "><span class="white"><%#Eval("Author") %></span></asp:Label>
                        <asp:Label ID="lblCatagorie" runat="server" class="col-sm-11 frame-padding" Font-Bold="True" Text="Category : "><span class="white"><%#Eval("Catogarie") %></span></asp:Label>
                        <asp:Label ID="lblLanguage" runat="server" class="col-sm-11 frame-padding" Font-Bold="True" Text="Language : "><span class="white"><%#Eval("Language") %></span></asp:Label>
                        <asp:Label ID="lblISBN" runat="server" class="col-sm-11 frame-padding" Font-Bold="True" Text="ISBN : "><span class="white"><%#Eval("ISBN") %></span></asp:Label>
                        <asp:Label ID="lblEdition" runat="server" class="col-sm-11 frame-padding" Font-Bold="True" Text="Edition : "><span class="white"><%#Eval("Edition") %></span></asp:Label>
                        <asp:Label ID="lblPDate" runat="server" class="col-sm-11 frame-padding" Font-Bold="True" Text="Publication Date : "><span class="white"><%#Eval("PublicationDate") %></span></asp:Label>
                    </div>
                </ItemTemplate>
            </asp:DataList>
            
            <div class="col-sm-12" style="padding: 10px 0px 10px 10px;">
                <ul class="nav nav-tabs">
                    <li role="presentation" class="active"><a data-toggle="tab" href="#refer">Refer</a></li>
                    <li role="presentation"><a data-toggle="tab" href="#barrow">Barrow</a></li>
                </ul>
                <div class="tab-content">
                    <div id="refer" class="tab-pane fade in active">
                        <asp:Label runat="server" CssClass="tab-content-color" Font-Bold="True" ID="lblBRFD"></asp:Label><asp:Label runat="server" Visible="false" ID="lbl1"></asp:Label><br />
                        <asp:Label runat="server" CssClass="tab-content-color" Font-Bold="True" ID="lblRT"></asp:Label><asp:Label runat="server" Visible="false" ID="lbl2"></asp:Label><br />
                        <asp:Label runat="server" CssClass="tab-content-color" Font-Bold="True" ID="lblRET"></asp:Label><asp:Label runat="server" Visible="false" ID="lbl3"></asp:Label><br /><br />
                        <asp:CheckBox ID="chkRefer" OnCheckedChanged="chkRefer_CheckedChanged" Text=" tick this, If you agree with this terms..." runat="server" />
                        <div class="col-sm-offset-6">
                            <asp:Button runat="server" ID="btnRefer" CssClass="btn btn-default pageload" Text="Reffer" OnClick="btnRefer_Click" ToolTip="To Refer Books"/>
                        </div>
                        <p class="text-primary" style="color:#ffffff;"><asp:Literal ID="Literal1" Visible="true" runat="server"></asp:Literal></p>
                        <p class="text-danger"><asp:Literal ID="Literal2" Visible="true" runat="server"></asp:Literal></p>
                    </div>
                    <div id="barrow" class="tab-pane fade">
                        <asp:Label runat="server" CssClass="tab-content-color" Font-Bold="True" ID="lblBBD"></asp:Label><asp:Label runat="server" Visible="false" ID="lbl4"></asp:Label><br />
                        <asp:Label runat="server" CssClass="tab-content-color"  Font-Bold="True" ID="lblBRD"></asp:Label><asp:Label runat="server" Visible="false" ID="lbl5"></asp:Label><br /><br />
                        <asp:TextBox ID="txtNoCopies" runat="server" CssClass="form-control" Width="100" placeholder="No of Copies"></asp:TextBox><br />
                        <asp:CheckBox ID="chkBarrow" OnCheckedChanged="chkBarrow_CheckedChanged" Text=" tick this, If you agree with this terms..." runat="server" />
                        <div class="col-sm-offset-6">
                            <asp:Button runat="server" ID="btnBarrow" CssClass="btn btn-default pageload" Text="Barrow" OnClick="btnBarrow_Click" ToolTip="To Barrow Books"/>
                        </div>
                        <p class="text-danger"><asp:Literal ID="Literal4" Visible="true" runat="server"></asp:Literal></p>
                    </div>
                </div>
            </div>
                <div class="col-sm-12" >
                    <asp:Label ID="lblMNo" Visible="false" runat="server"></asp:Label>
                    <asp:Label ID="lblMName" Visible="false" runat="server"></asp:Label>
                    <asp:Label ID="lblUName" Visible="false" runat="server"></asp:Label>
                </div>
        </div>
            <div class="col-sm-4">
                <h3 style="background-color:#008080; color:#ffffff; padding:10px 0px 10px 10px">Most Viewed Books</h3>
                <div class="frame" style="padding-left:15px; padding-top:15px;">
                <asp:Repeater ID="RImages" runat="server">
                    <ItemTemplate>
                        <div  class="img-responsive pbox-sm">
                            <img src="Images/<%#Eval("File") %>"/>
                            <asp:Label ID="lblName" runat="server" CssClass="pbox-brand" Text='<%# Eval("BName") %>'></asp:Label>
                            <asp:LinkButton ID="lnkRALL" OnClick="lnkRALL_Click" CssClass="btn btn-default" Text='<%#Eval("BNo")%> ' runat="server">
                            </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:Repeater> 
                </div>
            </div>
        </div>
    </div>
    
</asp:Content>
