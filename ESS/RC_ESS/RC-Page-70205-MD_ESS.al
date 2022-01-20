page 70205 "MD Self Servies ESS Role"
{
    // CurrPage."Help And Setup List".ShowFeatured;

    Caption = 'MD Employee Self Servies';
    PageType = RoleCenter;

    layout
    {
        area(rolecenter)
        {
            group("Employee Details")
            {
                part("USer Profile"; "DME Employee Picture 2")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
            group(p1)
            {
                ShowCaption = false;
                part(ChartESS; "My Leave Balance Chart")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
            group("Fixed Layout")
            {
                part(IDDownload; "Empl. Identification download")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
            group("Fixed Layout 2")
            {
                part(HrAnnouncement; "HR Announcements ESS List")
                {
                    ApplicationArea = Basic, Suite;
                }
            }
            // group("Fixed Layout 3")
            // {
            part(Control16; "DME Activities Cue")
            {
                AccessByPermission = TableData "DME Activities Cue" = I;
                ApplicationArea = Basic, Suite;
            }
            part(Control17; "DME Activities Cue 2")
            {
                AccessByPermission = TableData "DME Activities Cue" = I;
                ApplicationArea = Basic, Suite;
            }
            //}
        }
    }



    actions
    {
        // Start Top second Header Area
        // @mma0786
        area(embedding)
        {
            ToolTip = 'Manage your business. See KPIs, trial balance, and favorite customers.';
            action("My Personal Info.")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'My Personal Info.';
                Image = ContactPerson;
                RunObject = Page "Employee PErsonal Info. DME";
                //ToolTip = 'View or edit detailed information for the customers that you trade with. From each customer card, you can open related information, such as sales statistics and ongoing orders, and you can define special prices and line discounts that you grant if certain conditions are met.';
            }
            action("My Team")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'My Team';
                Image = TeamSales;
                Visible = true;
                RunObject = Page "My Teams List";
                //ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
            }
            action("Payslip")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Payslip';
                Image = Payables;
                RunObject = Page "Payslip Report Filter";
                //ToolTip = 'View or edit detailed information for the products that you trade in. The item card can be of type Inventory or Service to specify if the item is a physical unit or a labor time unit. Here you also define if items in inventory or on incoming orders are automatically reserved for outbound documents and whether order tracking links are created between demand and supply to reflect planning actions.';
            }
            action("Employee Directory")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'Company Directory';
                RunObject = Page "Employee Directory DME";
                ToolTip = 'View all employee basic contact details.';
            }
            action("MY Operations")
            {
                ApplicationArea = Basic, Suite;
                Caption = 'My Operations';
                Image = TeamSales;
                Visible = true;
                RunObject = codeunit "Rc Open";
                //ToolTip = 'View or edit detailed information for the vendors that you trade with. From each vendor card, you can open related information, such as purchase statistics and ongoing orders, and you can define special prices and line discounts that the vendor grants you if certain conditions are met.';
            }
            action("Leave Balance")
            {
                ApplicationArea = Basic, Suite;
                Image = Report;
                Caption = 'Leave Balance';
                RunObject = report "Leave Balance";
            }
        }
        // Stop Top second Header Area
        // @mma0786

    }


}
