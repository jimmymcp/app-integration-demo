namespace JamesPearson.AppIntegration;
using Microsoft.Sales.Document;

interface "IShippingAgentIntegration1.0"
{
    procedure CalculateShippingCharge(var TempSalesHeader: Record "Sales Header" temporary; var TempSalesLine: Record "Sales Line" temporary): Decimal
}