table 50100 "BT Bonus Header"
{
    DataClassification = CustomerContent;
    Caption = 'Bonus Header';
    DrillDownPageId = "BT Bonus List";
    LookupPageId = "BT Bonus List";

    fields
    {
        field(1; "No."; Code[20])
        {
            DataClassification = CustomerContent;
            Caption = 'No.';

            trigger OnValidate()
            begin
                if "No." <> xRec."No." then begin
                    BTBonusSetup.Get();
                    NoSeriesManagement.TestManual(BTBonusSetup."Bonus Nos.");
                    "No. Series" := '';
                end;
            end;

        }

        field(2; "Customer No."; Code[20])
        {
            DataClassification = CustomerContent;
            TableRelation = Customer;
            Caption = 'Customer No';
            trigger OnValidate()
            var
            begin
                TestStatusOpen();
            end;
        }

        field(3; "Starting Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Starting Date';
            trigger OnValidate()
            var
            begin
                TestStatusOpen();
            end;
        }

        field(4; "Ending Date"; Date)
        {
            DataClassification = CustomerContent;
            Caption = 'Ending Date';
            trigger OnValidate()
            var
            begin
                TestStatusOpen();
            end;
        }

        field(5; "Status"; Enum "BT Bonus Status")
        {
            DataClassification = CustomerContent;
            Caption = 'Status';
        }

        field(6; "No. Series"; Code[20])
        {
            Caption = 'No. Series';
            Editable = false;
            TableRelation = "No. Series";
            trigger OnValidate()
            var
            begin
                TestStatusOpen();
            end;
        }

        field(7; "Customer Name"; Text[100])
        {
            Caption = 'Customer Name';
            FieldClass = FlowField;
            Editable = false;
            CalcFormula = lookup(Customer.Name where("No." = field("Customer No.")));
            trigger OnValidate()
            var
            begin
                TestStatusOpen();
                CalcFields("Customer Name");
            end;
        }
        field(8; "Bonus Amount"; Decimal)
        {
            FieldClass = FlowField;
            Editable = false;
            Caption = 'Bonus Amount';
            CalcFormula = sum("BT Bonus Entry"."Bonus Amount" where("Bonus No." = field("No.")));

        }
    }

    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    var
        BTBonusSetup: Record "BT Bonus Setup";
        NoSeriesManagement: Codeunit NoSeriesManagement;

    trigger OnInsert()
    begin
        if "No." = '' then begin
            BTBonusSetup.Get();
            BTBonusSetup.TestField("Bonus Nos.");
            NoSeriesManagement.InitSeries(BTBonusSetup."Bonus Nos.", BTBonusSetup."Bonus Nos.", WorkDate(), "No.", BTBonusSetup."Bonus Nos.");

        end;
    end;


    procedure TestStatusOpen()
    begin
        TestField(Status, Status::Open); // method for testing
    end;

}