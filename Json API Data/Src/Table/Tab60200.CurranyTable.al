table 60200 "Currency Table"
{
    Caption = 'Currency Table';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "Entary No."; Decimal)
        {
            Caption = 'Entary No.';
            AutoIncrement = true;
        }
        field(2; Base; Code[20])
        {
            Caption = 'Base';
        }
        field(3; Date; Date)
        {
            Caption = 'Date';
        }
        field(4; AUD; Decimal)
        {
            Caption = 'AUD';
        }
        field(5; CAD; Decimal)
        {
            Caption = 'CAD';
        }
        field(6; CHF; Decimal)
        {
            Caption = 'CHF';
        }
        field(7; CNY; Decimal)
        {
            Caption = 'CNY';
        }
        field(8; GBP; Decimal)
        {
            Caption = 'GBP';
        }
        field(9; JPY; Decimal)
        {
            Caption = 'JPY';
        }
        field(10; USD; Decimal)
        {
            Caption = 'USD';
        }
    }
    keys
    {
        key(PK; "Entary No.")
        {
            Clustered = true;
        }
    }
}
