tableextension 60009 UserSetupExt extends "User Setup"
{
    fields
    {
        // Add changes to table fields here
        field(50000; "E-signature"; BLOB)
        {
            Caption = 'E-signature';
            Description = 'ALFA';
            SubType = Bitmap;
        }
        field(50001; "Employee Id"; Code[20])
        {
            TableRelation = Employee."No.";

            trigger OnValidate()
            var
                UserSetupRecL: Record 91;
            begin
                UserSetupRecL.RESET;
                UserSetupRecL.SETRANGE("Employee Id", "Employee Id");
                IF UserSetupRecL.FINDFIRST THEN
                    ERROR(Text006, "Employee Id", UserSetupRecL."User ID");
            end;
        }
        field(50002; "HR Manager"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(50003; Finances; Boolean)
        {
            DataClassification = ToBeClassified; // @mma0786 
        }
        field(50004; "Profile ID"; Integer)
        {
            DataClassification = ToBeClassified; // @mma0786 
            TableRelation = "Page Metadata" where(PageType = filter(RoleCenter));

        }
    }

    var
        Text006: Label 'Employee %1  Already assign in User %2 .';
}
