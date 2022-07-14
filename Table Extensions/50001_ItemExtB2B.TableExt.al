tableextension 50001 ItemExtB2B extends Item
{
    fields
    {
        field(50000; "Dispatch Qc"; Boolean)
        {
            Caption = 'Dispatch Qc';
            DataClassification = CustomerContent;
        }
    }

    var
        myInt: Integer;
}