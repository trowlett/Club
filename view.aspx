<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="view.aspx.cs" Inherits="view" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
	<link href="Styles/SignupStyles.css" rel="stylesheet" type="text/css" />
	<link href="Styles/playerslist.css" rel="stylesheet" type="text/css" />
    <link href="Styles/style2.css" rel="Stylesheet" type="text/css" />
    <link href="Styles/StyleSheet1.css" rel="Stylesheet" type="text/css" />

</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1><asp:Label ID="lblHeader" runat="server" Text="View Club&#39;s Description"></asp:Label>
    </h1>

   <asp:Panel ID="pnlSelect" runat="server">
        <asp:Label ID="lblSelect" runat="server" Text="Select the Club to edit: "></asp:Label>
        <asp:DropDownList ID="ddlClubSelect" runat="server" AutoPostBack="True" 
            onselectedindexchanged="ddlClubSelect_SelectedIndexChanged" Width="200px">
        </asp:DropDownList>
        <asp:Button ID="btnSelect" runat="server" Text="Select" 
            onclick="btnSelect_Click" />
        <asp:Label ID="lblSelectedClub" runat="server"></asp:Label>    <span id="cancelMsg"></span>

    </asp:Panel>

    <asp:Panel ID="pnlShow" runat="server" Visible="true">
    <div class="mixerinfo">
		<asp:Literal ID="litInfo" runat="server" Mode="PassThrough"></asp:Literal>
                <p class="center">
                <asp:Label ID="MISGA_Std_Tee" runat="server" Text="Club's Standard MISGA Tee:  yds., slope and rating."></asp:Label>
                    &nbsp;
                    <asp:Label ID="Select_STD" runat="server" Text="Select <b>STD</b> in Tee Choices below." Visible="False"></asp:Label>
                    </p>
			</div>

    </asp:Panel>

</asp:Content>

