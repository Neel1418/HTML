page 60200 "Currency List Page"
{
    ApplicationArea = All;
    Caption = 'Currency List Page';
    PageType = List;
    SourceTable = "Currency Table";
    UsageCategory = Lists;

    layout
    {
        area(content)
        {
            repeater(General)
            {
                field("Entary No."; Rec."Entary No.")
                {
                    ToolTip = 'Specifies the value of the Entary No. field.';

                }
                field(Base; Rec.Base)
                {
                    ToolTip = 'Specifies the value of the Base field.';
                }
                field("Date"; Rec."Date")
                {
                    ToolTip = 'Specifies the value of the Date field.';
                }
                field(AUD; Rec.AUD)
                {
                    ToolTip = 'Specifies the value of the AUD field.';
                }
                field(CAD; Rec.CAD)
                {
                    ToolTip = 'Specifies the value of the CAD field.';
                }
                field(CHF; Rec.CHF)
                {
                    ToolTip = 'Specifies the value of the CHF field.';
                }
                field(CNY; Rec.CNY)
                {
                    ToolTip = 'Specifies the value of the CNY field.';
                }
                field(GBP; Rec.GBP)
                {
                    ToolTip = 'Specifies the value of the GBP field.';
                }
                field(JPY; Rec.JPY)
                {
                    ToolTip = 'Specifies the value of the JPY field.';
                }
                field(USD; Rec.USD)
                {
                    ToolTip = 'Specifies the value of the USD field.';
                }
            }
        }
    }
    actions
    {
        area(Processing)
        {
            action("Change Currency")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    CUrr_lcdu: Codeunit "Change Currency";

                begin
                    CUrr_lcdu.Exchangecurrency();
                end;
            }
        }
    }

}
