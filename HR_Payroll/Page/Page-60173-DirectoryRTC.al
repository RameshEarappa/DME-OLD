page 60173 "Directory RTC"
{
    DelayedInsert = false;
    DeleteAllowed = false;
    Editable = false;
    InsertAllowed = false;
    ModifyAllowed = false;
    MultipleNewLines = false;
    PageType = List;
    SaveValues = false;
    ShowFilter = false;
    SourceTable = Employee;
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                Editable = false;
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                }
                field("First Name"; Rec."First Name")
                {
                    ApplicationArea = All;
                }
                field("Middle Name"; Rec."Middle Name")
                {
                    ApplicationArea = All;
                }
                field("Last Name"; Rec."Last Name")
                {
                    ApplicationArea = All;
                }
            }
            //commented By Avinash    part("Employee Contacts    1"; "Employee Contacts SubPage")
            //commented By Avinash   {
            //commented By Avinash       ApplicationArea = Basic, Suite;
            //commented By Avinash       Editable = false;
            //commented By Avinash       SubPageLink = Field1 = FIELD ("No.");
            //commented By Avinash   }
        }
    }

    actions
    {
    }
}

