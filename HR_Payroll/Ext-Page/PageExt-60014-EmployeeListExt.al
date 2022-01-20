pageextension 60014 EmployeeListExt extends "Employee List"
{

    layout
    {
        // Add changes to page layout here
        addlast(content)
        {
            field("Earning Code Group_"; Rec."Earning Code Group")
            {
                ApplicationArea = All;
                Caption = 'Earning Code Group';
            }
            field("Increment step"; Rec."Increment step")
            {
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
        addlast(navigation)
        {
            Group(processing)
            {
                action("Earning Code Group")
                {
                    Image = PaymentJournal;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Employee Earning Code Groups";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    ApplicationArea = All;
                }
                action("Earning Code")
                {
                    Caption = 'Earning Codes';
                    Image = Production;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        EmployeeEarningCodeGroup.RESET;
                        EmployeeEarningCodeGroup.SETRANGE("Employee Code", Rec."No.");
                        EmployeeEarningCodeGroup.SETFILTER("Valid From", '<=%1', WORKDATE);
                        EmployeeEarningCodeGroup.SETFILTER("Valid To", '>%1|%2', WORKDATE, 0D);
                        IF EmployeeEarningCodeGroup.FINDFIRST THEN;
                        PayrollEarningCodeWrkr.RESET;
                        PayrollEarningCodeWrkr.FILTERGROUP(2);
                        PayrollEarningCodeWrkr.SETRANGE(Worker, Rec."No.");
                        PayrollEarningCodeWrkr.SETRANGE("Earning Code Group", EmployeeEarningCodeGroup."Earning Code Group");
                        PayrollEarningCodeWrkr.FILTERGROUP(0);
                        //PayrollEarningCodeWrkr.SETFILTER("Valid From" , '<=%1', WORKDATE);
                        //PayrollEarningCodeWrkr.SETFILTER("Valid To" , '>%1|%2', WORKDATE, 0D);
                        PAGE.RUNMODAL(60041, PayrollEarningCodeWrkr);
                    end;
                }
                action("Leave Type")
                {
                    Caption = 'Leaves';
                    Image = Holiday;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        EmployeeEarningCodeGroup.RESET;
                        EmployeeEarningCodeGroup.SETRANGE("Employee Code", Rec."No.");
                        EmployeeEarningCodeGroup.SETFILTER("Valid From", '<=%1', WORKDATE);
                        EmployeeEarningCodeGroup.SETFILTER("Valid To", '>%1|%2', WORKDATE, 0D);
                        IF EmployeeEarningCodeGroup.FINDFIRST THEN;
                        HCMLeaveTypesWrkr.RESET;
                        HCMLeaveTypesWrkr.FILTERGROUP(2);
                        HCMLeaveTypesWrkr.SETRANGE(Worker, Rec."No.");
                        HCMLeaveTypesWrkr.SETRANGE("Earning Code Group", EmployeeEarningCodeGroup."Earning Code Group");
                        HCMLeaveTypesWrkr.FILTERGROUP(0);
                        PAGE.RUNMODAL(60039, HCMLeaveTypesWrkr);

                    end;
                }
                action(Benefit)
                {
                    Caption = 'Benefits';
                    Image = CalculateLines;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        EmployeeEarningCodeGroup.RESET;
                        EmployeeEarningCodeGroup.SETRANGE("Employee Code", Rec."No.");
                        EmployeeEarningCodeGroup.SETFILTER("Valid From", '<=%1', WORKDATE);
                        EmployeeEarningCodeGroup.SETFILTER("Valid To", '>%1|%2', WORKDATE, 0D);
                        IF EmployeeEarningCodeGroup.FINDFIRST THEN;
                        HCMBenefitWrkr.RESET;
                        HCMBenefitWrkr.FILTERGROUP(2);
                        HCMBenefitWrkr.SETRANGE(Worker, Rec."No.");
                        HCMBenefitWrkr.SETRANGE("Earning Code Group", EmployeeEarningCodeGroup."Earning Code Group");
                        HCMBenefitWrkr.FILTERGROUP(0);
                        PAGE.RUNMODAL(60043, HCMBenefitWrkr);
                    end;
                }
                action(Loans)
                {
                    Image = Loaner;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    ApplicationArea = All;

                    trigger OnAction()
                    begin
                        EmployeeEarningCodeGroup.RESET;
                        EmployeeEarningCodeGroup.SETRANGE("Employee Code", Rec."No.");
                        EmployeeEarningCodeGroup.SETFILTER("Valid From", '<=%1', WORKDATE);
                        EmployeeEarningCodeGroup.SETFILTER("Valid To", '>%1|%2', WORKDATE, 0D);
                        IF EmployeeEarningCodeGroup.FINDFIRST THEN;
                        HCMLoanTableGCCWrkr.RESET;
                        HCMLoanTableGCCWrkr.FILTERGROUP(2);
                        HCMLoanTableGCCWrkr.SETRANGE(Worker, Rec."No.");
                        HCMLoanTableGCCWrkr.SETRANGE("Earning Code Group", EmployeeEarningCodeGroup."Earning Code Group");
                        HCMLoanTableGCCWrkr.FILTERGROUP(0);
                        PAGE.RUNMODAL(60045, HCMLoanTableGCCWrkr);
                    end;
                }
                action("Employee Position Assignment")
                {
                    Caption = 'Position Assignment';
                    Image = Position;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Employee Position Assignments";
                    RunPageLink = Worker = FIELD("No.");
                    ApplicationArea = All;
                }
                action("Employee Work Date")
                {
                    Caption = 'Work Calendar';
                    Image = Workdays;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedIsBig = true;
                    RunObject = Page "Employee Work Dates";
                    RunPageLink = "Employee Code" = FIELD("No.");
                    RunPageMode = View;
                    ApplicationArea = All;
                }
            }
        }
    }

    trigger OnOpenPage()
    begin
        //SetRange(Status, Status::Active);

    end;

    var
        PayrollEarningCodeWrkr: Record "Payroll Earning Code Wrkr";
        HCMLeaveTypesWrkr: Record "HCM Leave Types Wrkr";
        HCMBenefitWrkr: Record "HCM Benefit Wrkr";
        HCMLoanTableGCCWrkr: Record "HCM Loan Table GCC Wrkr";
        EmployeeEarningCodeGroup: Record "Employee Earning Code Groups";
        AssetAssigntReg: Record "Asset Assignment Register";
        Age: Decimal;
        EmplErngCodegrp: Record "Employee Earning Code Groups";
}