//
// SuggestionsAPI.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Alamofire



public class SuggestionsAPI: APIBase {
    /**

     - parameter beaconId: (query)  
     - parameter completion: completion handler to receive the data and the error objects
     */
    public class func suggestionsGet(beaconId beaconId: String, completion: ((data: [Product]?, error: ErrorType?) -> Void)) {
        suggestionsGetWithRequestBuilder(beaconId: beaconId).execute { (response, error) -> Void in
            completion(data: response?.body, error: error);
        }
    }


    /**
     - GET /api/Suggestions
     - examples: [{contentType=application/json, example=[ {
  "Price" : 1.3579000000000001069366817318950779736042022705078125,
  "Id" : 123,
  "Name" : "aeiou"
} ]}, {contentType=application/xml, example=<null>
  <Id>0</Id>
  <Name>string</Name>
  <Price>not implemented io.swagger.models.properties.DoubleProperty@a50c0d50</Price>
</null>}]
     - examples: [{contentType=application/json, example=[ {
  "Price" : 1.3579000000000001069366817318950779736042022705078125,
  "Id" : 123,
  "Name" : "aeiou"
} ]}, {contentType=application/xml, example=<null>
  <Id>0</Id>
  <Name>string</Name>
  <Price>not implemented io.swagger.models.properties.DoubleProperty@a50c0d50</Price>
</null>}]
     
     - parameter beaconId: (query)  

     - returns: RequestBuilder<[Product]> 
     */
    public class func suggestionsGetWithRequestBuilder(beaconId beaconId: String) -> RequestBuilder<[Product]> {
        let path = "/api/Suggestions"
        let URLString = SwaggerClientAPI.basePath + path

        let nillableParameters: [String:AnyObject?] = [
            "beaconId": beaconId
        ]
 
        let parameters = APIHelper.rejectNil(nillableParameters)
 
        let convertedParameters = APIHelper.convertBoolToString(parameters)
 
        let requestBuilder: RequestBuilder<[Product]>.Type = SwaggerClientAPI.requestBuilderFactory.getBuilder()

        return requestBuilder.init(method: "GET", URLString: URLString, parameters: convertedParameters, isBody: false)
    }

}