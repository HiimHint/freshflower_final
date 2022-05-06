using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo_web_BanHoa
{
    public partial class Edit : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                if (Request.QueryString["MaHoa"] != null)
                {
                    int mahoa = int.Parse(Request.QueryString["MaHoa"]);
                    SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HoaTuoiDBConnectionString"].ConnectionString);
                    cnn.Open();
                    SqlCommand cmd = new SqlCommand("select * from Hoa where mahoa=@mahoa", cnn);
                    cmd.Parameters.AddWithValue("@mahoa", mahoa);
                    SqlDataReader r = cmd.ExecuteReader();
                    if (r.Read())
                    {
                        txtTenHoa.Text = r["TenHoa"].ToString();
                        ddlDanhMucHoa.SelectedValue = r["MaLoai"].ToString();
                        txtGia.Text = r["Gia"].ToString();
                        txtNgayCapNhat.Text = r["NgayDang"].ToString();
                        string path = ("~/Hinh_San_Pham/") + r["Hinh"];
                        fHinh.ImageUrl = path;
                        lbHinh.Text = r["Hinh"].ToString();
                        lbHinh.Visible = false;
                    }
                    cnn.Close();
                }
            }
        }

        protected void btnCapNhat_Click(object sender, EventArgs e)
        {
            int mahoa = int.Parse(Request.QueryString["MaHoa"]);
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HoaTuoiDBConnectionString"].ConnectionString);
            cnn.Open();
            SqlCommand cmd = new SqlCommand("update Hoa set TenHoa=@tenhoa,MaLoai=@maloai,Gia=@gia,NgayDang=@ngaydang,Hinh=@hinh where MaHoa=@mahoa", cnn);
            cmd.Parameters.AddWithValue("@tenhoa", txtTenHoa.Text);
            cmd.Parameters.AddWithValue("@maloai", ddlDanhMucHoa.SelectedValue);
            cmd.Parameters.AddWithValue("@gia", txtGia.Text);
            cmd.Parameters.AddWithValue("@ngaydang", txtNgayCapNhat.Text);

            cmd.Parameters.AddWithValue("@mahoa", mahoa);
            if (fileHinh.HasFile)
            {
                string path = Server.MapPath("~/Hinh_San_Pham/" + fileHinh.FileName);
                fileHinh.SaveAs(path);
                cmd.Parameters.AddWithValue("@hinh", fileHinh.FileName);
            }
            else
            {
                cmd.Parameters.AddWithValue("@hinh", lbHinh.Text);
            }

            int result = cmd.ExecuteNonQuery();
            if (result > 0)
            {
                Response.Redirect("XemHoa.aspx");
            }
        }
    }
}