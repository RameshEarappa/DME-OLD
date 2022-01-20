codeunit 60001 "Send Email To HR & Employee"
{

    trigger OnRun()
    begin

    end;

    var

        SMTPMail: Codeunit "SMTP Mail";
        UserSetupRec_G: Record "User Setup";
        EmpployeeDepenIdentRecL: Record "Identification Master";

    procedure Employee_Document_request_Card_Notify(DocumentReqRecP: Record "Document Request");
    var
        RecipientsEmailList: List of [Text];
        UserSetupListOfHrRecG: Record "User Setup";
        UserSetupListOfHrRec2G: Record "User Setup";
        RemainingDate: Integer;
        IdenTypeRecL: Record "Identification Doc Type Master";
        EmployeeRecL: Record Employee;

    begin
        // Message('%1', DocumentReqRecP."Employee ID");

        UserSetupListOfHrRecG.Reset();
        UserSetupListOfHrRecG.SetRange("Employee Id", DocumentReqRecP."Employee ID");
        if UserSetupListOfHrRecG.FindFirst() then
            UserSetupListOfHrRecG.TestField("E-Mail");
        RecipientsEmailList.Add(UserSetupListOfHrRecG."E-Mail");

        EmployeeRecL.Reset();
        if EmployeeRecL.Get(DocumentReqRecP."Employee ID") then;
        //if EmployeeRecL.FindFirst() then;


        // **********************************************
        SMTPMail.CreateMessage(UserSetupListOfHrRecG."User ID",
                           UserSetupListOfHrRecG."E-Mail",
                           RecipientsEmailList,
                           'Document ' + Format(DocumentReqRecP."Document format ID") + ' is ready for Collection.',
                           '',
                           true);
        SMTPMail.AppendBody('Dear ' + EmployeeRecL.FullName() + ', <BR><BR>');
        SMTPMail.AppendBody('The requested document  <B>' + Format(DocumentReqRecP."Document format ID") + '</B> is ready for collection from HR.');
        SMTPMail.AppendBody('<BR><BR>');
        SMTPMail.AppendBody('Regards,<BR> HR Team.<BR><BR>');
        if SMTPMail.Send then;
        // Message('Send');
        //***********************************************

    end;




}

