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

class UserApi: UserAPI, Injectable {
	func fetchSingleUser(userId: String) -> AnyPublisher<User, APIError> {
		return Just(Mock.user())
			.mapError {_ in
				let error = APIError.network(description: "some mocked error")
				return error
			}
			.eraseToAnyPublisher();
	}
	
	func fetchUserFriends(userId: String) -> AnyPublisher<[User], APIError> {
		return Just(Mock.friends())
			.mapError {_ in
				let error = APIError.network(description: "some mocked error")
				return error
			}
			.eraseToAnyPublisher();
	}
	
	
}
