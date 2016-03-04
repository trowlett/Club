using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Clubs_Add : System.Web.UI.Page
{
    private string TeeChoice1;
    private string TeeChoice2;
    public string TeeChoiceError { get; set; }
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            lblIDUsed.Visible = false;
            lblTeeChoiceError.Visible = false;
        }
    }
    protected void btnAdd_Click(object sender, EventArgs e)
    {
        string ClubsConnect = ConfigurationManager.ConnectionStrings["ClubsConnect"].ToString();
        MISGACLUBS db = new MISGACLUBS(ClubsConnect);
        TeeChoiceError = "";
        if (tbHostID.Text.Trim() == "")
        {
        }
        else
        {
            var Club = db.Clubs.SingleOrDefault(c => c.ClubID.Trim() == tbHostID.Text.Trim());
            if (Club != null)
            {
                // Error:  Club already on file
                lblIDUsed.Visible = true;
            }
            else
            {
                // Club not on file:  add it.
                if (tbSlope.Text.Trim().Length > 3)
                {
                    lblSlopeError.Visible = true;
                }
                else
                {
                    string tc = tbRule.Text.Trim();
                    if (tc.Length <= 400)
                    {
                        TeeChoice1 = tc.Substring(0,tc.Length);
                        TeeChoice2 = "";
                    }
                    else
                    {
                        TeeChoice1 = tc.Substring(0, 400);
                        if (tc.Length <= 1600)
                        {
                            TeeChoice2 = tc.Substring(400, (tc.Length - 400));
                        }
                        else
                        {
                            TeeChoice2 = tc.Substring(400, 1200);
                            lblTeeChoiceError.Visible = true;
                        }


                    }
                    Clubs host = new Clubs
                    {

                    ClubID = tbHostID.Text.Trim(),
                    ClubName = tbCName.Text.Trim(),
                    MS_Yards = tbYards.Text.Trim(),
                    slope = tbSlope.Text.Trim(),
                    MS_Rating = tbRating.Text.Trim(),
                    MS_Par = tbPar.Text.Trim(),
                    ProName = tbProName.Text.Trim(),
                    ProEmail = tbProEmail.Text.Trim(),
                    ProPhone = tbPhone.Text.Trim(),
                    ProFax = tbFax.Text.Trim(),
                    RepName = tbRep.Text.Trim(),
                    RepEmail = tbRepEmail.Text.Trim(),
                    RepPhone = tbRepPhone.Text.Trim(),
                    MISGAURL = tbURL.Text.Trim(),
                    SRule = TeeChoice1,
                    TChoice = TeeChoice2,
                    Refresh = tbRefresh.Text,
                    PayOpt = tbPayOpt.Text,
                    OtherRule = tbOtherRule.Text,
                    Misc = tbMisc.Text

                    };
                    db.Clubs.InsertOnSubmit(host);
                    db.SubmitChanges();
                    lblIDUsed.Text = "Club successfully added";
                    lblIDUsed.Visible = true;
                }
            }
        }
        
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Server.Transfer("Add.aspx");
    }
}