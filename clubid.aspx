<%@ Page Title="MISGA SignUp - Club IDs" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="clubid.aspx.cs" Inherits="clubid" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h2>Club IDs</h2>
            <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ClubsConnect %>" 
            SelectCommand="SELECT [ClubID], [ClubName] FROM [Clubs]" ProviderName="System.Data.SqlClient">
        </asp:SqlDataSource>

    <div style="margin-left: 50px;">
        <asp:GridView ID="GridView1" runat="server" AllowPaging="True" AllowSorting="True" AutoGenerateColumns="False" CellPadding="4" DataKeyNames="ClubID" DataSourceID="SqlDataSource1" ForeColor="#333333" GridLines="None" PageSize="25">
            <AlternatingRowStyle BackColor="White" />
            <Columns>
                <asp:BoundField DataField="ClubID" HeaderText="ID" ReadOnly="True" SortExpression="ClubID" >
                <HeaderStyle HorizontalAlign="Left" Width="100px" />
                </asp:BoundField>
                <asp:BoundField DataField="ClubName" HeaderText="Club Name" SortExpression="ClubName" >
                <HeaderStyle HorizontalAlign="Left" Width="400px" />
                </asp:BoundField>
            </Columns>
            <EditRowStyle BackColor="#7C6F57" />
            <FooterStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <HeaderStyle BackColor="#1C5E55" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#666666" ForeColor="White" HorizontalAlign="Center" />
            <RowStyle BackColor="#E3EAEB" />
            <SelectedRowStyle BackColor="#C5BBAF" Font-Bold="True" ForeColor="#333333" />
            <SortedAscendingCellStyle BackColor="#F8FAFA" />
            <SortedAscendingHeaderStyle BackColor="#246B61" />
            <SortedDescendingCellStyle BackColor="#D4DFE1" />
            <SortedDescendingHeaderStyle BackColor="#15524A" />
        </asp:GridView>

    </div>

</asp:Content>

