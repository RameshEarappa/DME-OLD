page 60023 "Employee Dependent Card1"
{
    PageType = Card;
    SourceTable = "Employee Dependents Master";
    //UsageCategory = Administration;
    // ApplicationArea = All;

    layout
    {
        area(content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Employee ID"; Rec."Employee ID")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Employee Name"; Rec."Employee Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Personal Title"; Rec."Personal Title")
                {
                    ApplicationArea = All;
                    Editable = EditField;
                }
                field("Dependent First Name"; Rec."Dependent First Name")
                {
                    ApplicationArea = All;
                    Editable = EditField;
                    ShowMandatory = true;
                }
                field("Dependent Middle Name"; Rec."Dependent Middle Name")
                {
                    ApplicationArea = All;
                    Editable = EditField;
                }
                field("Dependent Last Name"; Rec."Dependent Last Name")
                {
                    ApplicationArea = All;
                    Editable = EditField;
                }
                field("Dependent Name in Arabic"; Rec."Dependent Name in Arabic")
                {
                    ApplicationArea = All;
                    Editable = EditField;
                }
                field("Name in Passport in English"; Rec."Name in Passport in English")
                {
                    Editable = EditField;
                    ApplicationArea = All;
                }
                field(Relationship; Rec.Relationship)
                {
                    ApplicationArea = All;
                    Editable = EditField;
                    ShowMandatory = true;

                    trigger OnValidate()
                    begin
                        if Rec.Relationship <> Rec.Relationship::Child then begin
                            Clear(Rec."Child with Special needs");
                            Clear(Rec."Full Time Student");
                            Clear(Rec."Child Educational Level");
                        end;
                        ChildControle;
                        CurrPage.UPDATE;
                    end;
                }
                field(Gender; Rec.Gender)
                {
                    ApplicationArea = All;
                    Editable = EditField;
                    ShowMandatory = true;
                }
                field(Nationality; Rec.Nationality)
                {
                    ApplicationArea = All;
                    Editable = EditField;
                    ShowMandatory = true;
                }
                field("Date of Birth"; Rec."Date of Birth")
                {
                    ApplicationArea = All;
                    Editable = EditField;
                    ShowMandatory = true;
                }
                field("Marital Status"; Rec."Marital Status")
                {
                    ApplicationArea = All;
                    Editable = EditField;
                }
                field("<Marital Status>"; Rec."Child with Special needs")
                {
                    ApplicationArea = All;
                    Editable = ChildBool;

                    trigger OnValidate()
                    begin
                        //Relationship = Relationship::Child
                    end;
                }
                field("Full Time Student"; Rec."Full Time Student")
                {
                    ApplicationArea = All;
                    Editable = ChildBool;
                }
                field("Child Educational Level"; Rec."Child Educational Level")
                {
                    ApplicationArea = All;
                    Editable = ChildBool;
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    // Editable = false;
                    Visible = false;
                }
                field(Religion; Rec.Religion)
                {
                    ApplicationArea = All;
                }
                field("Religion Desciption"; Rec."Religion Desciption")
                {
                    ApplicationArea = All;
                }
                field("Is Emergency Contact"; Rec."Is Emergency Contact")
                {
                    ApplicationArea = All;
                    Editable = EditField;
                }
                field("Is Nominee"; Rec."Is Nominee")
                {
                    ApplicationArea = All;
                }
            }
            part("Dependent Address"; "Dependent Address ListPart1")
            {
                SubPageLink = "Dependent ID" = FIELD("No."), "Table Type Option" = FILTER("Dependent Address Line");
                ApplicationArea = All;
            }
            part("Dependent Contacts"; "Dependent Contacts SubPage")
            {
                SubPageLink = "Dependent ID" = FIELD("No."), "Table Type Option" = FILTER("Dependent Contacts Line");
                Caption = 'Dependent Contacts';
                ApplicationArea = All;
            }
            group("Contact & Address")
            {
                Visible = false;
                field("Dependent Contact No."; Rec."Dependent Contact No.")
                {
                    ApplicationArea = All;
                    Editable = EditField;
                }
                field("Dependent Contact Type"; Rec."Dependent Contact Type")
                {
                    ApplicationArea = All;
                    Editable = EditField;
                }
                field("Primary Contact"; Rec."Primary Contact")
                {
                    ApplicationArea = All;
                    Editable = EditField;
                }
                field(Address; Rec.Address)
                {
                    ApplicationArea = All;
                    Editable = EditField;
                }
                field("Address 2"; Rec."Address 2")
                {
                    ApplicationArea = All;
                    Editable = EditField;
                }
                field(PostCode; Rec.PostCode)
                {
                    ApplicationArea = All;
                    Editable = EditField;
                }
                field(City; Rec.City)
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Country Region code"; Rec."Country Region code")
                {
                    ApplicationArea = All;
                    Editable = false;
                }
                field("Private Phone Number"; Rec."Private Phone Number")
                {
                    ApplicationArea = All;
                    Editable = EditField;
                }
                field("Direct Phone Number"; Rec."Direct Phone Number")
                {
                    ApplicationArea = All;
                    Editable = EditField;
                }
                field("Private Email"; Rec."Private Email")
                {
                    ApplicationArea = All;
                    Editable = EditField;
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

                    trigger OnAction()
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

                    trigger OnAction()
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

                    trigger OnAction()
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

                    trigger OnAction()
                    var
                        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
                    begin
                        Rec.TESTFIELD("Dependent First Name");
                        Rec.TESTFIELD(Relationship);
                        Rec.TESTFIELD(Gender);
                        Rec.TESTFIELD(Nationality);
                        Rec.TESTFIELD("Date of Birth");

                        //commented By Avinash IF ApprovalsMgmt.CheckDep_2Possible(Rec) THEN
                        //commented By Avinash   ApprovalsMgmt.OnSendDoc_2ReqForApproval(Rec);
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

                    trigger OnAction()
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
                    Enabled = ReopenBoolG;//Rec."WorkFlow Status" <> Rec."WorkFlow Status"::Open;
                    Image = ReOpen;
                    Promoted = true;
                    PromotedCategory = Process;
                    PromotedOnly = true;
                    ToolTip = 'Reopen the document to change it after it has been approved. Approved documents have the Released status and must be opened before they can be changed.';
                    Visible = false;

                    trigger OnAction()
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
                    //commented By Avinash RunObject = Page Page50031;
                    //commented By Avinash RunPageLink = Field1 = FIELD(Field1);
                    Visible = false;
                    ApplicationArea = All;
                }
            }
            group(Status1)
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

                    trigger OnAction()
                    begin
                        /*TESTFIELD(Status,Status::Active);
                        Status := Status::Inactive;
                        */

                    end;
                }
            }

            // Avinash 05.05.2020
            action("Attachment")
            {
                ApplicationArea = All;
                Image = Attachments;
                Promoted = true;
                Caption = 'Attachment';
                //PromotedCategory = Category8;
                ToolTip = 'Add a file as an attachment. You can attach images as well as documents.';
                trigger
                OnAction()
                var
                    DocumentAttachmentDetails: Page "Document Attachment Details";
                    RecRef: RecordRef;
                begin
                    RecRef.GETTABLE(Rec);
                    DocumentAttachmentDetails.OpenForRecRef(RecRef);
                    DocumentAttachmentDetails.RUNMODAL;
                end;
            }
            // Avinash 05.05.2020
            action("Dependent Identification")
            {
                Image = ContactPerson;
                ApplicationArea = All;
                Promoted = true;
                PromotedCategory = Process;
                PromotedIsBig = true;
                RunObject = Page "Dependent Identification";
                RunPageLink = "Document Type" = FILTER(Dependent),
                                  "Dependent No" = FIELD("No.");
            }

        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        SetControlVisibility;
        Edit;
        ChildControle;
    end;

    trigger OnAfterGetRecord()
    begin
        SetControlVisibility;
        Edit;
        ChildControle;
    end;

    trigger OnModifyRecord(): Boolean
    begin
        Edit;
        ChildControle;

        //CurrPage.UPDATE;
    end;

    trigger OnOpenPage()
    begin
        SetControlVisibility;
        Edit;
        ChildControle;

    end;

    trigger OnQueryClosePage(CloseAction: Action): Boolean
    begin
        EmployeeDependentsMaster.RESET;
        EmployeeDependentsMaster.SETRANGE("No.", Rec."No.");
        IF EmployeeDependentsMaster.FINDFIRST THEN BEGIN
            EmployeeDependentsMaster.TESTFIELD("Dependent First Name");
            EmployeeDependentsMaster.TESTFIELD(Gender);
            EmployeeDependentsMaster.TESTFIELD(Relationship);
            EmployeeDependentsMaster.TESTFIELD("Date of Birth");
            IF EmployeeDependentsMaster."Full Time Student" = TRUE THEN
                EmployeeDependentsMaster.TESTFIELD("Child Educational Level");
        END;

    end;

    var
        OpenApprovalEntriesExistForCurrUser: Boolean;
        OpenApprovalEntriesExist: Boolean;
        CanCancelApprovalForRecord: Boolean;
        RecEmployee: Record Employee;
        HrSetup: Record "Human Resources Setup";
        NoseriesMgt: Codeunit NoSeriesManagement;
        RecEmpIdent: Record "Identification Master";
        EditField: Boolean;
        EmployeeDependentsMaster: Record "Employee Dependents Master";
        ChildBool: Boolean;
        ReopenBoolG: Boolean;

    local procedure SetControlVisibility()
    var
        ApprovalsMgmt: Codeunit "Approvals Mgmt.";
    begin
        OpenApprovalEntriesExistForCurrUser := ApprovalsMgmt.HasOpenApprovalEntriesForCurrentUser(Rec.RECORDID);
        OpenApprovalEntriesExist := ApprovalsMgmt.HasOpenApprovalEntries(Rec.RECORDID);
        CanCancelApprovalForRecord := ApprovalsMgmt.CanCancelApprovalForRecord(Rec.RECORDID);

        ChildControle;
        Clear(ReopenBoolG);
        if Rec."WorkFlow Status" <> Rec."WorkFlow Status"::Open then
            ReopenBoolG := true
        else
            ReopenBoolG := false;
    end;

    local procedure Edit()
    begin
        // "Workflow Status" := "Workflow Status"::Released; // Back end fields
        // Status := Status::Active; // Back end fields
        EditField := TRUE;

    end;

    local procedure ChildControle()
    begin
        //ChildBool := true;
        IF Rec.Relationship = Rec.Relationship::Child THEN
            ChildBool := TRUE
        else
            ChildBool := false;
    end;
}

