tableextension 50100 "BT CustomerExt" extends Customer
{
    fields
    {
        field(51000; "BT Bonuses"; Integer)
        {
            FieldClass = FlowField;
            CalcFormula = count("BT Bonus Header" where("Customer No." = field("No.")));
            Caption = 'Bonuses';
            Editable = false;
        }
    }

    trigger OnBeforeDelete()
    var
        BTBonusHeader: Record "BT Bonus Header";
    begin
        BTBonusHeader.SetRange("Customer No.", "No.");
        if BTBonusHeader.IsEmpty then
            Error(BonusExistsErr);
    end;

    var
        BonusExistsErr: Label 'You cannot delete Customer %1 because tjere is at least one Bonus assigned', Comment = '%1 = Customer No.';
}