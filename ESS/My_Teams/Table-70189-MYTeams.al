table 70189 "MY Teams List"
{
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entry No"; Integer)
        {
            DataClassification = ToBeClassified;
            AutoIncrement = true;
            Editable = false;
        }
        field(2; "Login Employee No."; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
            Editable = false;
        }
        field(11; "Login Employee Position"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Payroll Job Pos. Worker Assign";
            Editable = false;
        }
        field(12; "Reporting's Employee ID"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = Employee;
            Editable = false;
            trigger OnValidate()
            var
                EmployeeRecL: Record Employee;
            begin
                EmployeeRecL.Reset();
                EmployeeRecL.SetRange("No.", "Reporting's Employee ID");
                if EmployeeRecL.FindFirst() then begin
                    "Reporting's Employee Name" := EmployeeRecL.FullName();

                end;
            end;

        }
        field(13; "Reporting's Employee Name"; Code[150])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(14; "Reporting's Position ID"; Code[150])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }


    }

    keys
    {
        key(PK; "Entry No", "Login Employee No.")
        {
            Clustered = true;
        }
    }

    var
        myInt: Integer;

    trigger OnInsert()
    begin

    end;

    trigger OnModify()
    begin

    end;

    trigger OnDelete()
    begin

    end;

    trigger OnRename()
    begin

    end;

}