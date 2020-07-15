<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="SarasaviLibrary._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
    <script type="text/javascript" src="Content/jssor.slider.mini.js"></script>
<script>
    $(document).ready(function() {
        $(".btn-lg, .fixed-top").click(function () {
            var target = $(this.hash);
            $('body').animate({
                scrollTop: target.offset().top
            }, 1000);
            return false;
        });
    });
    $(document).ready(function ($) {
        var jssor_1_options = {
            $AutoPlay: true,
            $AutoPlaySteps: 1,
            $SlideDuration: 160,
            $SlideWidth: 200,
            $SlideSpacing: 10,
            $Cols: 3,
            $ArrowNavigatorOptions: {
                $Class: $JssorArrowNavigator$,
                $Steps: 1
            },
        };
        var jssor_1_slider = new $JssorSlider$("jssor_1", jssor_1_options);
        var jssor_2_slider = new $JssorSlider$("jssor_2", jssor_1_options);
    });
    $(window).scroll(function () {
        if ($(this).scrollTop() > 100) {
            $('.fixed-top').fadeIn();
        } else {
            $('.fixed-top').fadeOut();
        }
    });
</script>

 <div class="row" id="scrolltop">
    <div id="myCarousel" class="carousel slide" data-ride="carousel">

    <ol class="carousel-indicators">
      <li data-target="#myCarousel" data-slide-to="0" class="active"></li>
      <li data-target="#myCarousel" data-slide-to="1"></li>
      <li data-target="#myCarousel" data-slide-to="2"></li>
    </ol>

    <div class="carousel-inner">
      <div class="item active">
        <div class="carousel-caption">
          <h1>Books</h1>
          <p style="font-size:20px;">Reading Books Takes Your Mind Off Your Troubles.</p>
          <a class="btn btn-lg btn-default" href="#books" role="button" style="margin: 20px;">View Books</a> 
        </div>
      </div>

      <div class="item">
        <div class="carousel-caption">
          <h1>Most Barrow Books</h1>
          <p style="font-size:20px;">Reading Books Improves Your Quality Of Conversations.</p>
            <a class="btn btn-lg btn-default" href="#mbb" role="button" style="margin: 20px;">View Books</a>
        </div>
      </div>
    
      <div class="item">
        <div class="carousel-caption">
          <h1>Most Refer Books</h1>
          <p style="font-size:20px;">Helps You To Tap Into The Mind Of The Creative Thinkers.</p>
            <a class="btn btn-lg btn-default" href="#mrb" role="button" style="margin: 20px;">View Books</a>
        </div>
      </div>
     
    </div>

    <a class="left carousel-control" href="#myCarousel" role="button" data-slide="prev">
      <span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
      <span class="sr-only">Previous</span>
    </a>
    <a class="right carousel-control" href="#myCarousel" role="button" data-slide="next">
      <span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
      <span class="sr-only">Next</span>
    </a>
    </div>
</div>

<div class="row">
    <div class="menuname">
        Welcome <asp:Label runat="server" ID="lbluser"></asp:Label> to <span>Sarasavi Library</span>
    </div>
    <hr />          
</div>

<a href="#scrolltop" class="fixed-top" ></a>

  <div class="container" id="books" style="padding-bottom:20px;">
        <div class="row">
            <div class="col-sm-2 nav-pills-m">
                <h3>Categories</h3>
                    <ul class="nav nav-pills nav-stacked">
                        <li role="presentation" class="active"><a href="#ALL" role="tab" data-toggle="tab">All Books</a></li>
                        <li class="nav-divider"></li>
                        <li role="presentation"><a href="#IT" role="tab" data-toggle="tab">Information Technologie</a></li>
                        <li class="nav-divider"></li>
                        <li role="presentation"><a href="#Engineering" role="tab" data-toggle="tab">Engineering</a></li>
                        <li class="nav-divider"></li>
                        <li role="presentation"><a href="#SScience" role="tab" data-toggle="tab">Social Science</a></li>
                        <li class="nav-divider"></li>
                        <li role="presentation"><a href="#Games" role="tab" data-toggle="tab">Games</a></li>        
                        <li class="nav-divider"></li>            
                        <li role="presentation"><a href="#Sports" role="tab" data-toggle="tab">Sports</a></li>
                    </ul>
            </div>
            <div class="col-sm-10">              
                <div class="col-sm-12">
                    <h2>Books</h2>
                </div>
                <div class="col-sm-12">
                   <h4>Read Free Books Online and Download eBooks for Free</h4> 
                    <p>Find thousands of books to read online and download free eBooks. Discover and read free books by All Countries authors as well as tons of classic books. 
                        Browse categories to find your favorite literature genres: Young Adult and Children’s Book wise.... 
                        There are eBooks for everyone.</p>
                </div>          
            </div>
            <div class="col-sm-10">
                <div class="col-sm-8" style="padding-top:10px;">
                    <asp:TextBox ID="txtSearch" TextMode="Search" placeholder="Search...." CssClass="form-control" runat="server" ToolTip="Search by Name or Catogaries"></asp:TextBox>
                    
                </div>
                <div class="col-sm-2">
                    <asp:Button ID="btnSearch" CssClass="btn btn-default" runat="server" Text="Search" OnClick="btnSearch_Click" />
                </div>                              
            </div>
            <div class="col-sm-10">
                <hr />
            </div>
                                    
            <div class="col-sm-10">
                <div class="tab-content" style="padding-left:30px;">
                    <div role="tabpanel" class="tab-pane fade in active" id="ALL">
                        <asp:Repeater ID="RALL" runat="server">
                            <ItemTemplate>
                                <div  class="img-responsive pbox">
                                    <img src="Images/<%#Eval("File") %>"/>
                                    <asp:Label ID="lblName" runat="server" CssClass="pbox-brand" Text='<%#Eval("BName") %>'></asp:Label>
                                    <asp:LinkButton ID="lnkRALL" OnClick="lnkRALL_Click" CssClass="btn btn-default" Text='<%#Eval("BNo")%> ' runat="server" ToolTip="Display Details in this Book">
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>                               
                        </asp:Repeater>
                    </div> 
                    <div role="tabpanel" class="tab-pane fade" id="IT">
                        <asp:Repeater ID="RIT" runat="server">
                            <ItemTemplate>
                                <div  class="img-responsive pbox">
                                    <img src="Images/<%#Eval("File") %>"/>
                                    <asp:Label ID="lblName" runat="server" CssClass="pbox-brand" Text='<%# Eval("BName") %>'></asp:Label>
                                    <asp:LinkButton ID="lnkRIT" OnClick="lnkRIT_Click" CssClass="btn btn-default" runat="server" Text='<%#Eval("BNo") %>' ToolTip="Display Details in this Book"></asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="Engineering">
                        <asp:Repeater ID="REngineering" runat="server">
                            <ItemTemplate>
                                <div  class="img-responsive pbox">
                                    <img src="Images/<%#Eval("File") %>"/>
                                    <asp:Label ID="lblName" runat="server" CssClass="pbox-brand" Text='<%# Eval("BName") %>'></asp:Label>
                                    <asp:LinkButton ID="lnkREngineering" OnClick="lnkREngineering_Click" CssClass="btn btn-default" Text='<%#Eval("BNo") %>' runat="server" ToolTip="Display Details in this Book">
                                    </asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="SScience">
                        <asp:Repeater ID="RSScience" runat="server">
                            <ItemTemplate>
                                <div  class="img-responsive pbox">
                                    <img src="Images/<%#Eval("File") %>"/>
                                    <asp:Label ID="lblName" runat="server" CssClass="pbox-brand" Text='<%# Eval("BName") %>'></asp:Label>
                                    <asp:LinkButton ID="lnkRSScience" OnClick="lnkRSScience_Click" Text='<%#Eval("BNo") %>' CssClass="btn btn-default" runat="server" ToolTip="Display Details in this Book"></asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="Games">
                        <asp:Repeater ID="RGames" runat="server">
                            <ItemTemplate>
                                <div  class="img-responsive pbox">
                                    <img src="Images/<%#Eval("File") %>"/>
                                    <asp:Label ID="lblName" runat="server" CssClass="pbox-brand" Text='<%# Eval("BName") %>'></asp:Label>
                                    <asp:LinkButton ID="lnkRGames" OnClick="lnkRGames_Click" Text='<%#Eval("BNo") %>' CssClass="btn btn-default" runat="server" ToolTip="Display Details in this Book"></asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                    <div role="tabpanel" class="tab-pane fade" id="Sports">
                       <asp:Repeater ID="RSports" runat="server">
                            <ItemTemplate>
                                <div  class="img-responsive pbox">
                                    <img src="Images/<%#Eval("File") %>"/>
                                    <asp:Label ID="lblName" runat="server" CssClass="pbox-brand" Text='<%# Eval("BName") %>'></asp:Label>
                                    <asp:LinkButton ID="lnkRSports" OnClick="lnkRSports_Click" Text='<%#Eval("BNo") %>' CssClass="btn btn-default" runat="server" ToolTip="Display Details in this Book"></asp:LinkButton>
                                </div>
                            </ItemTemplate>
                        </asp:Repeater>
                    </div>
                </div>        
               </div>
         </div>
    </div>
 
    <div class="container barrow-img" style="padding-bottom:40px;">
        <div class="col-sm-12" id="mbb">
            <h2>Most Barrow Books</h2>
            <hr />
            <div id="jssor_1" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 840px; height: 250px; overflow: hidden; visibility: hidden;">
                <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 840px; height: 250px; overflow: hidden;">
                <asp:Repeater ID="BImages" runat="server">
                    <ItemTemplate>
                        <div class="img-responsive pbox" style="display:none;">
                            <img src="Images/<%#Eval("File") %>" data-u="image"/>
                            <asp:Label ID="lblName" runat="server" CssClass="pbox-brand" Text='<%# Eval("BName") %>'></asp:Label>
                            <asp:LinkButton ID="lnkBI" OnClick="lnkBI_Click" CssClass="btn btn-default" Text='<%#Eval("BNo")%> ' runat="server" ToolTip="Display Details in this Book">
                            </asp:LinkButton>
                        </div> 
                    </ItemTemplate>                                   
                </asp:Repeater>
                </div>
                <span data-u="arrowleft" class="jssora03l" style="top:0px;left:8px;" data-autocenter="2"></span>
                <span data-u="arrowright" class="jssora03r" style="top:0px;right:8px;" data-autocenter="2"></span> 
            </div>                 
        </div>
    </div>
    <div class="container reffer-img" style="padding-bottom:40px;">
        <div class="col-sm-12" id="mrb">
            <h2>Most Refered Books</h2>
            <hr />
            <div id="jssor_2" style="position: relative; margin: 0 auto; top: 0px; left: 0px; width: 840px; height: 250px; overflow: hidden; visibility: hidden;">
                <div data-u="slides" style="cursor: default; position: relative; top: 0px; left: 0px; width: 840px; height: 250px; overflow: hidden;">
                <asp:Repeater ID="RImages" runat="server">
                    <ItemTemplate>
                        <div  class="img-responsive pbox" style="display:none;">    
                            <img src="Images/<%#Eval("File") %>" data-u="image"/>
                            <asp:Label ID="lblName" runat="server" CssClass="pbox-brand" Text='<%# Eval("BName") %>'></asp:Label>
                            <asp:LinkButton ID="lnkRI" OnClick="lnkRI_Click" CssClass="btn btn-default" Text='<%#Eval("BNo")%> ' runat="server">
                            </asp:LinkButton>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>
                </div>
                <span data-u="arrowleft" class="jssora03l" style="top:0px;left:8px;" data-autocenter="2"></span>
                <span data-u="arrowright" class="jssora03r" style="top:0px;right:8px;" data-autocenter="2"></span> 
            </div>
        </div>
    </div>    

</asp:Content>
