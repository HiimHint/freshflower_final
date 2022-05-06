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
    public partial class ThemHoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (Session["USER"] == null && Session["VAITRO"].ToString() != "QTV")
            {
                Response.Redirect("DangNhap.aspx");
            }
        }

        protected void btThem_Click(object sender, EventArgs e)
        {
            //string tenHinh = fileHinh.FileName;
            //dsThemHoa.InsertParameters["TenHoa"].DefaultValue = txtTenHoa.Text;
            //dsThemHoa.InsertParameters["Gia"].DefaultValue = txtGia.Text;
            //dsThemHoa.InsertParameters["NgayDang"].DefaultValue = cdNgay.SelectedDate.ToString();
            //dsThemHoa.InsertParameters["MaLoai"].DefaultValue = ddlDanhMucHoa.SelectedValue;
            //dsThemHoa.InsertParameters["Hinh"].DefaultValue = tenHinh;
            //dsThemHoa.Insert();
            //fileHinh.SaveAs(MapPath("~/Hinh_San_Pham/" + tenHinh));
            //Response.Write("<script> alert('Thêm thành công')</script>");

            //Mở kết nối
            string Chuoi_ket_noi = ConfigurationManager.ConnectionStrings["HoaTuoiDBConnectionString"].ConnectionString;
            SqlConnection conn = new SqlConnection(Chuoi_ket_noi);
            conn.Open();
            //tạo đối tượng thực thi truy vấn
            SqlCommand cmd = new SqlCommand("insert into Hoa (TenHoa,Gia,Hinh,MaLoai,NgayDang,SoLuotXem) values (@TenHoa,@Gia,@Hinh,@MaLoai,@NgayDang,@SoLuotXem)",conn);
            cmd.Parameters.AddWithValue("@TenHoa", txtTenHoa.Text);
            cmd.Parameters.AddWithValue("@Gia", int.Parse(txtGia.Text));
            cmd.Parameters.AddWithValue("@MaLoai", ddlDanhMucHoa.SelectedValue);
            cmd.Parameters.AddWithValue("@NgayDang", cdNgay.SelectedDate.ToString());
            cmd.Parameters.AddWithValue("@SoLuotXem", 0);
            if (fileHinh.HasFile)//nếu có hình
            {
                //Xử lý upload file hinh lên sever
                string path = Server.MapPath("~/Hinh_San_Pham") + "/" + fileHinh.FileName;
                fileHinh.SaveAs(path);
                cmd.Parameters.AddWithValue("@Hinh", fileHinh.FileName);
            }
            else//Không có hình 
            {
                cmd.Parameters.AddWithValue("@Hinh", "no_image.png");
                
            }
            //Thi hành truy vấn và xử lý kết quả trả về
            try
            {
                cmd.ExecuteNonQuery();
                lbThongBao.Text = "Thêm thành công";

            }
            catch(Exception ex)
            {
                lbThongBao.Text = "Thêm thất bại";
                lbThongBao.Text = ex.ToString();
            }
            
        }
    }
}