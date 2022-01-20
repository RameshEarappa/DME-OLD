report 61500 "Employee Termination Revert"
{
    // version LT_Payroll

    ProcessingOnly = true;

    requestpage
    {

        layout
        {
            area(content)
            {
                group(Options)
                {
                    field(Worker; Worker)
                    {
                        ApplicationArea = all;
                        Editable = false;

                    }
                }
            }
        }

        actions
        {
        }

        trigger OnOpenPage();
        begin
        end;

        trigger OnQueryClosePage(CloseAction: Action): Boolean;
        begin
            if CloseAction in [ACTION::OK, ACTION::LookupOK] then begin
            end;

        end;
    }

    labels
    {
    }

    trigger OnPostReport();
    begin
        RecEmployee.RESET;
        RecEmployee.SETRANGE("No.", EmpCode);
        if RecEmployee.FINDFIRST then begin
            LeaveTypes.RESET;
            LeaveTypes.SETRANGE(LeaveTypes."Is System Defined", true);
            LeaveTypes.FINDFIRST;

            EmployeeWorkDateRec.RESET;
            EmployeeWorkDateRec.SETRANGE("Employee Code", RecEmployee."No.");
            EmployeeWorkDateRec.SETRANGE("Trans Date", RecEmployee."Termination Date", 99991231D);
            if EmployeeWorkDateRec.FINDFIRST then
                repeat
                    EmployeeWorkDateRec."First Half Leave Type" := LeaveTypes."Leave Type Id";
                    EmployeeWorkDateRec."Second Half Leave Type" := LeaveTypes."Leave Type Id";
                    EmployeeWorkDateRec.MODIFY;
                until EmployeeWorkDateRec.NEXT = 0;
            RecEmployee."Seperation Reason" := '';
            RecEmployee."Seperation Reason Code" := 0;
            RecEmployee."Employment End Date" := 0D;
            RecEmployee."Termination Date" := 0D;
            RecEmployee."Unsatisfactory Grade" := 0;
            RecEmployee."Hold Payment from Date" := 0D;
            RecEmployee."Revoke Termination Date" := WorkDate();
            RecEmployee.Status := RecEmployee.Status::Active;
            RecEmployee.MODIFY;
        end;
    end;

    trigger OnPreReport();
    var
    begin
    end;

    var
        EmpCode: Code[20];
        RecEmployee: Record Employee;
        Worker: Code[20];
        LeaveTypes: Record "HCM Leave Types";
        EmployeeWorkDateRec: Record EmployeeWorkDate_GCC;

    procedure SetValues(l_EmpCode: Code[20]);
    begin
        EmpCode := l_EmpCode;
        Worker := l_EmpCode;
        RecEmployee.GET(l_EmpCode);
    end;
}

