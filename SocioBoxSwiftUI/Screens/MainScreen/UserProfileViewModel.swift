import SwiftUI
import Combine

class UserProfileViewModel: ObservableObject, Identifiable {
	
	@Inject var userApi:UserApi;
	
	@Published var userAvatar:UIImage=UIImage();
	@Published var name:String="";
	@Published var area:String="";
	@Published var bio:String="";
	
	private var disposables = Set<AnyCancellable>();
	
	init(
		scheduler:DispatchQueue = DispatchQueue(label:"UserProfileViewModel")
	){
		self.fetchUser(userId: "someUserId")
	}
	
	func fetchUser(userId:String){
		userApi.fetchSingleUser(userId:userId)
			.receive(on: DispatchQueue.main)
			.sink(receiveCompletion: { [weak self] value in
				guard let self = self else { return }
				switch value {
					case .failure:
						self.name = "unable to fetch user";
					case .finished:
						break
				}
			},
			receiveValue: { [weak self] user in
				guard let self = self else { return }
				self.name = user.name;
				self.bio = user.bio;
				self.area = user.area;
				self.userAvatar = ImageLoader(urlString: user.imageURL).image;
			})
			.store(in: &disposables)
	}
	
}
