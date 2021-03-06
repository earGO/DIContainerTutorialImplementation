import SwiftUI

struct UserWithLoadedAvatar: Hashable, Equatable {
	let name: String
	let avatar: UIImage;
	let bio: String;
	let area: String;
	let friends: [UserWithLoadedAvatar];
	let photos: [String];
	let historyFeed: [Post];
	static func == (lhs: UserWithLoadedAvatar, rhs: UserWithLoadedAvatar) -> Bool {
		lhs.name == rhs.name	}
}
