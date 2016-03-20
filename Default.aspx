<%@ Page Title="" Language="C#" MasterPageFile="~/Site.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Clubs_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="HeadContent" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="MainContent" Runat="Server">
    <h1>
        Clubs Database Maintenance</h1>
    <p>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" 
            ConnectionString="<%$ ConnectionStrings:ClubsConnect %>" 
            SelectCommand="SELECT ClubID, ClubName, RepName, RepEmail, RepPhone FROM misgaclubs.Clubs ORDER BY ClubName">
        </asp:SqlDataSource>
        <asp:ListView ID="ListView1" runat="server" DataKeyNames="ClubID" 
            DataSourceID="SqlDataSource1">
            <AlternatingItemTemplate>
                <tr style="background-color:#FFF8DC;">
                    <td>
                        <a href="view.aspx?CLUB=<%# Eval("ClubID") %>"><%# Eval("ClubID") %></a>
                    </td>
                    <td>
                        <a href="view.aspx?CLUB=<%# Eval("ClubID") %>"><%# Eval("ClubName") %></a>
                    </td>
                    <td>
                        <asp:Label ID="RepNameLabel" runat="server" Text='<%# Eval("RepName") %>' />
                     </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("RepEmail") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("RepPhone") %>' />
                    </td>
                </tr>
            </AlternatingItemTemplate>
            <EditItemTemplate>
                <tr style="background-color:#008A8C;color: #FFFFFF;">
                    <td>
                        <asp:Button ID="UpdateButton" runat="server" CommandName="Update" 
                            Text="Update" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Cancel" />
                    </td>
                    <td>
                        <asp:Label ID="ClubIDLabel1" runat="server" Text='<%# Eval("ClubID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ClubNameTextBox" runat="server" 
                            Text='<%# Bind("ClubName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="RepNameTextBox" runat="server" Text='<%# Bind("RepName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="RepEmailTextBox" runat="server" 
                            Text='<%# Bind("RepEmail") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="RepPhoneTextBox" runat="server" 
                            Text='<%# Bind("RepPhone") %>' />
                    </td>
                </tr>
            </EditItemTemplate>
            <EmptyDataTemplate>
                <table runat="server" 
                    style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;">
                    <tr>
                        <td>
                            No data was returned.</td>
                    </tr>
                </table>
            </EmptyDataTemplate>
            <InsertItemTemplate>
                <tr style="">
                    <td>
                        <asp:Button ID="InsertButton" runat="server" CommandName="Insert" 
                            Text="Insert" />
                        <asp:Button ID="CancelButton" runat="server" CommandName="Cancel" 
                            Text="Clear" />
                    </td>
                    <td>
                        <asp:TextBox ID="ClubIDTextBox" runat="server" Text='<%# Bind("ClubID") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="ClubNameTextBox" runat="server" 
                            Text='<%# Bind("ClubName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="RepNameTextBox" runat="server" Text='<%# Bind("RepName") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="RepEmailTextBox" runat="server" 
                            Text='<%# Bind("RepEmail") %>' />
                    </td>
                    <td>
                        <asp:TextBox ID="RepPhoneTextBox" runat="server" 
                            Text='<%# Bind("RepPhone") %>' />
                    </td>
                </tr>
            </InsertItemTemplate>
            <ItemTemplate>
                <tr style="background-color:#DCDCDC;color: #000000;">
                    <td>
                        <a href="view.aspx?CLUB=<%# Eval("ClubID") %>"><%# Eval("ClubID") %></a>
                    </td>
                    <td>
                        <a href="view.aspx?CLUB=<%# Eval("ClubID") %>"><%# Eval("ClubName") %></a>
                    </td>
                     <td>
                        <asp:Label ID="RepNameLabel" runat="server" Text='<%# Eval("RepName") %>' />
                     </td>
                    <td>
                        <asp:Label ID="Label1" runat="server" Text='<%# Eval("RepEmail") %>' />
                    </td>
                    <td>
                        <asp:Label ID="Label2" runat="server" Text='<%# Eval("RepPhone") %>' />
                    </td>
                </tr>
            </ItemTemplate>
            <LayoutTemplate>
                <table runat="server">
                    <tr runat="server">
                        <td runat="server">
                            <table ID="itemPlaceholderContainer" runat="server" border="1" 
                                style="background-color: #FFFFFF;border-collapse: collapse;border-color: #999999;border-style:none;border-width:1px;font-family: Verdana, Arial, Helvetica, sans-serif;">
                                <tr runat="server" style="background-color:#DCDCDC;color: #000000;">
                                    <th runat="server" class="idcol">
                                        Club ID</th>
                                    <th runat="server" class="clubname">
                                        Club Name</th>
                                    <th runat="server" class="rep">
                                        Rep Name</th>
                                    <th runat="server" class="repemail">
                                        Rep Email</th>
                                    <th runat="server" class="repphone">
                                        Rep Phone</th>
                                </tr>
                                <tr ID="itemPlaceholder" runat="server">
                                </tr>
                            </table>
                        </td>
                    </tr>
                    <tr runat="server">
                        <td runat="server" 
                            style="text-align: center;background-color: #CCCCCC;font-family: Verdana, Arial, Helvetica, sans-serif;color: #000000;">
                            <asp:DataPager ID="DataPager1" runat="server" PageSize="24">
                                <Fields>
                                    <asp:NextPreviousPagerField ButtonType="Button" ShowFirstPageButton="True" 
                                        ShowLastPageButton="True" />
                                </Fields>
                            </asp:DataPager>
                        </td>
                    </tr>
                </table>
            </LayoutTemplate>
            <SelectedItemTemplate>
                <tr style="background-color:#008A8C;font-weight: bold;color: #FFFFFF;">
                    <td>
                        <a href="view.aspx?CLUB=<%# Eval("ClubID") %>"><%# Eval("ClubID") %></a>
                    </td>
                    <td>
                        <asp:Label ID="ClubNameLabel" runat="server" Text='<%# Eval("ClubName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="RepNameLabel" runat="server" Text='<%# Eval("RepName") %>' />
                    </td>
                    <td>
                        <asp:Label ID="RepEmailLabel" runat="server" Text='<%# Eval("RepEmail") %>' />
                    </td>
                    <td>
                        <asp:Label ID="RepPhoneLabel" runat="server" Text='<%# Eval("RepPhone") %>' />
                    </td>
                </tr>
            </SelectedItemTemplate>
        </asp:ListView>
    </p>

</asp:Content>

