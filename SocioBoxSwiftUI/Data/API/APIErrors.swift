//
//  APIErrors.swift
//  SocioBoxSwiftUI
//
//  Created by Edwin Odesseiron on 3/4/21.
//

import Foundation

enum APIError:Error{
	case network(description:String);
	case parsing(description:String);
}
