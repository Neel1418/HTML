codeunit 60200 "Change Currency"
{
    procedure Exchangecurrency()
    var
        JsonObj: JsonObject;
        OrderURL: Label 'http://api.exchangeratesapi.io/v1/latest?access_key=5e398ef78a812e44066a9c266ba4999e';

        ltext: Text;
        JSONResponse: Text;
        gcontent: HttpContent;
        lheaders: HttpHeaders;
        gClient: HttpClient;
        gResponse: HttpResponseMessage;
        HttpStatusCode: Integer;
        IsSuccessful: Boolean;
        greqMsg: HttpRequestMessage;
        gHttpClient: HttpClient;
        JObject: JsonObject;
        Jtoken: JsonToken;
        Jtokenvalues: JsonToken;

        Currency_lRec: Record "Currency Table";
    begin
        // JsonObj.Add('product', PostItemObj(Item));

        if JsonObj.WriteTo(ltext) then begin

            gcontent.WriteFrom(ltext);
            greqMsg.SetRequestUri(OrderURL);
            lheaders.Clear();
            gcontent.GetHeaders(lheaders);

            // lheaders.Add('X-Shopify-Access-Token', 'Access-Token');
            if lheaders.Contains('Content-Type') then
                lheaders.Remove('Content-Type');
            lheaders.Add('Content-Type', 'application/json');

            gcontent.GetHeaders(lheaders);
            greqMsg.Content(gcontent);
            greqMsg.GetHeaders(lheaders);


            gHttpClient.send(greqMsg, gResponse);

            JSONResponse := '';

            gResponse.Content.ReadAs(JSONResponse);

            Jtoken.ReadFrom(JSONResponse);

            JObject := Jtoken.AsObject();
            If Jtoken.AsObject().get('base', Jtoken) then begin
                Currency_lRec.Base := Jtoken.AsValue().AsText();
                Currency_lRec.Insert();
            end;
            if JObject.Get('date', Jtoken) then begin
                Currency_lRec.Date := Jtoken.AsValue().AsDate();

                if JObject.Get('rates', Jtoken) then begin
                    if Jtoken.AsObject().Get('AUD', Jtoken) then begin
                        Currency_lRec.AUD := Jtoken.AsValue().AsDecimal();
                        // Currency_lRec."Entary No." := 1;
                        Currency_lRec.Insert();
                    end;
                end;
            end;
        end;
    end;

    // end;

}
