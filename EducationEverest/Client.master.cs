﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using Microsoft.AspNet.Identity;
  
public partial class Client : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.RawUrl.Contains("Dashboard"))
        {
            SideNavBar.Visible = false;
            SideNavBar2.Visible = true;
        }
    }
}
