<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Apartment._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">
      <br />
        <br />
    <asp:Panel ID="Panel1" runat="server" BackColor="#CCFFFF" BorderStyle="Double" CssClass="panel-body">

      
        <header class="" style="font-style: italic; font-weight: bold; color: #FF0000; font-size: large; text-align: center">
            <p> Create Maintenance Request </p>
        </header>
        <div class="form-group text-center">
            <asp:Label ID="lbl_fname" runat="server" Text="First Name" Font-Bold="True" ForeColor="#0000CC"></asp:Label>&nbsp; &nbsp;
        <asp:TextBox ID="txt_fname" runat="server" CausesValidation="True" ToolTip="First Name"></asp:TextBox> 
        <asp:RequiredFieldValidator ID="rfv_fname" runat="server" ErrorMessage="First Name is required" Text="*" ControlToValidate="txt_fname" ValidationGroup="Add" ForeColor="Red"></asp:RequiredFieldValidator>
        
            &nbsp; &nbsp; &nbsp;

            <asp:Label ID="lbl_lname" runat="server" Text="Last Name" Font-Bold="True" ForeColor="#0000CC"></asp:Label>&nbsp; &nbsp;
        <asp:TextBox ID="txt_lname" runat="server" ToolTip="Last Name" CausesValidation="True"></asp:TextBox>
        <asp:RequiredFieldValidator ID="rfv_lname" runat="server" ErrorMessage="Last Name is required" Text="*" ValidationGroup="Add" ControlToValidate="txt_lname" ForeColor="Red"></asp:RequiredFieldValidator>
       
        </div>

        <div class="form-group text-center">
             <asp:Label ID="lbl_aptno" runat="server" Text="Apartment Number" Font-Bold="True" ForeColor="#0000CC"></asp:Label>&nbsp; &nbsp;
        <asp:DropDownList ID="ddl_aptno" runat="server" CausesValidation="True" DataSourceID="SqlDataSource1" DataTextField="aptno" DataValueField="aptno"></asp:DropDownList>
        <asp:SqlDataSource ID="SqlDataSource1" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SELECT [aptno] FROM [aptno]"></asp:SqlDataSource>
            
            <asp:RequiredFieldValidator ID="rfv_aptno" runat="server" ErrorMessage="Select a valid apt no" Text="*" ControlToValidate="ddl_aptno" ForeColor="Red" ValidationGroup="Add"></asp:RequiredFieldValidator>
            &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; 
            <asp:Label ID="lbl_priority" runat="server" Text="Priority" Font-Bold="True" ForeColor="#0000CC"></asp:Label> &nbsp; &nbsp;
            <asp:RadioButton ID="rbtn_low" runat="server" Text="Low" GroupName="Priority" Checked="True" /> &nbsp; &nbsp;
            <asp:RadioButton ID="rbtn_medium" runat="server" GroupName="Priority" Text="Medium" /> &nbsp; &nbsp;
            <asp:RadioButton ID="rbtn_high" runat="server" Text="High" GroupName="Priority" />
        </div>

        <div class="form-group text-center">
            <asp:Label ID="lbl_description" runat="server" Text="Description" Font-Bold="True" ForeColor="#0000CC"></asp:Label> &nbsp; &nbsp;
            <asp:TextBox ID="txt_desc" runat="server" TextMode="MultiLine"></asp:TextBox>
        </div>

        <div class="form-group">

            <asp:Label ID="lbl_tech" runat="server" Text="Preferred Technician" Font-Bold="True" ForeColor="#0000CC"></asp:Label>  &nbsp; &nbsp; <br />
            <asp:CheckBoxList ID="cb_tech" runat="server" DataSourceID="SqlDataSource2" DataTextField="name" DataValueField="name"></asp:CheckBoxList>

            <asp:SqlDataSource ID="SqlDataSource2" runat="server" ConnectionString="<%$ ConnectionStrings:masterConnectionString %>" SelectCommand="SELECT [name] FROM [staff] WHERE ([designation] = @designation)">
                <SelectParameters>
                    <asp:Parameter DefaultValue="Maintenance Technician" Name="designation" Type="String" />
                </SelectParameters>
            </asp:SqlDataSource>

            
            

            </div>

        <div class="form-group ">

            <asp:Label ID="lbl_permit" runat="server" Text="Is it okay to enter the apartment when you are away?" Font-Bold="True" ForeColor="#0000CC"></asp:Label>
          
            <asp:RequiredFieldValidator ID="rfv_permit" runat="server" ErrorMessage="Select a suitable permission" ValidationGroup="Add" ControlToValidate="rbtn_permit" ForeColor="Red">*</asp:RequiredFieldValidator>
           <asp:RadioButtonList ID="rbtn_permit" runat="server">
               <asp:ListItem Selected="True">Yes</asp:ListItem>
               <asp:ListItem>No</asp:ListItem>
            </asp:RadioButtonList>
            
        
            </div>

        <div class="form-group text-center">

            <asp:Button CssClass="btn-primary" ID="btn_add" runat="server" Text="Submit" ValidationGroup="Add" OnClick="btn_add_Click" />
        </div>

        <asp:ValidationSummary ID="ValidationSummary1" runat="server" ForeColor="Red" ValidationGroup="Add" />
      
    </asp:Panel>
    
</asp:Content>
