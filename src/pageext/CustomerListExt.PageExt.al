pageextension 50100 "BT Customer List Ext" extends "Customer List"
{
    layout
    {
        addlast(Control1)
        {

            field("BT Bonuses"; Rec."BT Bonuses")
            {
                ApplicationArea = All;
                ToolTip = 'Shows number of assgined bonuses to customer.';
            }
        }
    }

    actions
    {
        addlast(Documents)
        {
            action(BTBonuses)
            {
                Caption = 'Bonuses';
                ApplicationArea = All;
                Image = Discount;
                RunObject = page "BT Bonus List";
                RunPageLink = "Customer No." = field("No.");
                ToolTip = 'This will display bonuses';
            }

        }
    }
}