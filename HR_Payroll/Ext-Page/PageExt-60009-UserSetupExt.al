pageextension 60009 UserSetupExt extends "User Setup"
{
    layout
    {
        // Add changes to page layout here
        addlast(Control1)
        {
            field("Employee Id"; Rec."Employee Id")
            {
                ApplicationArea = All;
            }
            field("HR Manager"; Rec."HR Manager")
            {
                ApplicationArea = All;
            }
            field(Finances; Rec.Finances)
            {
                ApplicationArea = All; // @mma0786
            }
            field("Profile ID"; Rec."Profile ID")
            {
                ApplicationArea = All; // @mma0786
            }
        }

    }

    actions
    {
        addlast(Navigation)
        {
            group("E-signatures")
            {
                Caption = 'E-signature';
                Image = Register;
                Visible = false;
                action("E-signature")
                {
                    Caption = 'E-signature';
                    Image = UserCertificate;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;
                    // RunObject = Page 50000;
                    //               RunPageLink = Field1 = FIELD(User ID);
                }
            }
        }
    }

    var
        myInt: Integer;
}