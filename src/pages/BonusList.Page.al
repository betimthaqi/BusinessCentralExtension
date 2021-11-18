page 50101 "BT Bonus List"
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Lists;
    Caption = 'Bonus List';
    SourceTable = "BT Bonus Header";
    Editable = false;
    CardPageId = "BT Bonus Card";

    layout
    {
        area(Content)
        {
            repeater(Control1)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bonus number.';

                }
                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the customer number.';

                }

                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the starting date.';

                }

                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the ending date';

                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bonus status';

                }

            }
        }
    }

    actions
    {
        area(Navigation)
        {
            action(CustomerCard)
            {
                ApplicationArea = All;
                Caption = 'Customer Card';
                Image = Customer;
                Promoted = True;
                PromotedCategory = Process;
                RunObject = page "Customer Card";
                RunPageLink = "No." = field("Customer No.");
                ToolTip = 'Opens customer Card';

            }

            action(BonusEntries)
            {
                ApplicationArea = All;
                Image = Entry;
                Promoted = true;
                PromotedCategory = Process;
                RunObject = page "BT Bonus Entries";
                RunPageLink = "Bonus No." = field("No.");
                Caption = 'Bonus Entries';
                ToolTip = 'Opens bonus entries.';

            }
        }
    }
}