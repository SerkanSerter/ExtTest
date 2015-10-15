using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ExtTest
{
    public partial class ExtTest : System.Web.UI.Page
    {
        public void PageLoad(object o, EventArgs arg)
        { 
            DateTime dt1 = new DateTime(1991, 4, 30);
            DateTime dt2 = DateTime.Now; 
            var d = dt1 - dt2; 

        }
    }
}