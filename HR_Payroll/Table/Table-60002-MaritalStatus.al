table 60002 "Marital Status"
{
    LookupPageId = "Marital Status";
    fields
    {
        field(1; "Marital Status Code"; Code[20])
        {
            DataClassification = ToBeClassified;
        }
        field(2; "Marital Status Description"; Text[80])
        {
            DataClassification = ToBeClassified;
        }
    }
    keys
    {
        key(PK; "Marital Status Code")
        {
            Clustered = true;
        }
    }

    trigger
    OnDelete()
    var
        EmployeRecL: Record Employee;
    begin
        EmployeRecL.Reset();
        EmployeRecL.SetRange("Marital Status", "Marital Status Code");
        if EmployeRecL.FindFirst() then
            Error('Marital Status already attached to a position, cannot be deleted. ');

    end;

}