page 50103 "BT Bonus Subform"
{
    PageType = ListPart;
    Caption = 'Lines';
    SourceTable = "BT Bonus Line";

    layout
    {
        area(Content)
        {
            repeater(Lines)
            {
                field(Type; Rec.Type)
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies type of the bonus assigned.';

                }

                field("Item No."; Rec."Item No.")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies item number for which bonus is assigned.';

                }

                field("Bonus Perc."; Rec."Bonus Perc.")
                {
                    ApplicationArea = All;
                    Tooltip = 'Specifies bonus percent.';

                }
            }
        }
    }

}