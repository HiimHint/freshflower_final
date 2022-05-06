<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="XemHoa.aspx.cs" Inherits="Demo_web_BanHoa.XemHoa" %>
<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <div class="form-inline">
        Danh mục hoa <asp:DropDownList ID="dlLoai" CssClass="form-control" Width="200px" runat="server" DataSourceID="dsDanhMucHoa" DataTextField="TenLoai" DataValueField="MaLoai" AutoPostBack="true"></asp:DropDownList>
    <asp:SqlDataSource ID="dsDanhMucHoa" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
    </div>
    <asp:SqlDataSource ID="dsHoa" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT [MaHoa], [TenHoa], [Gia], [Hinh], [MaLoai] FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>
            <asp:ControlParameter ControlID="dlLoai" DefaultValue="1" Name="MaLoai" PropertyName="SelectedValue" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <asp:ListView ID="lvHoa" runat="server" DataSourceID="dsHoa" DataKeyNames="MaHoa">
        <LayoutTemplate>
            <div id="ItemPlaceholderContainer" class="row" runat="server" style="">
                <div id="itemPlaceHolder" runat="server">

                </div>
            </div>
            <div style="padding:15px" class="text-center">
        <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
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
                <asp:HyperLink ID="HyperLink1" NavigateUrl='<%# Eval("MaHoa","Edit.aspx?MaHoa={0}") %>' CssClass="btn btn-info" runat="server">[Sửa]</asp:HyperLink>
                <asp:Button ID="btnXoa" runat="server" CommandArgument='<%# Eval("MaHoa") %>' CssClass="btn btn-danger" ForeColor="White" Text="xoá" OnClick="btnXoa_Click" />
            </div>
        </ItemTemplate>
        <EmptyDataTemplate>
            <div class="alert alert-danger" style="margin-top:20px"> Không có sản phẩm.</div>
        </EmptyDataTemplate>
    </asp:ListView>    
</asp:Content>
