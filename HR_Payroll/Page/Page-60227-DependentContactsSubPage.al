page 60227 "Dependent Contacts SubPage"
{
    // version PHASE -2

    AutoSplitKey = true;
    Caption = '"Dependent Contacts "';
    PageType = ListPart;
    SourceTable = "Employee Contacts Line";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Description; Rec.Description)
                {
                    Editable = EditBool;
                    ApplicationArea = All;
                }
                field(Type; Rec.Type)
                {
                    Editable = EditBool;
                    ApplicationArea = All;
                }
                field("Contact Number & Address"; Rec."Contact Number & Address")
                {
                    Editable = EditBool;
                    ApplicationArea = All;
                }
                field(Extension; Rec.Extension)
                {
                    Editable = EditBool;
                    ApplicationArea = All;
                }
                field(Primary; Rec.Primary)
                {
                    Editable = EditBool;
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        //CurrPage.UPDATE;
                    end;
                }
            }
        }
    }

    actions
    {
    }

    trigger OnAfterGetCurrRecord();
    begin
        Editing;
    end;

    trigger OnAfterGetRecord();
    begin
        Editing;
    end;

    trigger OnInit();
    begin
        Editing;
    end;

    var
        [InDataSet]
        EditBool: Boolean;

    local procedure Editing();
    begin
        /*DepMasterRec.RESET;
        DepMasterRec.SETRANGE("No.","Dependent ID");
        IF DepMasterRec.FINDFIRST THEN BEGIN
          IF DepMasterRec."Workflow Status" <> DepMasterRec."Workflow Status"::Open THEN
            EditBool := FALSE
          ELSE*/
        EditBool := true;
        //END;

    end;
}

