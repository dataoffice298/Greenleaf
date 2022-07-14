tableextension 50002 QualityLedgerEntryExtB2B extends "Quality Ledger Entry B2B"
{
    fields
    {
        field(50000; "Sales Line No"; Integer)
        {
            Caption = 'Sales Line No';
            DataClassification = CustomerContent;
        }
    }

    var
        myInt: Integer;
}