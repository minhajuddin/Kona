<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<ProductListViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

    <title>Kona: <%=Model.SelectedCategory.Name %></title>

</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">
    <!--Top Navigation-->
    <div id="hdr3">
    <ul class="topNav" id="menulist">
          <%foreach (Category c in Model.ParentCategories) { %>
            <li class="first"><a href="<%=Url.Action("Index","Product",new {id=c.ID}) %>" title="<%=c.Description %>"><%=c.Name %></a></li>
          <%} %>

    </ul>
    </div>
<div id="bdy" class="leftNav">
    <div class="colleft fltleft">
   
        <div class="leftnavMod">
            <h6>Favorites</h6>
            <ul class="leftnavList">
                <li><a href="#">Lorem ipsum</a></li>
                <li><a href="#">Aliquam diam</a></li>
                <li><a href="#">Nam eu risus</a></li>
                <li><a href="#">Proin arcu lectus</a></li>
            </ul>
        </div>

        <div class="leftnavMod">
            <h6>Recent</h6>
            <ul class="leftnavList">
                <li><a href="#">Donec lacus</a></li>
                <li><a href="#">Aenean id nunc</a></li>
                <li><a href="#">Fusce non nibh</a></li>
                <li><a href="#">Ut aliquet dictum</a></li>
                <li><a href="#">Etiam eu est</a></li>
                <li><a href="#">Aenean hendrerit</a></li>
                <li><a href="#">Maecenas dapibus</a></li>
            </ul>
        </div>
    </div>

    <div class="colmiddle fltleft">

        
        
        
        <!--Product widget with three products-->
        <div class="prodWidget">
            <%foreach (Product p in Model.FeaturedProducts) {
                  string desc = p.Descriptors.First().Body;
                  %>
            <h4><%=p.Name %></h4>
            <hr />
            <div class="fltleft prodItem">
                    <a href="<%=Url.Action("Details","Product",new {id=p.SKU}) %>">
                    <img src="/content/productimages/<%=p.DefaultImage %>" alt="<%=p.Name %>" width="115" height="115" />

            </div>
            <div class="fltright prodText">
                <p><%=desc.Substring(0,200)%></p>
                                    
                    <p style="text-align:center">
                        <div class="product">
                            <input type="hidden" class="product-title" value="<%=p.Name %>">
                            <input type="hidden" class="product-price" value="<%=p.Price.ToString("C") %>">
                            <div class="googlecart-add-button" tabindex="0" role="button" title="Add to cart">
                            </div>
                        </div>
                    </p>
            </div>
            <div class="clearLayout">
            </div>   
            <%} %>
            <div class="clearLayout">
            </div>
        </div>


    </div>


    <!--End middle column and begin sidebar-->
    <div class="colright fltright">


        <div class="sidebarWidget"><h5>Search Widget</h5>
        <div class="sidebarContent"><form><input type="text" /><br /><input type="submit" value="Search" /></form></div></div>


    <!--End sidebar-->
    </div>

    <!--Clear out three column layout-->
    <div class="clearLayout"></div>
</div>

    <script  id='googlecart-script' 
    type='text/javascript' 
    src='https://checkout.google.com/seller/gsc/v2_2/cart.js?mid=653000314697240' 
    integration='jscart-wizard' 
    post-cart-to-sandbox='true' 
    currency='USD' 
    hide-cart-when-empty="true"
    productWeightUnits='LB'>
    </script>
    
</asp:Content>
