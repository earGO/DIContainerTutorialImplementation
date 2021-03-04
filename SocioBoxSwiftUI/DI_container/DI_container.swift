import Foundation

class DIContainer {
	private let userApi:UserApi;
	
	init(){
		self.userApi = UserApi();
	}
	
	private func addDependencies(){
		let resolver = Resolver.shared;
		resolver.add(userApi);
	}
}
