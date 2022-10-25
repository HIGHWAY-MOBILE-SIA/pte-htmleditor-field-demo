/// <summary>
/// PageExtension Customer Card HtmlEditor Demo (ID 80200) extends Record Customer Card.
/// </summary>
pageextension 80200 "Customer Card HtmlEditor Demo" extends "Customer Card"
{
    layout
    {
        addafter(General)
        {
            group("HtmlEditorDemo")
            {
                Caption = 'Vengo Html Editor Demo';
                part(HtmlEditorCardPart; "Vengo HtmlEditor CkEditor Part")
                {
                    Caption = ' ';
                    ApplicationArea = All;
                    UpdatePropagation = SubPart;

                    SubPageLink =
                        "Source Table No." = const(Database::Customer),
                        "Source Field No." = const(50000),
                        "Source System Id" = field(SystemId);
                    SubPageView = sorting("Source Table No.", "Source Field No.", "Source System Id");
                }
                part(HtmlEditorCardPart2; "Vengo HtmlEditor ToastUI Part")
                {
                    Caption = ' ';
                    ApplicationArea = All;
                    UpdatePropagation = SubPart;

                    SubPageLink =
                        "Source Table No." = const(Database::Customer),
                        "Source Field No." = const(50001),
                        "Source System Id" = field(SystemId);
                    SubPageView = sorting("Source Table No.", "Source Field No.", "Source System Id");
                }
            }
            group("HtmlEditor DemoUser Control")
            {
                usercontrol(CustomHtmlEditor3; "Vengo HtmlEditor Field CkEditor")
                {
                    ApplicationArea = All;

                    trigger ContentChanged()
                    begin
                        CurrPage.CustomHtmlEditor3.RequestSave();
                    end;

                    trigger SaveRequested(data: Text)
                    var
                        oStream: OutStream;
                    begin
                        Clear(Rec."Custom HtmlEditor Field 3");
                        Rec."Custom HtmlEditor Field 3".CreateOutStream(oStream, TextEncoding::UTF8);
                        oStream.WriteText(data);
                    end;

                    trigger OnBeforeSetReadOnly()
                    begin
                        CurrPage.CustomHtmlEditor3.SetReadOnly(GlobalReadOnly);
                    end;
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.HtmlEditorCardPart.Page.SetSource(Database::Customer, 50000, Rec.RecordId, Rec.SystemId);
        CurrPage.HtmlEditorCardPart.Page.SetReadOnly(GlobalReadOnly);
        CurrPage.HtmlEditorCardPart2.Page.SetSource(Database::Customer, 50001, Rec.RecordId, Rec.SystemId);
        CurrPage.HtmlEditorCardPart2.Page.SetReadOnly(GlobalReadOnly);
        CustomHtmlEditor3Init();
        SetReadOnly(true);
    end;

    var
        GlobalReadOnly: Boolean;
    /// <summary>
    /// SetReadOnly.
    /// </summary>
    /// <param name="NewReadOnly">Boolean.</param>
    procedure SetReadOnly(NewReadOnly: Boolean)
    begin
        GlobalReadOnly := NewReadOnly;
    end;

    local procedure CustomHtmlEditor3Init()
    var
        iStream: InStream;
        Data: Text;
    begin
        CurrPage.CustomHtmlEditor3.Init();
        Rec.CalcFields("Custom HtmlEditor Field 3");
        if Rec."Custom HtmlEditor Field 3".Length > 0 then begin
            Rec."Custom HtmlEditor Field 3".CreateInStream(iStream, TextEncoding::UTF8);
            iStream.ReadText(Data);
        end;
        CurrPage.CustomHtmlEditor3.Load(Data);
    end;
}
