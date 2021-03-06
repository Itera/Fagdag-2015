﻿<%@ Page Title="" Language="C#" MasterPageFile="~/Templates/Sample/MasterPages/StarterDemoDefault.Master" AutoEventWireup="true" CodeBehind="Login.aspx.cs" Inherits="EPiServer.Commerce.Sample.Templates.Sample.Pages.Login" %>
<%@ Register Src="~/Templates/Sample/Units/Security/Login.ascx" TagName="Login" TagPrefix="Sample" %>

<asp:Content ID="Content1" ContentPlaceHolderID="MainContent" runat="server">
    <div class="row C_Page-header">
        <div class="span12">
            <h1>
                <EPiServer:Property PropertyName="PageTitle" ID="PageTitleID" runat="server" />
            </h1>
            <h4 class="subheader">
                <EPiServer:Property PropertyName="PageSubHeader" ID="PageSubHeaderID" runat="server" />
            </h4>
            <hr>
        </div>
    </div>
    <asp:PlaceHolder runat="server" ID="modulePlaceHolder">
        <Sample:Login ID="LoginID" runat="server"></Sample:Login>
    </asp:PlaceHolder>
</asp:Content>