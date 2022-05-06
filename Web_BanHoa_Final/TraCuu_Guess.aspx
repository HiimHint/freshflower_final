<%@ Page Title="" Language="C#" MasterPageFile="~/Guess.Master" AutoEventWireup="true" CodeBehind="TraCuu_Guess.aspx.cs" Inherits="Demo_web_BanHoa.TraCuu_Guess" %>
<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
     <div style="text-align:center; margin-top:20px">
        <h4> Giá bán từ 
        <asp:TextBox ID="txtGiaMin" runat="server"></asp:TextBox> 
        đến <asp:TextBox ID="txtGiaMax" runat="server"></asp:TextBox>
            <asp:Button ID="btTimKiem" runat="server" Text="Tìm kiếm" />
    </h4> 
    </div>
    <asp:SqlDataSource ID="dsHoa" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT [MaHoa], [TenHoa], [Gia], [Hinh], [MaLoai] FROM [Hoa] WHERE (([Gia] &gt;= @Gia) AND ([Gia] &lt;= @Gia2))">
        <SelectParameters>
            <asp:ControlParameter ControlID="txtGiaMin" Name="Gia" PropertyName="Text" Type="Double" />
            <asp:ControlParameter ControlID="txtGiaMax" Name="Gia2" PropertyName="Text" Type="Double" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="lvHoa" runat="server" DataSourceID="dsHoa" DataKeyNames="MaHoa">
        <LayoutTemplate>
            <div id="ItemPlaceholderContainer" class="row" runat="server" style="">
                <div id="itemPlaceHolder" runat="server">

                </div>
            </div>
            <div style="padding:15px" class="text-center">
        <asp:DataPager ID="DataPager1" runat="server" PageSize="8">
        <Fields> 
            <asp:NextPreviousPagerField ButtonType="Button" FirstPageText="Đầu" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false"/>
            <asp:NumericPagerField />
            <asp:NextPreviousPagerField ButtonType="Button" FirstPageText="Cuối" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
        </Fields>
    </asp:DataPager>
    </div>
        </LayoutTemplate>
        <ItemTemplate>
            <div class="col-sm-3 text-center" style="padding:15px">
                <asp:Image ID="Hinh" runat="server" Width="100%" ImageUrl='<%# Eval("Hinh","~/Hinh_San_Pham/{0}") %>'/>
                <br />
                <asp:Label ID="lbTenHoa" runat="server" Text='<%# Eval("TenHoa") %>'></asp:Label><br />
                Giá : <asp:Label ID="lbGia" runat="server" Text='<%# Eval("Gia","{0: #,##0} đồng") %>'></asp:Label>
                <br />
                <asp:Button ID="btAddToCard" runat="server" CssClass="btn btn-success" Text="Add To Card"/>
            </div>
            
        </ItemTemplate>
        <EmptyDataTemplate>
            <div class="alert alert-danger" style="margin-top:20px"> Không có sản phẩm.</div>
        </EmptyDataTemplate>
        
    </asp:ListView>
</asp:Content>
