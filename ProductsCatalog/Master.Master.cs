using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ProductsCatalog
{
    public partial class Master : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!Page.AppRelativeVirtualPath.Equals("~/Default.aspx", StringComparison.OrdinalIgnoreCase)) //esto es para que el footer solo aparezca en default
            {
                footerDefault.Visible = false; 
            }
        }
    }
}