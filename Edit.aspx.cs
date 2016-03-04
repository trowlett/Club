using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;

public partial class Edit : System.Web.UI.Page
{
    private string TeeChoice1;
    private string TeeChoice2;
    public string TeeChoiceError { get; set; }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            loadDDLClubSelect();
            lblTeeChoiceError.Visible = false;
        }
    }

    protected void loadDDLClubSelect()
    {
        string ClubsConnect = ConfigurationManager.ConnectionStrings["ClubsConnect"].ToString();
        MISGACLUBS db = new MISGACLUBS(ClubsConnect);

        var c = from t in db.Clubs
                orderby t.ClubName
                select new { t.ClubID, t.ClubName };

            foreach (var item in c)
            {
                ddlClubSelect.Items.Add(item.ClubID+" | "+item.ClubName);
            }
            if (ddlClubSelect.Items.Count == 0)
            {
                lblSelect.Text = "Clubs Datebase is Empty";
                ddlClubSelect.Visible = false;
            }
            else
            {
                ddlClubSelect.Visible = true;
            }
    }

    protected void ddlClubSelect_SelectedIndexChanged(object sender, EventArgs e)
    {
//        lblSelectedClub.Text = "You selected:  "+ddlClubSelect.SelectedItem.Text;
        lblSelectedClub.Text = "";
        showSelectedClub(ddlClubSelect.SelectedItem.Text.Substring(0,3));
        pnlShow.Visible = true;
        btnSelect.Visible = false;
    }
    protected void btnSelect_Click(object sender, EventArgs e)
    {
//        lblSelectedClub.Text = "You selected: " + ddlClubSelect.SelectedItem.Text;
        lblSelectedClub.Text = "";
        showSelectedClub(ddlClubSelect.SelectedItem.Text.Substring(0,3));
        pnlShow.Visible = true;
    }

    protected void showSelectedClub(string club)
    {
        string ClubsConnect = ConfigurationManager.ConnectionStrings["ClubsConnect"].ToString();
        MISGACLUBS db = new MISGACLUBS(ClubsConnect);

        var item = db.Clubs.Single(c => c.ClubID == club);

        tbHostID.Text = item.ClubID;
        tbHostID.Enabled = false;
        tbCName.Text = item.ClubName;
        tbSlope.Text = item.slope.Trim();
        tbYards.Text = GetNonNULL(item.MS_Yards);
        tbRating.Text = GetNonNULL(item.MS_Rating);
        tbPar.Text = GetNonNULL(item.MS_Par);
        tbURL.Text = item.MISGAURL;
        tbProName.Text = item.ProName;
        tbProEmail.Text = item.ProEmail;
        tbPhone.Text = item.ProPhone;
        tbFax.Text = item.ProFax;
        tbRep.Text = item.RepName;
        tbRepEmail.Text = item.RepEmail;
        tbRepPhone.Text = item.RepPhone;
        tbPayOpt.Text = item.PayOpt;
        tbRefresh.Text = item.Refresh;
        TeeChoice2 = "";
        if (item.TChoice != null) TeeChoice2 = item.TChoice.Trim();
        tbRule.Text = item.SRule.Trim() + TeeChoice2;

        tbOtherRule.Text = item.OtherRule;
        tbMisc.Text = item.Misc;

    }

    protected string GetNonNULL(string item)
    {
        string result = "";
        if (item != null) result = item.Trim();
        return result;
    }

    protected void btnUpdate_Click(object sender, EventArgs e)
    {
        lblSlopeError.Visible = false;
        updateClub(ddlClubSelect.SelectedItem.Text.Substring(0,3));
    }
    protected void updateClub(string club)
    {
        string ClubsConnect = ConfigurationManager.ConnectionStrings["ClubsConnect"].ToString();
        MISGACLUBS db = new MISGACLUBS(ClubsConnect);

        if (tbSlope.Text.Trim().Length > 3)
        {
            // error message that Slope is no more than 3 digits
            lblSlopeError.Visible = true;           
        }
        else
        {
            TeeChoiceError = "";
            string tc = tbRule.Text.Trim();
            if (tc.Length <= 400)
            {
                TeeChoice1 = tc;
                TeeChoice2 = "";
            }
            else
            {
                if (tc.Length > 1600)
                {
                    TeeChoice1 = tc.Substring(0, 400);
                    TeeChoice2 = tc.Substring(400, 1200);
                    lblTeeChoiceError.Visible = true;
                }
                else{
                    TeeChoice1 = tc.Substring(0, 400);
                    TeeChoice2 = tc.Substring(400, (tc.Length - 400));
                }
            }
            var Club = db.Clubs.Single(c => c.ClubID == club);
            //        Club.ClubID = tbHostID.Text.Trim();
            Club.ClubName = tbCName.Text.Trim();
            Club.MS_Yards = tbYards.Text.Trim();
            Club.slope = tbSlope.Text.Trim();
            Club.MS_Rating = tbRating.Text.Trim();
            Club.MS_Par = tbPar.Text.Trim();
            Club.MISGAURL = tbURL.Text.Trim();
            Club.ProName = tbProName.Text.Trim();
            Club.ProEmail = tbProEmail.Text.Trim();
            Club.ProPhone = tbPhone.Text.Trim();
            Club.ProFax = tbFax.Text.Trim();
            Club.RepName = tbRep.Text.Trim();
            Club.RepEmail = tbRepEmail.Text.Trim();
            Club.RepPhone = tbRepPhone.Text.Trim();
            Club.PayOpt = tbPayOpt.Text.Trim();
            Club.Refresh = tbRefresh.Text.Trim();
            Club.SRule = TeeChoice1;
            Club.TChoice = TeeChoice2;
            Club.OtherRule = tbOtherRule.Text.Trim();
            Club.Misc = tbMisc.Text.Trim();
            db.SubmitChanges();

            lblSelectedClub.Text = club = tbCName.Text + " updated.";
        }


    }

    protected void btnCancel_Click(object sender, EventArgs e)
    {
        Server.Transfer("Edit.aspx");
    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        deleteSelectedClub(ddlClubSelect.SelectedItem.Text.Substring(0, 3));

    }
    protected void deleteSelectedClub(string club)
    {
        string ClubsConnect = ConfigurationManager.ConnectionStrings["ClubsConnect"].ToString();
        MISGACLUBS db = new MISGACLUBS(ClubsConnect);

        Clubs oldClub = db.Clubs.Single(c => c.ClubID == club);
        // ask are you sure?
        db.Clubs.DeleteOnSubmit(oldClub);
        db.SubmitChanges();
        lblSelectedClub.Text = "You successfully deleted: " + ddlClubSelect.SelectedItem.Text;
        pnlShow.Visible = false;
    }
}