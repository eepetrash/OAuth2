//
//  OAuth2CodeGrantJawbone.swift
//  OAuth2
//
//  Created by Eugene Petrash on 6/21/16.
//  Copyright © 2016 Pascal Pfiffner. All rights reserved.
//

import Foundation

public class OAuth2CodeGrantJawbone: OAuth2CodeGrant {
    
    override func tokenRequestWithCode(code: String, params: OAuth2StringDict? = nil) throws -> OAuth2AuthRequest {
        let req = try super.tokenRequestWithCode(code, params: params)

        guard let clientSecret = clientConfig.clientSecret where !clientSecret.isEmpty else {
            throw OAuth2Error.NoClientSecret
        }
        
        req.params["client_secret"] = clientSecret
        
        return req
    }
}
