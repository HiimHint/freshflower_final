<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DangNhap.aspx.cs" Inherits="Demo_web_BanHoa.DangNhap" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
        <div style="text-align:center; width:500px; height:200px; margin:auto; margin-top:100px; border-width:2px; border-style:solid"  >
            <div >
                <h2>Đăng nhập hệ thống</h2>
                <hr />
            </div>
            <div style="text-align:left;padding:10px" >
                <asp:Label ID="Label1" runat="server" Text="Tên đăng nhập" Width="100px" Height="20px"></asp:Label>
            <asp:TextBox ID="txtTDN" runat="server" Width="200px" Height="20px"></asp:TextBox>
            <br />
            <asp:Label ID="Label2" runat="server" Text="Mật khẩu" Width="100px" Height="20px"></asp:Label>
            
            <asp:TextBox ID="txtMK" runat="server" TextMode="Password" Width="200px" Height="20px"></asp:TextBox>
            <br />
                <div style="text-align:center">
                    <asp:Button ID="btDangNhap" runat="server" Text="Đăng nhập" Height="30px" OnClick="btDangNhap_Click" />
                <br />
            <asp:Label ID="lbThongBao" runat="server" Text="" ForeColor="#ff0000"></asp:Label>
                </div>
            </div>            
        </div>
    </form>
</body>
</html>
