import SwiftUI
import Combine

class MainScreenViewModel: ObservableObject, Identifiable {
	@Inject var userApi: UserApi;
	
	@Published var userAvatar:UIImage=UIImage();
	@Published var user:User?;
	@Published var friends:[User]=[];
	@Published var posts:[Post]=[];
	
	private var disposables = Set<AnyCancellable>();
	
	init(
		scheduler: DispatchQueue = DispatchQueue(label: "MainScreenViewModel")
	){
		self.fetchUserFriends(userId: "someId")
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
				self.friends = friends;
			})
			.store(in: &disposables)
	}
	
}
