//
//  MainScreen.swift
//  SocioBoxSwiftUI
//
//  Created by Edwin Odesseiron on 3/4/21.
//

import SwiftUI

struct MainScreenView:View{
	@ObservedObject var viewModel:MainScreenViewModel;
	@ObservedObject var userProfileViewModel:UserProfileViewModel;
	@ObservedObject var friendsViewModel:FriendsListViewModel;
	
	init(viewModel:MainScreenViewModel,userProfileViewModel:UserProfileViewModel,friendsViewModel:FriendsListViewModel){
		self.viewModel = viewModel;
		self.userProfileViewModel = userProfileViewModel;
		self.friendsViewModel = friendsViewModel;
	}
	
	var body: some View {
		ScrollView{
			List{
				UserProfileView(viewModel: userProfileViewModel)
				FriendsView(viewModel: friendsViewModel)

			}
					}
		
	}
}

struct MainScreenView_Previews:PreviewProvider{
	static var previews: some View{
		let viewModel = MainScreenViewModel();
		let userProfileViewModel = UserProfileViewModel();
		let friendsViewModel=FriendsListViewModel()
		MainScreenView(viewModel:viewModel,userProfileViewModel: userProfileViewModel,friendsViewModel:friendsViewModel);
	}
}
