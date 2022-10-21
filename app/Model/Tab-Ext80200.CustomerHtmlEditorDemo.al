/// <summary>
/// TableExtension Customer HtmlEditor Demo (ID 80200) extends Record Customer.
/// </summary>
tableextension 80200 "Customer HtmlEditor Demo" extends Customer
{
    fields
    {
        field(50000; "Custom HtmlEditor Field"; Blob)
        {
            Caption = 'Custom HtmlEditor Field';
            DataClassification = ToBeClassified;
        }
    }
}
