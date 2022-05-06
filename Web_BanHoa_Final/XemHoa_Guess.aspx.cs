using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Demo_web_BanHoa
{
    public partial class XemHoa_Guess : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["USER"] = "k";
            Session["VAITRO"] = "h";            
        }
    }
}