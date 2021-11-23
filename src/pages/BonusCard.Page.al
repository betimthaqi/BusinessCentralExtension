page 50102 "BT Bonus Card"
{
    PageType = Document;
    ApplicationArea = All;
    UsageCategory = Administration;
    Caption = 'Bonus Card';
    SourceTable = "BT Bonus Header";

    layout
    {
        area(Content)
        {
            group(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the bonus number.';

                }

                field("Customer No."; Rec."Customer No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus customer number';
                }

                field("Customer Name"; Rec."Customer Name")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus customer name';
                }

                field("Starting Date"; Rec."Starting Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus starting date.';
                }

                field("Ending Date"; Rec."Ending Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus ending date.';
                }

                field(Status; Rec.Status)
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies bonus status';
                }


            }

            part(Lines; "BT Bonus Subform")
            {
                ApplicationArea = All;
                SubPageLink = "Document No." = field("No.");
            }
        }

        area(FactBoxes)
        {
            part(BTBonusStatistic; "BT Bonus Statistic")
            {
                ApplicationArea = All;
                SubPageLink = "No." = field("No.");
                Caption = 'Statistic';
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