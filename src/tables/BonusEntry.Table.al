table 50103 "BT Bonus Entry"
{
    DataClassification = CustomerContent;
    Caption = 'Bonus Entry';

    fields
    {
        field(1; "Entry No."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Entry No.';
            Editable = false;

        }

        field(2; "Bonus No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "BT Bonus Header";
            Caption = 'Bonus No.';
            Editable = false;

        }

        field(6; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "Sales Invoice Header";
            Caption = 'Document No.';
            Editable = false;

        }

        field(3; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Item;
            Caption = 'Item No.';
            Editable = false;

        }

        field(4; "Posting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Posting Date';
            Editable = false;

        }

        field(5; "Bonus Amount"; Decimal)
        {
            DataClassification = CustomerContent;
            Caption = 'Bonus Amount';
            Editable = false;

        }

    }

    keys
    {
        key(PK; "Entry No.")
        {
            Clustered = true;
        }
    }

}