namespace JamesPearson.ShippingAgentIntegration;
using JamesPearson.AppIntegration;
using Microsoft.Sales.Document;
using System.Environment.Configuration;

codeunit 50400 "Shipping Agent Integration" implements IApp, "IShippingAgentIntegration1.0"
{
    procedure GetVersion(): Version
    begin
        exit(Version.Create(1, 0, 0, 0));
    end;

    procedure CalculateShippingCharge(var TempSalesHeader: Record "Sales Header" temporary; var TempSalesLine: Record "Sales Line" temporary): Decimal
    begin
        //business logic for calculating shipping charges
        Randomize(Time() - 0T);
        exit(Random(10));
    end;

    [EventSubscriber(ObjectType::Codeunit, Codeunit::"System Initialization", OnAfterLogin, '', false, false)]
    local procedure "System Initialization_OnAfterLogin"()
    var
        AppIntegration: Codeunit "App Integration";
    begin
        AppIntegration.Register(Enum::App::ShippingIntegration, this);
    end;
}