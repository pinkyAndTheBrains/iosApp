//
// TransactionAuth.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


public class TransactionAuth: JSONEncodable {
    public var transactionId: String?
    public var authCode: String?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["TransactionId"] = self.transactionId
        nillableDictionary["AuthCode"] = self.authCode
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
