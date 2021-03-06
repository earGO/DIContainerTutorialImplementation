//
//  SocioBoxSwiftUIApp.swift
//  SocioBoxSwiftUI
//
//  Created by Edwin Odesseiron on 3/2/21.
//

import SwiftUI

@main
struct SocioBoxSwiftUIApp: App {
	
	private let diContainer = DIContainer();
	private let mainScreenViewModel = MainScreenViewModel();
	private let userProfileViewModel = UserProfileViewModel();
	private let friendsViewModel = FriendsListViewModel();
	
    var body: some Scene {
        WindowGroup {
		MainScreenView(viewModel:mainScreenViewModel,userProfileViewModel: userProfileViewModel,friendsViewModel:friendsViewModel)
        }
    }
}
