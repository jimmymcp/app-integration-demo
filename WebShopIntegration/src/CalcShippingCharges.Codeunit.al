namespace JamesPeason.WebShopIntegration;
using JamesPearson.AppIntegration;
using Microsoft.Sales.Document;

codeunit 50350 "Calc. Shipping Charges"
{
    procedure CalcShippingCharge(var TempSalesHeader: Record "Sales Header" temporary; var TempSalesLine: Record "Sales Line" temporary): Decimal
    var
        AppIntegration: Codeunit "App Integration";
    begin
        //if the shipping agent integration interface is implemented then call its method
        if AppIntegration.GetInterfaceVersion(Enum::App::ShippingIntegration) >= Version.Create(1, 0, 0, 0) then
            exit(AppIntegration."ShippingAgentIntegration1.0"().CalculateShippingCharge(TempSalesHeader, TempSalesLine));

        //if not then we have some alternative logic to calculate shipping charges
        exit(SomeAlternativeLogic(TempSalesHeader, TempSalesLine));
    end;

    local procedure SomeAlternativeLogic(var TempSalesHeader: Record "Sales Header" temporary; var TempSalesLine: Record "Sales Line" temporary): Decimal
    begin
        //some alternative logic for calculating shipping charges goes here
    end;
}