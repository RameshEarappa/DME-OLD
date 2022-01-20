codeunit 60000 Email_Confirmation
{
    TableNo = "Email Notification Entries";

    trigger OnRun();
    var
        FromName: Text;
        FromAddress: Text;
        Body: Text;

    begin
        Clear(Body);
        ClearRecipients();


        Clear(FromName);
        FromName := GetFromName(Rec.ReceiverUserID);

        Clear(FromAddress);
        FromAddress := GetFromAddress(Rec.ReceiverUserID);
        AddRecipients(FromAddress);

        SendNotification(Rec.HeaderTxt,
                         Rec.BodyTxt,
                         Rec.FooterTxt,
                         FromName,
                         FromAddress,
                         Recipients,
                         Rec.Subject,
                         Body,
                         Rec.HtmlFormatted)
    end;

    var

        SMTPSetup: Record "SMTP Mail Setup";
        SMTP: Codeunit "SMTP Mail";
        Recipients: List of [Text];

    procedure SendNotification(HeaderTxt: text; BodyTxt: Text; FooterTxt: Text; FromName: Text; FromAddress: Text; Recipients: List of [Text]; Subject: Text; Body: Text; HtmlFormatted: Boolean)
    begin

        SMTPSetup.RESET;
        SMTPSetup.GET;

        SMTP.CreateMessage(FromName, FromAddress, Recipients, Subject, Body, HtmlFormatted);

        SMTP.AppendBody(HeaderTxt);
        SMTP.AppendBody('<br><br>');

        SMTP.AppendBody(BodyTxt);
        SMTP.AppendBody('<br><br>');


        SMTP.AppendBody('<br>');
        SMTP.AppendBody(FooterTxt);

        SMTP.Send;



    END;

    procedure AddRecipients(RecipientsVal: Text)
    begin
        Recipients.add(RecipientsVal);
    end;

    procedure ClearRecipients()
    begin
        clear(Recipients);
    end;

    procedure GetFromName(UserID: Text): Text
    var
        UserSetupRecL: Record "User Setup";
        EmployeeRecL: Record Employee;
    begin
        clear(UserSetupRecL);
        if UserSetupRecL.Get(UserID) then begin
            Clear(EmployeeRecL);
            if EmployeeRecL.get(UserSetupRecL."Employee Id") then
                exit(EmployeeRecL.FullName());
        end;
    end;


    procedure GetFromAddress(UserID: Text): Text
    var
        UserSetupRecL: Record "User Setup";

    begin
        clear(UserSetupRecL);
        if UserSetupRecL.Get(UserID) then begin
            exit(UserSetupRecL."E-Mail");
        end;
    end;
}

