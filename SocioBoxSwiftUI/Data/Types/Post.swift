//
//  Post.swift
//  SocioBoxSwiftUI
//
//  Created by Edwin Odesseiron on 3/4/21.
//

import Foundation

struct Post: Hashable {
	let pictureURL: String
	let message: String
	let likesCount: Int
	let commentsCount: Int
}
