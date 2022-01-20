page 70186 "HR Announcements View"
{
    Caption = 'HR Announcements view';
    PageType = Card;
    SourceTable = "HR Announcements";
    Editable = false;
    DataCaptionFields = "Annountment Header";
    MultipleNewLines = false;

    layout
    {
        area(Content)
        {
            // group("General")
            // {
            //     ShowCaption = false;
            //     // grid(ColGrid)
            //     // {
            //     //     GridLayout = Columns;
            //     //     ShowCaption = false;

            //     //     group(p4)
            //     //     {
            //     //         ShowCaption = false;
            //     //         field("Effective Date"; Rec."Effective Date")
            //     //         {
            //     //             ApplicationArea = All;
            //     //             Editable = false;
            //     //         }

            //     //     }
            //     //     group(p2)
            //     //     {
            //     //         ShowCaption = false;
            //     //         field("Expiry Date"; Rec."Expiry Date")
            //     //         {
            //     //             ApplicationArea = All;
            //     //             Editable = false;
            //     //         }
            //     //     }

            //     // }

            // }
            // group(P5)
            // {
            //     ShowCaption = false;
            //     group(p1)
            //     {
            //         Caption = 'Annountment Header';
            //         field("Annountment Header"; Rec."Annountment Header")
            //         {
            //             ApplicationArea = All;
            //             ShowCaption = false;
            //             Editable = false;
            //         }

            //     }
            // }
            group(p3)
            {
                ShowCaption = false;
                group(ContentsArea)
                {
                    Caption = 'Announcements Content';
                    field("Announcements Content"; AnnouncementsContentTxtG)
                    {
                        ApplicationArea = All;
                        ShowCaption = false;
                        MultiLine = true;
                        ColumnSpan = 95;
                        RowSpan = 210;
                        Width = 210;
                        Editable = false;

                        trigger OnValidate()
                        begin
                            Rec.SetAnnouncementsContent(Rec, AnnouncementsContentTxtG);
                        end;
                    }
                }
            }
        }
    }

    trigger OnAfterGetRecord()
    begin
        AnnouncementsContentTxtG := Rec.GetAnnouncementsContent(Rec);
    end;

    trigger OnOpenPage()
    begin
        AnnouncementsContentTxtG := Rec.GetAnnouncementsContent(Rec);
    end;

    var
        AnnouncementsContentTxtG: Text;




}