<%@ Page Title="" Language="C#" MasterPageFile="~/layout.Master" AutoEventWireup="true" CodeBehind="Edit.aspx.cs" Inherits="Demo_web_BanHoa.Edit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <div class="justify-content-center">
        <div class="align-content-center border border-secondary" style="width: 500px;">
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
                    <asp:TextBox ID="txtNgayCapNhat"  runat="server"></asp:TextBox>
                </div>
            </div>
            <div class="row pt-3">
                <div class="col-4">
                    <p>Hình ảnh:</p>
                </div>
                <div class="col-8">
                    <asp:Image ID="fHinh" Width="200px" runat="server" />
                    <asp:FileUpload ID="fileHinh" runat="server" />
                    <asp:Label ID="lbHinh" runat="server" Text=""></asp:Label>
                    <br />
                </div>
            </div>
            <div style="text-align:center">
                <asp:Button ID="btnCapNhat" class="btn btn-primary" runat="server" Text="Cập nhật" OnClick="btnCapNhat_Click"  />
            </div>
            <div>
                <asp:Label ID="lbThongBao" runat="server" Text=""></asp:Label>
                <asp:ValidationSummary ID="vsThongBao" runat="server" EnableTheming="True" ForeColor="Red" />
            </div>
        </div>
        <div class="mt-3">
            <br />
            <asp:SqlDataSource ID="dsThemHoa" runat="server" ConnectionString="<%$ ConnectionStrings:HoaTuoiDBConnectionString %>" SelectCommand="SELECT * FROM [Hoa] WHERE ([MaHoa] = @MaHoa)">
                <selectparameters>
                    <asp:QueryStringParameter Name="MaHoa" QueryStringField="MaHoa" Type="Int32" />
                </selectparameters>
            </asp:SqlDataSource>
        </div>
    </div>
</asp:Content>
