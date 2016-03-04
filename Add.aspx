<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Add.aspx.cs" Inherits="Clubs_Add" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
    <style type="text/css">
        .style3
        {
            width: 386px;
        }
        .style4
        {
            width: 215px;
        }
        .style5
        {
            width: 355px;
        }
    </style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
        Add a Club to the MISGA Clubs Database</h1>
        <br />

    <asp:Panel ID="Panel1" runat="server">

        <table style="width: 80%; margin-left: 5em;">
            <tr>
                <td class="style4">
                    &nbsp;
                    <asp:Label ID="Label14" runat="server" Text="*" ForeColor="Red" 
                        Font-Bold="True" ToolTip="Club ID is required"></asp:Label>
                    <asp:Label ID="Label1" runat="server" Text="Club ID:  " 
                        ToolTip="Club ID is required"></asp:Label>
                </td>
                <td class="style5">
                    &nbsp;
                    <asp:TextBox ID="tbHostID" runat="server" Width="94px"></asp:TextBox>
                    <asp:Label ID="lblIDUsed" runat="server" Font-Bold="True" ForeColor="Red" 
                        Text="Club ID already used." Visible="False"></asp:Label>
                </td>
                <td class="style3">
                    &nbsp;
                    <asp:RequiredFieldValidator ID="rfvClubID" runat="server" 
                        ControlToValidate="tbHostID" ErrorMessage="Club ID is a required Field." 
                        Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                    &nbsp;
                    <asp:Label ID="Label15" runat="server" Text="*" ForeColor="Red" 
                        Font-Bold="True" ToolTip="Club Name is required"></asp:Label>
                    <asp:Label ID="Label2" runat="server" Text="Club Name:  " 
                        ToolTip="Club Name is required"></asp:Label>
                </td>
                <td class="style5">
                    &nbsp;
                    <asp:TextBox ID="tbCName" runat="server" Width="295px"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;
                    <asp:RequiredFieldValidator ID="rfvCName" runat="server" 
                        ErrorMessage="Club Name is a required Field" ControlToValidate="tbCName" 
                        Font-Bold="True" ForeColor="Red"></asp:RequiredFieldValidator>
                </td>
            </tr>
            <tr>
                <td class="style4">
                &nbsp;
                    <asp:Label ID="Label18" runat="server" Text="MISGA Course Yardage"></asp:Label>
                    </td>
                    <td class="style5">&nbsp;
                    <asp:TextBox ID="tbYards" runat="server" Width="100px"></asp:TextBox></td>
                    <td class="style3">
                </td>
            </tr>
            <tr>
                <td class="style4">
                &nbsp;
                    <asp:Label ID="lblSlope" runat="server" Text="MISGA Course Slope"></asp:Label>
                    </td>
                    <td class="style5">&nbsp;
                    <asp:TextBox ID="tbSlope" runat="server" Width="40px"></asp:TextBox></td>
                    <td class="style3">
                        <asp:Label ID="lblSlopeError" runat="server" Font-Bold="True" ForeColor="Red" 
                            Text="Slope is 3 digits or less" Visible="False"></asp:Label>
                </td>
            </tr>
            <tr>
                <td class="style4">
                &nbsp;
                    <asp:Label ID="Label20" runat="server" Text="MISGA Course Rating"></asp:Label>
                    </td>
                    <td class="style5">&nbsp;
                    <asp:TextBox ID="tbRating" runat="server" Width="40px"></asp:TextBox></td>
                    <td class="style3">
                </td>
            </tr>
            <tr>
                <td class="style4">
                &nbsp;
                    <asp:Label ID="Label22" runat="server" Text="MISGA Course Par"></asp:Label>
                    </td>
                    <td class="style5">&nbsp;
                    <asp:TextBox ID="tbPar" runat="server" Width="40px"></asp:TextBox></td>
                    <td class="style3">
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
                    <asp:Label ID="Label13" runat="server" Text="Tee Choices"></asp:Label>
                </td>
                <td class="style5">
                    &nbsp;
                    <asp:TextBox ID="tbRule" runat="server" Text="" Width="295px" 
                        TextMode="MultiLine"></asp:TextBox>
                </td>
                <td class="style3">
                    &nbsp;<asp:Label ID="lblTeeChoiceError" runat="server" Text="Tee Choice truncated because it is limited to 1600 Characters." ForeColor="Red"></asp:Label>
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
                    <asp:Button ID="btnAdd" runat="server" Text="Add" onclick="btnAdd_Click" />
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

