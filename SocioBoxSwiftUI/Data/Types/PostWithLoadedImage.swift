//
//  PostWithLoadedImage.swift
//  SocioBoxSwiftUI
//
//  Created by Edwin Odesseiron on 3/4/21.
//

import Foundation
import SwiftUI

struct PostWithLoadedImage: Hashable {
	let picture: UIImage;
	let message: String;
	let likesCount: Int;
	let commentsCount: Int;
}
