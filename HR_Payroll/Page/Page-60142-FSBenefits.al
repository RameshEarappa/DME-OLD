page 60142 "FS Benefits"
{
    PageType = ListPart;
    SourceTable = "FS Benefits";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Benefit Code"; Rec."Benefit Code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Benefit Description"; Rec."Benefit Description")
                {
                    Editable = false;
                    //12.10.2020
                    Caption = 'Description';
                    //12.10.2020
                    ApplicationArea = All;
                }
                field("Calculation Unit"; Rec."Calculation Unit")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Benefit Amount"; Rec."Benefit Amount")
                {
                    ApplicationArea = All;
                    trigger OnValidate()
                    begin
                        CurrPage.UPDATE;
                    end;
                }
                field("Payable Amount"; Rec."Payable Amount")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
            }
        }
    }


}

