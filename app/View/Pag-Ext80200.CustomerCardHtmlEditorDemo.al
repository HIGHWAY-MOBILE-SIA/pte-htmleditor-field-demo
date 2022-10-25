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
        }
    }

    trigger OnAfterGetCurrRecord()
    begin
        CurrPage.HtmlEditorCardPart.Page.SetSource(Database::Customer, 50000, Rec.RecordId, Rec.SystemId);
        CurrPage.HtmlEditorCardPart2.Page.SetSource(Database::Customer, 50001, Rec.RecordId, Rec.SystemId);
    end;
}
