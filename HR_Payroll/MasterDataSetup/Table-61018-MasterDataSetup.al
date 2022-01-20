table 61018 "Master Data Setup"
{
    // version #Visa&IqamaProcess

    DataPerCompany = false;

    fields
    {
        field(1; "Page ID"; Integer)
        {
            TableRelation = "Page Metadata";

            trigger OnValidate();
            begin
                PageMetadataRec_G.RESET;
                if PageMetadataRec_G.GET("Page ID") then
                    "Page Name" := PageMetadataRec_G.Name;
            end;
        }
        field(2; "Page Name"; Text[50])
        {
            Editable = false;
            TableRelation = "Page Metadata".Name WHERE(ID = FIELD("Page ID"));
        }
        field(3; "Process Identification Master"; Code[20])
        {
            TableRelation = "Identification Doc Type Master";
        }
        field(4; "Sequence No."; Integer)
        {
        }
    }

    keys
    {
        key(Key1; "Page ID", "Sequence No.")
        {
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete();
    begin
        ERROR('you cannot Delete, please contact to Admin for Delete.');
    end;

    trigger OnModify();
    begin
        //ERROR('you cannot modify, please contact to Admin for modification.');
    end;

    var
        PageMetadataRec_G: Record "Page Metadata";
}

