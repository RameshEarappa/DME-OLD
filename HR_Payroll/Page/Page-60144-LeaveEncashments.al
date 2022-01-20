page 60144 "Leave Encashments"
{
    Editable = true; // @mma0786
    PageType = ListPart;
    SourceTable = "Leave Encashment";
    ApplicationArea = All;
    UsageCategory = Lists;
    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Journal ID"; Rec."Journal ID")
                {
                    ApplicationArea = All;
                    Editable = false; //@mma0786
                }
                field("Employee No."; Rec."Employee No.")
                {
                    ApplicationArea = All;
                    Editable = false; //@mma0786
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    Editable = false; //@mma0786
                }
                field("Leave Units"; Rec."Leave Units")
                {
                    ApplicationArea = All;
                }
                field("Leave Encashment Amount"; Rec."Leave Encashment Amount")
                {
                    ApplicationArea = All;
                }
            }
        }
    }


}

