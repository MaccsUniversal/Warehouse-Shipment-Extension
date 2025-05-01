tableextension 99008 "Warehouse Shipment Header MOO" extends "Warehouse Shipment Header"
{
    fields
    {
        field(99017; "Source No."; Code[20])
        {
            DataClassification = ToBeClassified;
            Caption = 'Source No.';
        }
    }

    keys
    {
        // Add changes to keys here
    }

    fieldgroups
    {
        // Add changes to field groups here
    }
}

pageextension 99010 "Warehouse Shipment List MOO" extends "Warehouse Shipment List"
{
    layout
    {
        addafter("No.")
        {
            field("Source No."; Rec."Source No.")
            {
                Caption = 'Source No.';
                Editable = false;
                ApplicationArea = All;
            }
        }
    }

    actions
    {
        // Add changes to page actions here
    }

}

codeunit 99003 UpdateSourceNo
{
    [EventSubscriber(ObjectType::Report, Report::"Get Source Documents", 'OnAfterCreateShptHeader', '', true, true)]
    local procedure OnAfterCreateShptHeaderGetSourceNo(var WarehouseShipmentHeader: Record "Warehouse Shipment Header"; WarehouseRequest: Record "Warehouse Request")
    begin
        WarehouseShipmentHeader."Source No." := WarehouseRequest."Source No.";
    end;
}