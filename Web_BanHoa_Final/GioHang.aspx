<%@ Page Title="" Language="C#" MasterPageFile="~/Guess.Master" AutoEventWireup="true" CodeBehind="GioHang.aspx.cs" Inherits="Demo_web_BanHoa.GioHang" %>

<asp:Content ID="Content1" ContentPlaceHolderID="NoiDung" runat="server">
    <h1 class="text-center">Giỏ hàng</h1>
    <div class="row">
        <div class="col-sm-12">
            <div class="table-responsive">
                <table class="table table-bordered">
                    <tr>
                        <th>Hình</th>
                        <th>Tên sản phẩm</th>
                        <th>Số lượng</th>
                        <th>Đơn giá</th>
                        <th>Thành tiền</th>
                        <th></th>
                    </tr>
                </table>
            </div>
        </div>
    </div>

</asp:Content>
