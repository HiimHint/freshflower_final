<%@ Page Title="" Language="C#" MasterPageFile="~/Guess.Master" AutoEventWireup="true" CodeBehind="XemHoa_Guess.aspx.cs" Inherits="Demo_web_BanHoa.XemHoa_Guess" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <div class="form-inline">      
        <asp:SqlDataSource ID="dsDanhMucHoa" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
    </div>
    <asp:SqlDataSource ID="dsHoa" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Hoa] WHERE ([MaLoai] = @MaLoai)">
        <SelectParameters>
            <asp:QueryStringParameter DefaultValue="1" Name="MaLoai" QueryStringField="MaLoai" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>
    <div class="row">
        <div class="col-md-3">
            <div class="list-group" style="width:300px">
                <a href="#" class="list-group-item list-group-item-action active">Danh mục</a>
                <asp:Repeater ID="rptLoai" runat="server" DataSourceID="dsDanhMucHoa">
                    <ItemTemplate>
                        <a href='<%# Eval("MaLoai","XemHoa_Guess.aspx?MaLoai={0}") %>' class="list-group-item list-group-item-action"><%# Eval("Tenloai") %></a>                   
                    </ItemTemplate>
                </asp:Repeater>
            </div>
        </div>
        <div class="col-md-9">
            <asp:ListView ID="lvHoa" runat="server" DataSourceID="dsHoa" DataKeyNames="MaHoa">
                <LayoutTemplate>
                    <div id="ItemPlaceholderContainer" class="row" runat="server" style="">
                        <div id="itemPlaceHolder" runat="server">
                        </div>
                    </div>
                    <div style="padding: 15px" class="text-center">
                        <asp:DataPager ID="DataPager1" runat="server" PageSize="4">
                            <Fields>
                                <asp:NextPreviousPagerField ButtonType="Button" FirstPageText="Đầu" ShowFirstPageButton="true" ShowLastPageButton="false" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                                <asp:NumericPagerField />
                                <asp:NextPreviousPagerField ButtonType="Button" FirstPageText="Cuối" ShowFirstPageButton="false" ShowLastPageButton="true" ShowNextPageButton="false" ShowPreviousPageButton="false" />
                            </Fields>
                        </asp:DataPager>
                    </div>
                </LayoutTemplate>
                <ItemTemplate>
                    <div class="col-sm-3 text-center" style="padding: 15px">
                        <asp:Image ID="Hinh" runat="server" Width="100%" ImageUrl='<%# Eval("Hinh","~/Hinh_San_Pham/{0}") %>' />
                        <br />
                        <asp:Label ID="lbTenHoa" runat="server" Text='<%# Eval("TenHoa") %>'></asp:Label><br />
                        Giá :
                        <asp:Label ID="lbGia" runat="server" ForeColor="#ff3300" Text='<%# Eval("Gia","{0: #,##0} đồng") %>'></asp:Label>
                        <br />
                        <asp:Button ID="btAddToCard" runat="server" CssClass="btn btn-success" Text="Thêm vào giỏ hàng" />
                    </div>
                </ItemTemplate>
                <EmptyDataTemplate>
                    <div class="alert alert-danger" style="margin-top: 20px">Hiện chưa có sản phẩm nào trong danh mục này.</div>
                </EmptyDataTemplate>
            </asp:ListView>

        </div>
    </div>


</asp:Content>
