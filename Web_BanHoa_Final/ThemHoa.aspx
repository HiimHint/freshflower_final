<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="ThemHoa.aspx.cs" Inherits="Demo_web_BanHoa.ThemHoa" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <div class="justify-content-center" >
        <div class="align-content-center border border-secondary" style="width: 500px; ">
            <div class="row">
                <div class="col-4">
                    Danh mục
                </div>
                <div class="col-8">
                    <asp:DropDownList ID="ddlDanhMucHoa" runat="server" DataSourceID="dsDanhMuc" DataTextField="TenLoai" DataValueField="MaLoai"></asp:DropDownList>
                    <asp:SqlDataSource ID="dsDanhMuc" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Loai]"></asp:SqlDataSource>
                </div>
            </div>
            <div class="row pt-2">
                <div class="col-4">
                    Tên Hoa
                </div>
                <div class="col-8">
                    <asp:TextBox ID="txtTenHoa" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rvfTen" runat="server" ControlToValidate="txtTenHoa" Text="(*)" ForeColor="Red" ErrorMessage="Chưa nhập tên hoa!"></asp:RequiredFieldValidator>
                </div>
            </div>
            <div class="row pt-2">
                <div class="col-4">
                    Giá
                </div>
                <div class="col-8">
                    <asp:TextBox ID="txtGia" runat="server"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="rvfGia" runat="server" ControlToValidate="txtGia" Text="(*)" ForeColor="Red" ErrorMessage="Chưa nhập giá!"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="cpGia" runat="server" ErrorMessage="Giá phải nhập số" ControlToValidate="txtGia" Operator="DataTypeCheck" Type="Integer"></asp:CompareValidator>
                </div>
            </div>
            <div class="row pt-2">
                <div class="col-4">
                    Ngày cập nhật
                </div>
                <div class="col-8">
                    <asp:Calendar ID="cdNgay" runat="server" BackColor="#FFFFCC" BorderColor="#FFCC66" BorderWidth="1px" DayNameFormat="Shortest" Font-Names="Verdana" Font-Size="8pt" ForeColor="#663399" Height="200px" ShowGridLines="True" Width="220px">
                        <DayHeaderStyle BackColor="#FFCC66" Font-Bold="True" Height="1px" />
                        <NextPrevStyle Font-Size="9pt" ForeColor="#FFFFCC" />
                        <OtherMonthDayStyle ForeColor="#CC9966" />
                        <SelectedDayStyle BackColor="#CCCCFF" Font-Bold="True" />
                        <SelectorStyle BackColor="#FFCC66" />
                        <TitleStyle BackColor="#990000" Font-Bold="True" Font-Size="9pt" ForeColor="#FFFFCC" />
                        <TodayDayStyle BackColor="#FFCC66" ForeColor="White" />
                    </asp:Calendar>
                </div>
            </div>
            <div class="row pt-3">
                <div class="col-4">
                    <p>Hình ảnh:</p>
                </div>
                <div class="col-8">
                    <asp:FileUpload ID="fileHinh" runat="server"/>  
                    
                </div>

            </div>
            <div>
                <asp:Button ID="btThem" class="btn btn-primary" runat="server" Text="Thêm" OnClick="btThem_Click" />
            </div>
            <div>
                <asp:Label ID="lbThongBao" runat="server" Text=""></asp:Label>
                <asp:ValidationSummary ID="vsThongBao"  runat="server" EnableTheming="True" ForeColor="Red" />
            </div>
        </div>
        <div class="mt-3">
            
            <%--<script>
                // Add the following code if you want the name of the file appear on select
                $(".custom-file-input").on("change", function () {
                    var fileName = $(this).val().split("\\").pop();
                    $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
                });
            </script>--%>

            <br />
            <asp:SqlDataSource ID="dsThemHoa" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>"
                InsertCommand="INSERT INTO [Hoa] ([TenHoa], [Gia], [Hinh], [MaLoai], [NgayDang], [SoLuotXem]) VALUES (@TenHoa, @Gia, @Hinh, @MaLoai, @NgayDang, @SoLuotXem)">
                <InsertParameters>
                    <asp:Parameter Name="TenHoa" Type="String" />
                    <asp:Parameter Name="Gia" Type="Double" />
                    <asp:Parameter Name="Hinh" Type="String" />
                    <asp:Parameter Name="MaLoai" Type="Int32" />
                    <asp:Parameter Name="NgayDang" Type="DateTime" />
                    <asp:Parameter Name="SoLuotXem" Type="Int32" />
                </InsertParameters>
            </asp:SqlDataSource>

        </div>
    </div>

</asp:Content>
