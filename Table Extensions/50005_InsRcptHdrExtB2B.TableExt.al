tableextension 50005 InsRcptHdrExtB2B extends "Inspection Receipt Header B2B"
{
    fields
    {
        field(50000; "Sales. Line No"; Integer)
        {
            Caption = 'Sales. Line No';
            DataClassification = CustomerContent;
        }
    }

    var
        myInt: Integer;
}