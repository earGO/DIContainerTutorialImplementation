import Foundation

class DIContainer {
	private let userApi:UserApi;
	
	init(){
		self.userApi = UserApi();
		addDependencies();

	}
	
	private func addDependencies(){
		let resolver = Resolver.shared;
		resolver.add(userApi);
	}
}
