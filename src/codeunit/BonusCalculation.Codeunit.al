codeunit 50100 "BT Bonus Calculation"
{
    [EventSubscriber(ObjectType::Codeunit, Codeunit::"Sales-Post", 'OnAfterSalesInvLineInsert', '', true, true)]
    local procedure RunOnAfterSalesInvLineInsert(var SalesInvLine: Record "Sales Invoice Line")
    begin
        CalculateBonus(SalesInvLine);
    end;

    local procedure CalculateBonus(var SalesInvLine: Record "Sales Invoice Line")
    var
        BTBonusHeader: Record "BT Bonus Header";

    begin
        if SalesInvLine.Type <> SalesInvLine.Type::Item then
            exit;

        BTBonusHeader.SetRange("Customer No.", SalesInvLine."Bill-to Customer No.");
        BTBonusHeader.SetRange(Status, BTBonusHeader.Status::Released);
        BTBonusHeader.SetFilter("Starting Date", '..%1', SalesInvLine."Posting Date");
        BTBonusHeader.SetFilter("Ending Date", '%1..', SalesInvLine."Posting Date");
        if BTBonusHeader.IsEmpty then
            exit;

        if BTBonusHeader.FindSet() then
            repeat
                FindBonusForAllItems(BTBonusHeader, SalesInvLine);
                FindBonusForOneItems(BTBonusHeader, SalesInvLine);
            until BTBonusHeader.Next() = 0;

    end;

    local procedure FindBonusForAllItems(var BTBonusHeader: Record "BT Bonus Header"; var SalesInvLine: Record "Sales Invoice Line")
    var
        BTBonusLine: Record "BT Bonus Line";
    begin
        BTBonusLine.SetRange("Document No.", BTBonusHeader."No.");
        BTBonusLine.SetRange(Type, BTBonusLine.Type::"All Items");
        if BTBonusLine.FindFirst() then
            InsertBonusEntry(BTBonusLine, SalesInvLine);
    end;

    local procedure FindBonusForOneItems(var BTBonusHeader: Record "BT Bonus Header"; var SalesInvLine: Record "Sales Invoice Line")
    var
        BTBonusLine: Record "BT Bonus Line";
    begin
        BTBonusLine.SetRange("Document No.", BTBonusHeader."No.");
        BTBonusLine.SetRange(Type, BTBonusLine.Type::Item);
        if BTBonusLine.FindFirst() then
            InsertBonusEntry(BTBonusLine, SalesInvLine);
    end;

    local procedure InsertBonusEntry(var BTBonusLine: Record "BT Bonus Line"; var SalesInvLine: Record "Sales Invoice Line")
    var
        BTBonusEntry: Record "BT Bonus Entry";
        EntryNo: Integer;
    begin
        if BTBonusEntry.FindLast() then
            EntryNo := BTBonusEntry."Entry No." + 1
        else
            EntryNo := 1;

        BTBonusEntry.Init();
        BTBonusEntry."Entry No." := EntryNo;
        BTBonusEntry."Bonus No." := BTBonusLine."Document No.";
        BTBonusEntry."Document No." := SalesInvLine."Document No.";
        BTBonusEntry."Item No." := SalesInvLine."No.";
        BTBonusEntry."Posting Date" := SalesInvLine."Posting Date";
        BTBonusEntry."Bonus Amount" := SalesInvLine."Line Amount" * BTBonusLine."Bonus Perc." / 100;
        BTBonusEntry.Insert();

    end;

}