page 60187 "Employee Skills List"
{
    CardPageID = "Employee Skill Card";
    Editable = false;
    InsertAllowed = false;
    PageType = List;
    SourceTable = "Payroll Job Skill Line";
    UsageCategory = Administration;
    ApplicationArea = All;

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("Emp ID"; Rec."Emp ID")
                {
                    ApplicationArea = All;
                }
                field("Emp Full Name"; Rec."Emp Full Name")
                {
                    ApplicationArea = All;
                }
                field(Skill; Rec.Skill)
                {
                    ApplicationArea = All;
                }
                field(Description; Rec.Description)
                {
                    ApplicationArea = All;
                }
                field(Level; Rec.Level)
                {
                    ApplicationArea = All;
                }
                field(Importance; Rec.Importance)
                {
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(creation)
        {
            action(NEW)
            {
                Image = New;
                Promoted = true;
                PromotedCategory = New;
                PromotedIsBig = true;
                ApplicationArea = All;
                trigger OnAction()
                begin
                    CLEAR(NewLineNoG);
                    NewLineNoG := GetLineFromSkill(Rec."Emp ID");
                    //MESSAGE('Emp %1    Line %2',"Emp ID" ,NewLineNoG);

                    PayrollJobSkillLineRecG.RESET;
                    PayrollJobSkillLineRecG.INIT;
                    PayrollJobSkillLineRecG.VALIDATE("Emp ID", Rec."Emp ID");
                    PayrollJobSkillLineRecG.VALIDATE("Line  No.", NewLineNoG);
                    PayrollJobSkillLineRecG.INSERT(true);
                    COMMIT;
                    PAGE.RUNMODAL(60190, PayrollJobSkillLineRecG);
                end;
            }
        }
    }

    var
        PayrollJobSkillLineRecG: Record "Payroll Job Skill Line";
        NewLineNoG: Integer;

    local procedure GetLineFromSkill(EmpNo_P: Code[20]): Integer
    var
        PayrollJobSkillLineRec_L: Record "Payroll Job Skill Line";
    begin
        PayrollJobSkillLineRec_L.RESET;
        PayrollJobSkillLineRec_L.SETRANGE("Emp ID", EmpNo_P);
        if not PayrollJobSkillLineRec_L.FINDLAST then
            exit(10000)
        else
            exit(PayrollJobSkillLineRec_L."Line  No." + 10000);
    end;
}

