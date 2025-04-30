namespace JamesPearson.AppIntegration;

codeunit 50300 "App Integration"
{
    var
        Apps: Dictionary of [Enum App, Interface IApp];

    procedure Register(App: Enum App; IApp: Interface IApp)
    begin
        if Apps.ContainsKey(App) then
            Apps.Set(App, IApp)
        else
            Apps.Add(App, IApp);
    end;

    procedure GetInterfaceVersion(App: Enum App): Version
    begin
        if not HasImplementation(App) then
            exit(Version.Create(0, 0, 0, 0));

        exit(Apps.Get(App).GetVersion());
    end;

    procedure HasImplementation(App: Enum App): Boolean
    begin
        exit(Apps.ContainsKey(App));
    end;

    procedure "ShippingAgentIntegration1.0"(): Interface "IShippingAgentIntegration1.0"
    begin
        exit(Apps.Get(App::ShippingIntegration) as "IShippingAgentIntegration1.0");
    end;
}