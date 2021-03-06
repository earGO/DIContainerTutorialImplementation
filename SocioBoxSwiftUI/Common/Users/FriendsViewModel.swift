import SwiftUI
import Combine

class FriendsListViewModel: ObservableObject, Identifiable {
	@Inject var userApi:UserApi;
	
	@Published var friends:[UserWithLoadedAvatar]=[];
	
	private var disposables = Set<AnyCancellable>();
	
	init(
		scheduler:DispatchQueue = DispatchQueue(label:"FriendsListViewModel")
	){
		self.fetchUserFriends(userId:"someUserId");
	}
	
	func fetchUserFriends(userId:String){
		userApi.fetchUserFriends(userId: userId)
			.receive(on: DispatchQueue.main)
			.sink(receiveCompletion: { [weak self] value in
				guard let self = self else { return }
				switch value {
					case .failure:
						self.friends = []
					case .finished:
						break
				}
			},
			receiveValue: { [weak self] friends in
				guard let self = self else { return }
				self.friends = self.loadImages(friends);
			})
			.store(in: &disposables)
	}
	
	func loadImages(_ friends:[User])->[UserWithLoadedAvatar]{
		var result:[UserWithLoadedAvatar]=[];
		for friend in friends {
			let friendAvatar = ImageLoader(urlString: friend.imageURL).image;
			result.append(UserWithLoadedAvatar(name: friend.name, avatar: friendAvatar, bio: friend.bio, area: friend.area, friends: [], photos: [], historyFeed: []))
		}
		return result;
	}
}
