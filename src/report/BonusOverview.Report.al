report 50100 "BT Bonus Overview"
{
    UsageCategory = ReportsAndAnalysis;
    ApplicationArea = All;
    Caption = 'Report Overview';
    DefaultLayout = Word;
    WordLayout = 'BonusOverview.Report.docx';

    dataset
    {
        dataitem("BT Bonus Header"; "BT Bonus Header")
        {
            RequestFilterFields = "No.", "Customer No.";

            column(No_; "No.")
            {

            }

            column(Customer_No_; "Customer No.")
            {

            }
            column(Starting_Date; Format("Starting Date", 0))
            {

            }
            column(Ending_Date; Format("Ending Date", 0))
            {

            }

            column(BonusNoCaptionLbl; BonusNoCaptionLbl)
            {

            }

            column(CustomerNoCaptionLbl; CustomerNoCaptionLbl)
            {

            }

            column(StartingDateCaptionLbl; StartingDateCaptionLbl)
            {

            }

            column(EndingDateCaptionLbl; EndingDateCaptionLbl)
            {

            }

            column(BonusAmountCaptionLbl; BonusAmountCaptionLbl)
            {

            }

            column(ItemNoCaptionLbl; ItemNoCaptionLbl)
            {

            }

            column(PostingDateCaptionLbl; PostingDateCaptionLbl)
            {

            }

            column(DocumentNoCaptionLbl; DocumentNoCaptionLbl)
            {

            }

            column(AmountSum; AmountSum)
            {

            }

            dataitem("BT Bonus Entry"; "BT Bonus Entry")
            {
                DataItemLink = "Bonus No." = field("No.");
                RequestFilterFields = "Posting Date";

                column(Document_No_; "Document No.")
                {

                }

                column(Item_No_; "Item No.")
                {

                }

                column(Posting_Date; "Posting Date")
                {

                }

                column(Bonus_Amount; "Bonus Amount")
                {

                }


            }

            trigger OnAfterGetRecord()
            var
                BTBonusEntry: Record "BT Bonus Entry";
            begin
                BTBonusEntry.CopyFilters("BT Bonus Entry");
                BTBonusEntry.SetRange("Bonus No.", "No.");
                BTBonusEntry.CalcSums("Bonus Amount");
                AmountSum := BTBonusEntry."Bonus Amount";
            end;
        }
    }

    var
        BonusNoCaptionLbl: Label 'Bonus No.';
        CustomerNoCaptionLbl: Label 'Customer No.';
        PostingDateCaptionLbl: Label 'Posting Date';
        DocumentNoCaptionLbl: Label 'Document No.';
        BonusAmountCaptionLbl: Label 'Amount';
        ItemNoCaptionLbl: Label 'Item No.';
        StartingDateCaptionLbl: Label 'Starting Date';
        EndingDateCaptionLbl: Label 'Ending Date';
        AmountSum: Decimal;

}