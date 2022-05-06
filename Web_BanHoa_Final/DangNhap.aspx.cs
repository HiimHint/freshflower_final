using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;

namespace Demo_web_BanHoa
{
    public partial class DangNhap : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btDangNhap_Click(object sender, EventArgs e)
        {
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HoaTuoiDBConnectionString"].ConnectionString);
            cnn.Open();
            SqlCommand cmd = new SqlCommand("select * from TaiKhoan where TENDANGNHAP=@Tendangnhap and MATKHAU=@matkhau", cnn);
            cmd.Parameters.AddWithValue("@Tendangnhap", txtTDN.Text);
            cmd.Parameters.AddWithValue("@matkhau", txtMK.Text);
            SqlDataReader r = cmd.ExecuteReader();
            if (r.Read())
            {
                Session["USER"] = r["TENDANGNHAP"];
                Session["VAITRO"] = r["VAITRO"];
                Response.Redirect("XemHoa.aspx");
            }
            else
            {
                lbThongBao.Text = "Tên đăng nhập hoặc mật khẩu không chính xác. Đăng nhập thất bại";
            }
        }
    }
}