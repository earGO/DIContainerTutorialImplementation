//
//  FetchUserProfile.swift
//  SocioBoxSwiftUI
//
//  Created by Edwin Odesseiron on 3/4/21.
//

import Foundation
import Combine

protocol UserAPI {
	func fetchSingleUser(userId:String)->AnyPublisher<User, APIError>
	func fetchUserFriends(userId:String)->AnyPublisher<[User], APIError>
}


