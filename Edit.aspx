<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Edit" %>
<%@ Register
    Assembly="AjaxControlToolkit"
    Namespace="AjaxControlToolkit"
    TagPrefix="ajaxToolkit" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">

        .style4
        {
            width: 210px;
        }
        .style5
        {
            width: 355px;
        }
        .style3
        {
            width: 386px;
        }
        </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <asp:ScriptManager ID="ScriptManager1" runat="server">
        </asp:ScriptManager>

<script type="text/jscript">
    function cancelClicked() {
        var label = $get('cancelMsg');
        label.innerText = 'You canceled the delete of the club from the database on ' + (new Date()).localeFormat("T") + '.';
    }
</script>
     <h1>
         Edit a Club&#39;s Information in the MISGA Clubs Database</h1>
        <br />
    <asp:Panel ID="pnlSelect" runat="server">
        <asp:Label ID="lblSelect" runat="server" Text="Select the Club to edit: "></asp:Label>
        <asp:DropDownList ID="ddlClubSelect" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ddlClubSelect_SelectedIndexChanged" Width="200px">
        </asp:DropDownList>
        <asp:Button ID="btnSelect" runat="server" Text="Select" 
            onclick="btnSelect_Click" />
        <asp:Label ID="lblSelectedClub" runat="server"></asp:Label>    <span id="cancelMsg"></span>

    </asp:Panel>
    <asp:Panel ID="pnlShow" runat="server" Visible = "false">

        <table style="width: 80%; margin-left: 5em;">
            <tr>
                <td class="style4">
                    &nbsp;
                    <asp:Label ID="Label1" runat="server" Text="Club ID:  "></asp:Label>
                </td>
                <td class="style5">
                    &nbsp;
                    <asp:TextBox ID="tbHostID" runat="server" Width="94px"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;
                    <asp:Label ID="Label2" runat="server" Text="Club Name:  "></asp:Label>
                </td>
                <td class="style5">
                    &nbsp;
                    <asp:TextBox ID="tbCName" runat="server" Width="295px"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style4">
                &nbsp;
                    <asp:Label ID="Label10" runat="server" Text="Club's MISGA URL: "></asp:Label>
                    </td>
                <td class="style5">
                    &nbsp;
                    <asp:TextBox ID="tbURL" runat="server" Width="295px"></asp:TextBox></td>
                    <td class="style3">
                        &nbsp;
                        </td>
            </tr>
            <tr>
                <td class="style4">&nbsp;
                <asp:Label ID="LabelSlope" runat="server" Text="MISGA Course Yardage"></asp:Label></td>
                <td class="style5">
                &nbsp;
                <asp:TextBox ID="tbYards" runat="server" Width="100px"></asp:TextBox>
                </td>
                <td class="style3">&nbsp;
                </td></tr>
            <tr>
                <td class="style4">&nbsp;
                <asp:Label ID="Label14" runat="server" Text="MISGA Course Slope"></asp:Label></td>
                <td class="style5">
                &nbsp;
                <asp:TextBox ID="tbSlope" runat="server" Width="40px"></asp:TextBox>
                </td>
                <td class="style3">&nbsp;
                    <asp:Label ID="lblSlopeError" runat="server" Font-Bold="True" ForeColor="Red" 
                        Text="Slope must be less than 3 digits" Visible="False"></asp:Label>
                </td></tr>
            <tr>
                <td class="style4">&nbsp;
                <asp:Label ID="Label18" runat="server" Text="MISGA Course Rating"></asp:Label></td>
                <td class="style5">
                &nbsp;
                <asp:TextBox ID="tbRating" runat="server" Width="40px"></asp:TextBox>
                </td>
                <td class="style3">&nbsp;
                </td></tr>
            <tr>
                <td class="style4">&nbsp;
                <asp:Label ID="Label20" runat="server" Text="MISGA Course Par"></asp:Label></td>
                <td class="style5">
                &nbsp;
                <asp:TextBox ID="tbPar" runat="server" Width="40px"></asp:TextBox>
                </td>
                <td class="style3">&nbsp;
                </td></tr>
            <tr>
                <td class="style4">
                    &nbsp;
                    <asp:Label ID="Label3" runat="server" Text="Pro Name:  "></asp:Label>
                </td>
                <td class="style5">
                    &nbsp;
                    <asp:TextBox ID="tbProName" runat="server" style="margin-top: 2px" 
                        Width="258px"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;
                </td>
            </tr>
            <tr>
            <td class="style4">&nbsp;
                <asp:Label ID="Label8" runat="server" Text="Pro Email"></asp:Label>
                </td>
            <td class="style5">
                &nbsp;
                <asp:TextBox ID="tbProEmail" runat="server" style="margin-top: 2px"
                    Width="258px"></asp:TextBox>
                </td>
            <td class="style3">&nbsp;
                    </td>
                </tr>
            <tr>
                <td class="style4">
                    &nbsp;
                    <asp:Label ID="Label4" runat="server" Text="Club Phone Number:  "></asp:Label>
                </td>
                <td class="style5">
                    &nbsp;
                    <asp:TextBox ID="tbPhone" runat="server"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;
                    <asp:Label ID="Label5" runat="server" Text="Club Fax Number:  "></asp:Label>
                </td>
                <td class="style5">
                    &nbsp;
                    <asp:TextBox ID="tbFax" runat="server"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;
                    <asp:Label ID="Label6" runat="server" Text="MISGA Rep:  "></asp:Label>
                </td>
                <td class="style5">
                    &nbsp;
                    <asp:TextBox ID="tbRep" runat="server" style="margin-top: 0px" Width="258px"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;
                    <asp:Label ID="Label9" runat="server" Text="Rep's Email"></asp:Label>
                    </td>
                <td class="style5">
                    &nbsp;
                    <asp:TextBox ID="tbRepEmail" runat="server" style="margin-top: 0px" 
                        width="213px"></asp:TextBox></td>
                <td class="style3">
                    &nbsp;
                    </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;
                    <asp:Label ID="Label7" runat="server" Text="Rep Phone Number:  "></asp:Label>
                </td>
                <td class="style5">
                    &nbsp;
                    <asp:TextBox ID="tbRepPhone" runat="server"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp; 
                    <asp:Label ID="Label11" runat="server" Text="Payment Option"></asp:Label></td>
                <td class="style5">
                    &nbsp;
                    <asp:TextBox ID="tbPayOpt" runat="server" Width="295px"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;
                    <asp:Label ID="Label12" runat="server" Text="Refreshments Info"></asp:Label>
                </td>
                <td class="style5">
                    &nbsp;
                    <asp:TextBox ID="tbRefresh" runat="server" Width="295px" TextMode="MultiLine"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;
                    <asp:Label ID="Label13" runat="server" Text="Tee Choices"></asp:Label></td>
                <td class="style5">
                    &nbsp;
                    <asp:TextBox ID="tbRule" runat="server" Text="" Width="295px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;
                    <asp:Label ID="lblTeeChoiceError" runat="server" Text="Tee Choice truncated because it is limited to 1600 Characters." ForeColor="Red"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;
                    <asp:Label ID="Label16" runat="server" Text="Club Policies"></asp:Label>
                </td>
                <td class="style5">
                    &nbsp;
                    <asp:TextBox ID="tbOtherRule" runat="server" Text="" Width="295px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;
                    <asp:Label ID="Label17" runat="server" Text="Other Information"></asp:Label>
                </td>
                <td class="style5">
                    &nbsp;
                    <asp:TextBox ID="tbMisc" runat="server" Text="" Width="295px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;
                </td>
                <td class="style5">
                    &nbsp;
                </td>
                <td class="style3">
                    &nbsp;
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;

                </td>
                <td class="style5">
                &nbsp;
                    <asp:Button ID="btnUpdate" runat="server" Text="Update" onclick="btnUpdate_Click" 
                         />
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                         <asp:Button ID="btnDelete" runat="server" Text="Delete" 
                        onclick="btnDelete_Click" />
        <ajaxToolkit:ConfirmButtonExtender ID="cbe" runat="server" 
            ConfirmText="Are you sure you want to delete this club from the Clubs database?" 
            TargetControlID="btnDelete" onclientcancel="cancelClicked" />
                     
                                        
                </td>
                <td class="style3">
                    &nbsp;
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" 
                        onclick="btnCancel_Click" />
                                    </td>
            </tr>        </table>
        <br />
    </asp:Panel>

</asp:Content>

