<%@ Page Title="" Language="C#" MasterPageFile="~/Views/Shared/Site.Master" Inherits="System.Web.Mvc.ViewPage<DetailsViewModel>" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" runat="server">

<title>Kona: <%=Model.SelectedProduct.Name %></title>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" runat="server">

    <!--Top Navigation-->
    <div id="hdr3">
    <ul class="topNav" id="menulist">
          <%foreach (Category c in Model.ParentCategories) { %>
            <li class="first"><a href="#" title="<%=c.Description %>"><%=c.Name %></a></li>
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
    <!--Product widget with 1 product-->
    <div class="prodWidget">
        <h4>
            <%=Model.SelectedProduct.Name %></h4>
        <hr />
        <div class="fltleft">
            <img src="/content/productimages/<%=Model.SelectedProduct.DefaultImage.Replace("Thumbnail","Full") %>" alt=" <%=Model.SelectedProduct.Name %>" width="240" height="240" />
        </div>
        <div class="fltleft">
            <h6>
                Price:  <%=Model.SelectedProduct.Price.ToString("C") %></h6>
                <p style="text-align:center">
                    <div class="product">
                        <input type="hidden" class="product-title" value="<%=Model.SelectedProduct.Name %>">
                        <input type="hidden" class="product-price" value="<%=Model.SelectedProduct.Price.ToString("C") %>">
                        <div class="googlecart-add-button" tabindex="0" role="button" title="Add to cart">
                        </div>
                    </div>
                </p>
                </div>
            <div class="clearLayout">
            <%foreach (Descriptor d in Model.SelectedProduct.Descriptors) { %>
            
            <h6><%=d.Title%>:</h6>
            <p><%=d.Body%></p>
            
            <%} %>
            <div class="prodWidget">
            <h4>Related Products</h4>
            <hr />

            
            <%foreach (Product p in Model.SelectedProduct.Related) { %>
            <div class="fltleft prodItem">
                    <a href="<%=Url.Action("Details","Product",new {id=p.SKU}) %>">
                    <img src="/content/productimages/<%=p.DefaultImage %>" alt="<%=p.Name %>" width="115" height="115" />
                    
                    <p style="text-align:center">
                        <a href="<%=Url.Action("Details","Product",new {id=p.SKU}) %>"><%=p.Name%></a>
                        <div class="product">
                            <input type="hidden" class="product-title" value="<%=p.Name %>">
                            <input type="hidden" class="product-price" value="<%=p.Price.ToString("C") %>">
                            <div class="googlecart-add-button" tabindex="0" role="button" title="Add to cart">
                            </div>
                        </div>
                    </p>
            </div>                
            <%} %>
            </div>
        </div>
    </div>
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
