//
// ManageInfoViewModel.swift
//
// Generated by swagger-codegen
// https://github.com/swagger-api/swagger-codegen
//

import Foundation


public class ManageInfoViewModel: JSONEncodable {
    public var localLoginProvider: String?
    public var email: String?
    public var logins: [UserLoginInfoViewModel]?
    public var externalLoginProviders: [ExternalLoginViewModel]?

    public init() {}

    // MARK: JSONEncodable
    func encodeToJSON() -> AnyObject {
        var nillableDictionary = [String:AnyObject?]()
        nillableDictionary["LocalLoginProvider"] = self.localLoginProvider
        nillableDictionary["Email"] = self.email
        nillableDictionary["Logins"] = self.logins?.encodeToJSON()
        nillableDictionary["ExternalLoginProviders"] = self.externalLoginProviders?.encodeToJSON()
        let dictionary: [String:AnyObject] = APIHelper.rejectNil(nillableDictionary) ?? [:]
        return dictionary
    }
}
