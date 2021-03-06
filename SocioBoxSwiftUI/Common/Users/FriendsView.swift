//
//  FriendsView.swift
//  SocioBoxSwiftUI
//
//  Created by Edwin Odesseiron on 3/5/21.
//

import SwiftUI
import Combine

struct FriendsView: View {
	@ObservedObject var viewModel: FriendsListViewModel;
	
	init(viewModel:FriendsListViewModel){
		self.viewModel = viewModel;
	}
	
    var body: some View {
	Section{
		ForEach(viewModel.friends, content: UsersListItemView.init(viewModel:))
	}
    }
}

struct FriendsView_Previews: PreviewProvider {
    static var previews: some View {
	let friendsViewModel = FriendsListViewModel();
        FriendsView(viewModel: friendsViewModel)
    }
}
