page 70152 "Employee Self Servies ESS Role"
{
    // CurrPage."Help And Setup List".ShowFeatured;

    Caption = 'Employee Self Servies';
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
        area(Sections)
        {
            group(Action39)
            {
                Caption = 'My Personal Info.';
                action("My Personal Info.")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'My Personal Info.';
                    Image = ContactPerson;
                    RunObject = Page "Employee PErsonal Info. DME";
                }
                action("Payslip")
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Payslip';
                    Image = Payables;
                    RunObject = Page "Payslip Report Filter";
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
                }
            }
        }
        // Stop Top second Header Area
        // @mma0786

    }

}
