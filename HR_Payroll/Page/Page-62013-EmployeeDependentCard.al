page 62013 "Employee Dependent Card"
{
    // version PHASE -2

    PageType = Card;
    SourceTable = "Employee Dependents Master";

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Employee ID"; Rec."Employee ID")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Personal Title"; Rec."Personal Title")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field("Dependent First Name"; Rec."Dependent First Name")
                {
                    Editable = EditField;
                    ShowMandatory = true;
                    ApplicationArea = All;
                }
                field("Dependent Middle Name"; Rec."Dependent Middle Name")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field("Dependent Last Name"; Rec."Dependent Last Name")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field("Dependent Name in Arabic"; Rec."Dependent Name in Arabic")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field("Name in Passport in English"; Rec."Name in Passport in English")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field(Relationship; Rec.Relationship)
                {
                    Editable = EditField;
                    ShowMandatory = true;
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        ChildControle;
                        CurrPage.UPDATE;
                    end;
                }
                field(Gender; Rec.Gender)
                {
                    Editable = EditField;
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field(Nationality; Rec.Nationality)
                {
                    Editable = EditField;
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                // // // // field("Nationality in Arabic"; "Nationality in Arabic")
                // // // // {
                // // // // }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                    ShowMandatory = true;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field("<Marital Status>"; Rec."Child with Special needs")
                {
                    Editable = ChildBool;
                    ApplicationArea = All;

                    trigger OnValidate();
                    begin
                        //Relationship = Relationship::Child
                    end;
                }
                field("Full Time Student"; Rec."Full Time Student")
                {
                    Editable = ChildBool;
                    ApplicationArea = All;
                }
                field("Child Educational Level"; Rec."Child Educational Level")
                {
                    Editable = ChildBool;
                    ApplicationArea = All;
                }
                field("Is Emergency Contact"; Rec."Is Emergency Contact")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                // // // field(Status; Status)
                // // // {
                // // //     Editable = false;
                // // //     Visible = false;
                // // // }
                field("Workflow Status"; Rec."Workflow Status")
                {
                    Editable = false;
                    ApplicationArea = All;
                    Visible = false;
                }
            }
            part("Dependent Address"; "Dependent Address ListPart1")
            {
                ApplicationArea = All;
                // // // SubPageLink = Field14 = FIELD(Field1),
                // // //               Field12 = FILTER(3);
            }
            part("Dependent Contacts"; "Dependent Contacts SubPage")
            {
                ApplicationArea = All;
                // // SubPageLink = Field11 = FIELD(Field1),
                // //               Field8 = FILTER(3);
            }
            group("Contact & Address")
            {
                Visible = false;
                field("Dependent Contact No."; Rec."Dependent Contact No.")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field("Dependent Contact Type"; Rec."Dependent Contact Type")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field("Primary Contact"; Rec."Primary Contact")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field(Address; Rec.Address)
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field("Address 2"; Rec."Address 2")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field(PostCode; Rec.PostCode)
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field(City; Rec.City)
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Country Region code"; Rec."Country Region code")
                {
                    Editable = false;
                    ApplicationArea = All;
                }
                field("Private Phone Number"; Rec."Private Phone Number")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field("Direct Phone Number"; Rec."Direct Phone Number")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field("Private Email"; Rec."Private Email")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            group(Approval)
            {
                Caption = 'Approval';
                action(Approve)
                {
                    ApplicationArea = All;
                    Caption = 'Approve';
                    Image = Approve;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Approve the requested changes.';
                    Visible = false;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.ApproveRecordApprovalRequest(Rec.RECORDID);
                    end;
                }
                action(Reject)
                {
                    ApplicationArea = All;
                    Caption = 'Reject';
                    Enabled = OpenApprovalEntriesExistForCurrUser;
                    Image = Reject;
                    Promoted = true;
                    PromotedCategory = Category4;
                    PromotedIsBig = true;
                    ToolTip = 'Reject the approval request.';
                    Visible = false;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.RejectRecordApprovalRequest(Rec.RECORDID);
                    end;
                }
                action(Delegate)
                {
                    ApplicationArea = All;
                    Caption = 'Delegate';
                    Enabled = OpenApprovalEntriesExistForCurrUser;
                    Image = Delegate;
                    Promoted = true;
                    PromotedCategory = Category4;
                    ToolTip = 'Delegate the approval to a substitute approver.';
                    Visible = false;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        ApprovalsMgmt.DelegateRecordApprovalRequest(Rec.RECORDID);
                    end;
                }
            }
            group("Request Approval")
            {
                Caption = 'Request Approval';
                Image = SendApprovalRequest;
                Visible = false;
                action(SendApprovalRequest)
                {
                    ApplicationArea = Suite;
                    Caption = 'Send A&pproval Request';
                    Enabled = NOT OpenApprovalEntriesExist;
                    Image = SendApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedOnly = true;
                    ToolTip = 'Send an approval request.';
                    Visible = false;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TESTFIELD("Dependent First Name");
                        Rec.TESTFIELD(Relationship);
                        Rec.TESTFIELD(Gender);
                        Rec.TESTFIELD(Nationality);
                        Rec.TESTFIELD("Date of Birth");

                        // // // if ApprovalsMgmt.CheckDep_2Possible(Rec) then
                        // // //     ApprovalsMgmt.OnSendDoc_2ReqForApproval(Rec);
                    end;
                }
                action(CancelApprovalRequest)
                {
                    ApplicationArea = Suite;
                    Caption = 'Cancel Approval Re&quest';
                    Enabled = CanCancelApprovalForRecord;
                    Image = CancelApprovalRequest;
                    Promoted = true;
                    PromotedCategory = Category9;
                    PromotedOnly = true;
                    ToolTip = 'Cancel the approval request.';
                    Visible = false;

                    trigger OnAction();
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        //ApprovalsMgmt.IsDep_2WorkflowEnabled(Rec);
                    end;
                }
                action(Reopen)
                {
                    ApplicationArea = Basic, Suite;
                    Caption = 'Re&open';
                    Enabled = Rec."WorkFlow Status" <> Rec."WorkFlow Status"::Open;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed.';
                    Visible = false;

                    trigger OnAction();
                    var
                        ReleaseSalesDoc: Codeunit "Release Sales Document";
                    begin
                        /*IF "Workflow Status" = "Workflow Status"::"Pending Approval" THEN
                          ERROR('WorkFlow status should be Approved for reopen');
                        
                        "Workflow Status" := "Workflow Status"::Open;
                        */

                    end;
                }
                action("Modified List")
                {
                    Image = OpenWorksheet;
                    // // // RunObject = Page Page50031;
                    // // // RunPageLink = Field1 = FIELD(Field1);
                    Visible = false;
                    ApplicationArea = All;
                }
            }
            group(Status)
            {
                Caption = 'Status';
                Image = SendApprovalRequest;
                action("Inactive ")
                {
                    Caption = 'Make Inactive';
                    Image = ServiceMan;
                    Promoted = true;
                    PromotedCategory = Category10;
                    Visible = false;
                    ApplicationArea = All;

                    trigger OnAction();
                    begin
                        /*TESTFIELD(Status,Status::Active);
                        Status := Status::Inactive;
                        */

                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord();
    begin
        SetControlVisibility;
        Edit;
        ChildControle;
    end;

    trigger OnAfterGetRecord();
    begin
        SetControlVisibility;
        Edit;
        ChildControle;
    end;

    trigger OnModifyRecord(): Boolean;
    begin
        Edit;
        //CurrPage.UPDATE;
    end;

    trigger OnOpenPage();
    begin
        SetControlVisibility;
        Edit;
        ChildControle;
    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean;
    begin
        EmployeeDependentsMaster.RESET;
        EmployeeDependentsMaster.SETRANGE("No.", Rec."No.");
        if EmployeeDependentsMaster.FINDFIRST then begin
            EmployeeDependentsMaster.TESTFIELD("Dependent First Name");
            EmployeeDependentsMaster.TESTFIELD(Gender);
            EmployeeDependentsMaster.TESTFIELD(Relationship);
            EmployeeDependentsMaster.TESTFIELD("Date of Birth");
            if EmployeeDependentsMaster."Full Time Student" = true then
                EmployeeDependentsMaster.TESTFIELD("Child Educational Level");
        end;
    end;

    var
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CanCancelApprovalForRecord: Boolean;
        RecEmployee: Record Employee;
        HrSetup: Record "Human Resources Setup";
        NoseriesMgt: Codeunit NoSeriesManagement;
        RecEmpIdent: Record "Identification Master";
        [InDataSet]
        EditField: Boolean;
        EmployeeDependentsMaster: Record "Employee Dependents Master";
        [InDataSet]
        ChildBool: Boolean;

    local procedure SetControlVisibility();
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        /*OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(RECORDID);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(RECORDID);
        */

    end;

    local procedure Edit();
    begin
        /*IF "Workflow Status" <> "Workflow Status"::Open THEN
          EditField := FALSE
        ELSE*/
        ////////"Workflow Status" := "Workflow Status"::Open;// Back end fields
        ////////////Status := Status:::Active; // Back end fields
        EditField := true;

    end;

    local procedure ChildControle();
    begin
        ChildBool := false;
        // // // // if Relationship = Relationship::"1" then
        // // // //     ChildBool := true;
    end;
}

