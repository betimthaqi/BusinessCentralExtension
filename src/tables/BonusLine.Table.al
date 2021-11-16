table 63702 "BT Bonus Line"
{
    DataClassification = CustomerContent;
    Caption = 'BT Bonus Line';

    fields
    {
        field(1; "Document No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = "BT Bonus Header";
            Caption = 'Document No.';

        }

        field(2; "Type"; Enum "BT Bonus Type")
        {
            DataClassification = CustomerContent;
            Caption = 'Type';
        }

        field(3; "Item No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'Item No.';
            TableRelation = if (Type = filter(Item)) Item;
        }

        field(4; "Bonus Perc."; Integer)
        {
            DataClassification = CustomerContent;
            Caption = 'Bonus Perc';
            MinValue = 0;
            MaxValue = 100;
        }
    }

    keys
    {
        key(PK; "Document No.", "Item No.")
        {
            Clustered = true;
        }
    }


}