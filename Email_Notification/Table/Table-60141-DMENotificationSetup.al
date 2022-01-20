table 60141 "DME Notification Setup"
{
    //@mma0786
    DataClassification = ToBeClassified;

    fields
    {
        field(5; "Process ID"; Integer)
        {
            DataClassification = ToBeClassified;
            TableRelation = "Table Metadata";
            trigger OnValidate()
            var
                PageMetaDataRecL: Record "Table Metadata";
            begin
                Clear(PageMetaDataRecL);
                PageMetaDataRecL.Reset();
                if PageMetaDataRecL.Get("Process ID") then begin
                    "Process Name" := PageMetaDataRecL.Name;
                    "Process Caption" := PageMetaDataRecL.Caption;
                end;
            end;
        }
        field(6; "Process Name"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
        field(7; "HR Manager"; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Finances; Boolean)
        {
            DataClassification = ToBeClassified;
        }
        field(9; "Process Caption"; Text[250])
        {
            DataClassification = ToBeClassified;
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Process ID")
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