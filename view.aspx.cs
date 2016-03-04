using System;
using System.Collections.Generic;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class view : System.Web.UI.Page
{
    public string path;
    public string eventID;
    private string CLUB;

    protected void Page_Load(object sender, EventArgs e)
    {
        pnlSelect.Visible = false;
        pnlShow.Visible = false;
        CLUB = Request.QueryString["CLUB"];
        if (CLUB == null)
        {
            pnlSelect.Visible = true;
            if (!IsPostBack)
            {
                loadDDLClubSelect();
            }
        }
        else
        {
            showSelectedClub(CLUB);
            pnlShow.Visible = true;
            btnSelect.Visible = false;
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
            ddlClubSelect.Items.Add(item.ClubID + " | " + item.ClubName);
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
        pnlSelect.Visible = true;
    }
    protected void ddlClubSelect_SelectedIndexChanged(object sender, EventArgs e)
    {
        lblSelectedClub.Text = "You selected:  "+ddlClubSelect.SelectedItem.Text;
//        lblSelectedClub.Text = "";
        showSelectedClub(ddlClubSelect.SelectedItem.Text.Substring(0, 3));
        pnlShow.Visible = true;
        btnSelect.Visible = true;
    }
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        lblSelectedClub.Text = "You selected: " + ddlClubSelect.SelectedItem.Text;
//        lblSelectedClub.Text = "";
        showSelectedClub(ddlClubSelect.SelectedItem.Text.Substring(0, 3));
        pnlShow.Visible = true;
    }
    protected void showSelectedClub(string club)
    {
        string ClubsConnect = ConfigurationManager.ConnectionStrings["ClubsConnect"].ToString();
        MISGACLUBS db = new MISGACLUBS(ClubsConnect);

        var item = db.Clubs.Single(c => c.ClubID == club);
        lblHeader.Text = string.Format("View Club: &nbsp{0} | {1}",item.ClubID,item.ClubName);
		MrLoadMixerInfo mixerInfo = new MrLoadMixerInfo(club);
		LoadMixerInfo(mixerInfo.MixerLines());
        MISGA_Std_Tee.Text = GetHostMISGAStdTee(club);
        
    }
    protected string GetHostMISGAStdTee(string hostID)
    {
            string stdTee = "MISGA Standard Tee Information is UNAVAILABLE.";
            string yards = "N/A";
            string rating = "N/A";
            string slope = "N/A";
            string par = "NA";
            string ClubsConnect = ConfigurationManager.ConnectionStrings["ClubsConnect"].ToString();
            MISGACLUBS cdb = new MISGACLUBS(ClubsConnect);

            Clubs item = cdb.Clubs.SingleOrDefault(c => c.ClubID.Trim() == hostID.Trim());
            if (item != null)
            {
                if (item.MS_Yards != null) yards = item.MS_Yards.Trim();
                if (item.MS_Rating != null) rating = item.MS_Rating.Trim();
                if (item.MS_Par != null) par = item.MS_Par.Trim();
                if (item.slope != "") slope = item.slope.Trim();
                stdTee = string.Format("MISGA Standard Tee is <b>{0}</b> yards; slope/rating is <b>{1}/{2}</b>; Par is <b>{3}</b>.", yards, slope, rating, par);
            }

            return stdTee;
    }
    /*
    protected string GetEventID(string Club)
    {
        string MRMISGADBConn = ConfigurationManager.ConnectionStrings["MRMISGADBConnectionString"].ToString();
        MRMISGADB mdb = new MRMISGADB(MRMISGADBConn);
        Events mixer = mdb.Events.FirstOrDefault(ev => ev.EventID.Substring(11,3) == Club);
        return mixer.EventID;

    }
     * */
    protected void LoadMixerInfo(string[] mixerLines)
    {
        litInfo.Text = "";
        int i = 0;
        foreach (string line in mixerLines)
        {
            i = i + 1;
            litInfo.Text = litInfo.Text + line;
        }
    }

}