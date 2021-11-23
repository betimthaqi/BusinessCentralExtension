page 50105 "BT Bonus Statistic"
{
    PageType = CardPart;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "BT Bonus Header";

    layout
    {
        area(Content)
        {
            group(GroupName)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    ToolTip = 'Number of bonus header';
                }

                field("Bonus Amount"; Rec."Bonus Amount")
                {
                    ApplicationArea = All;
                    ToolTip = 'will specify bonus amount';
                }
            }
        }
    }

}