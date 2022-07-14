pageextension 50001 SalesOrderSubfromExtB2B extends "Sales Order Subform"
{
    layout
    {
        addafter("Shipment Date")
        {
            field("Spec ID"; Rec."Spec ID")
            {
                ToolTip = 'Specifies the value of the Spec ID field.';
                ApplicationArea = All;
            }
            field("Qty. Sending To Quality"; Rec."Qty. Sending To Quality")
            {
                ToolTip = 'Specifies the value of the Qty. Sending To Quality field.';
                ApplicationArea = All;
            }
            field("Quantity Accepted"; Rec."Quantity Accepted")
            {
                ToolTip = 'Specifies the value of the Quantity Accepted field.';
                ApplicationArea = All;
            }
            field("Quantity Rework"; Rec."Quantity Rework")
            {
                ToolTip = 'Specifies the value of the Quantity Rework field.';
                ApplicationArea = All;
            }
            field("Quantity Rejected"; Rec."Quantity Rejected")
            {
                ToolTip = 'Specifies the value of the Quantity Rejected field.';
                ApplicationArea = All;
            }
            field("Qty. Sent To Quality"; Rec."Qty. Sent To Quality")
            {
                ToolTip = 'Specifies the value of the Qty. Sent To Quality field.';
                ApplicationArea = All;
            }

        }
    }

    actions
    {
        addafter("&Line")
        {
            group("I&nspectionB2B")
            {
                Caption = 'Inspection';
                action("Inspection Data Sheets B2B")
                {
                    Caption = '&Inspection Data Sheets';
                    ToolTip = 'the Quality department carry out the quality activities by using the IDS';
                    ApplicationArea = all;
                    Image = Insert;
                    trigger OnAction();
                    begin
                        Rec.ShowDataSheets;
                    end;
                }
                action("Posted Inspection Data Sheets B2B")
                {
                    Caption = '&Posted Inspection Data Sheets';
                    ToolTip = 'posted inspection data sheet  used for reporting and vendor analysis';
                    Image = Indent;
                    ApplicationArea = All;
                    trigger OnAction()
                    begin
                        Rec.ShowPostDataSheets;
                    end;

                }
                action("Inspection Receipt B2B")
                {
                    Caption = 'Inspection &Receipt';
                    ToolTip = 'Inspection receipt through which the user actually accepts, rejects or sends for rework';
                    Image = Receipt;
                    ApplicationArea = All;
                    trigger OnAction()
                    begin
                        Rec.ShowInspectReceipt;
                    end;

                }
                action("Posted Inspection Receipt B2B")
                {
                    Caption = 'Posted I&nspection Receipt';
                    tooltip = 'Posted Inspection Receipts used for reporting and vendor analysis';
                    Image = PostedReceipt;
                    ApplicationArea = All;
                    trigger OnAction()
                    begin
                        Rec.ShowPostInspectReceipt;
                    end;
                }

            }

        }
    }
    procedure CreateInspecDataSheets();
    Begin
        IF Rec.Quantity >= (Rec."Qty. Sending to Quality" + Rec."Qty. Sent to Quality") THEN
            Rec.CreateInspectionDataSheets()
        ELSE
            ERROR(Text50001Err);
    End;

    var
        Text50001Err: label 'Inspection datasheets already created.';
}