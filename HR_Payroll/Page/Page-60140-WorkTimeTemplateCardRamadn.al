page 60140 "Work Time Template Card Ramadn"
{
    PageType = Document;
    SourceTable = "Work Time Template - Ramadn";
    SourceTableView = SORTING("Work Time ID") ORDER(Ascending);
    // ApplicationArea = All;
    UsageCategory = Documents;
    ApplicationArea = All;
    layout
    {
        area(content)
        {
            group(General)
            {
                field("Work Time ID"; Rec."Work Time ID")
                {
                    ApplicationArea = All;
                }
                field("Template Name"; Rec."Template Name")
                {
                    ApplicationArea = All;
                }
                field("From Date"; Rec."From Date")
                {
                    ApplicationArea = All;
                }
                field("To Date"; Rec."To Date")
                {
                    ApplicationArea = All;
                }
            }
            group(Control28)
            {
                part(Sunday; "Work Time SunSubform-Ramadn1")
                {
                    Caption = 'Sunday';
                    ApplicationArea = All;
                    //commented By Avinash
                    // SubPageLink = Field1 = FIELD(Field1);
                    // SubPageView = WHERE(Field3 = FILTER(7));
                    // UpdatePropagation = Both;
                    //commented By Avinash
                }
                field("Sunday Calculation Type"; Rec."Sunday Calculation Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Sunday No. Of Hours"; Rec."Sunday No. Of Hours")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group(Control29)
            {
                //commented By Avinash
                // part(Monday; "Work Time MonSubform -Ramadn1")
                // {
                //     Caption = 'Monday';
                //     SubPageLink = Field1 = FIELD(Field1);
                //     UpdatePropagation = Both;
                // }
                //commented By Avinash
                field("Monday Calculation Type"; Rec."Monday Calculation Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Monday No. Of Hours"; Rec."Monday No. Of Hours")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group(Control30)
            {
                //commented By Avinash
                // part(Tuesday; "Work TimeTuesSubform-Ramadn1")
                // {
                //     Caption = 'Tuesday';
                //     SubPageLink = Field1 = FIELD(Field1);
                //     SubPageView = WHERE(Field3 = FILTER(2));
                //     UpdatePropagation = Both;
                // }
                //commented By Avinash
                field("Tuesday Calculation Type"; Rec."Tuesday Calculation Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Tuesday No. Of Hours"; Rec."Tuesday No. Of Hours")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group(Control31)
            {
                //commented By Avinash
                // part(Wednesday; "Work Time WedSubform-Ramadan1")
                // {
                //     Caption = 'Wednesday';
                //     SubPageLink = Field1 = FIELD(Field1);
                //     SubPageView = WHERE(Field3 = FILTER(3));
                //     UpdatePropagation = Both;
                // }
                //commented By Avinash
                field("Wednesday Calculation Type"; Rec."Wednesday Calculation Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Wednesday No. Of Hours"; Rec."Wednesday No. Of Hours")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group(Control32)
            {
                //commented By Avinash
                // part(Thursday; "Work TimeThuSubform-Ramadan1")
                // {
                //     Caption = 'Thursday';
                //     SubPageLink = Field1 = FIELD(Field1);
                //     SubPageView = WHERE(Field3 = FILTER(4));
                //     UpdatePropagation = Both;
                // }
                //commented By Avinash
                field("Thursday Calculation Type"; Rec."Thursday Calculation Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Thursday No. Of Hours"; Rec."Thursday No. Of Hours")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group(Control33)
            {
                //commented By Avinash
                // part(Friday; "Work TimeFriSubform-Ramadan1")
                // {
                //     Caption = 'Friday';
                //     SubPageLink = Field1 = FIELD(Field1);
                //     SubPageView = WHERE(Field3 = FILTER(5));
                //     UpdatePropagation = Both;
                // }
                //commented By Avinash
                field("Friday Calculation Type"; Rec."Friday Calculation Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Friday No. Of Hours"; Rec."Friday No. Of Hours")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
            group(Control34)
            {
                //commented By Avinash
                // part(Saturday; "Work Time SatSubform-Ramadn1")
                // {
                //     Caption = 'Saturday';
                //     SubPageLink = Field1 = FIELD(Field1);
                //     SubPageView = WHERE(Field3 = FILTER(6));
                //     UpdatePropagation = Both;
                // }
                //commented By Avinash
                field("Saturday Calculation Type"; Rec."Saturday Calculation Type")
                {
                    Visible = false;
                    ApplicationArea = All;
                }
                field("Saturday No. Of Hours"; Rec."Saturday No. Of Hours")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action("Update Work Calendar")
            {
                Caption = 'Update Work Calendar';
                Image = Copy;
                Promoted = true;
                PromotedCategory = Process;
                PromotedOnly = true;
                ApplicationArea = All;
                trigger OnAction()
                var
                    WorkTimeTemplate: Record "Work Time Template";
                //commented By Avinash CopyWorkTimeTemplate: Report "Copy Work Time Template";
                begin
                    //commented By Avinash
                    /*
                    CLEAR(CopyWorkTimeTemplate);
                    WorkTimeTemplate.RESET;
                    WorkTimeTemplate.SETFILTER("Work Time ID",'<>%1',"Work Time ID");
                    IF WorkTimeTemplate.FINDLAST THEN ;
                    CopyWorkTimeTemplate.SetValues(Rec."Work Time ID",WorkTimeTemplate."Work Time ID");
                    CopyWorkTimeTemplate.RUNMODAL;
                    CurrPage.UPDATE;
                    */
                    //commented By Avinash UpdateCalTime;

                end;
            }
        }
    }

    var
        WorkTimeTemplate: Record "Work Time Template";
}

