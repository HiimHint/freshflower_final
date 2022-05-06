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
    public partial class XemHoa : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

            //if (Session["USER"] == null )
            //{
            //    if (Session["VAITRO"].ToString() == "QTV")
            //    {
                    
            //    }
            //    else
            //    {
            //        Response.Redirect("DangNhap.aspx");
            //    }
            //}
        }

        protected void btnXoa_Click(object sender, EventArgs e)
        {
            Button bt = (Button)sender;
            int mahoa = int.Parse(bt.CommandArgument);
            SqlConnection cnn = new SqlConnection(ConfigurationManager.ConnectionStrings["HoaTuoiDBConnectionString"].ConnectionString);
            cnn.Open();
            SqlCommand cmd = new SqlCommand("delete from Hoa where MaHoa=@mahoa", cnn);
            cmd.Parameters.AddWithValue("@mahoa", mahoa);
            
            try
            {
                cmd.ExecuteNonQuery();
                Response.Write("<script> alert('Xoá thành công!') </script>");
                lvHoa.DataSourceID = "dsHoa";
                lvHoa.DataBind();
            }
            catch(Exception ex)
            {
                Response.Write("<script> alert('Xoá không thành công!') </script>");
            }
        }

        protected void btEdit_Click(object sender, EventArgs e)
        {
            Response.Redirect("Edit.aspx");
        }
    }
}