//
//  UsersListItem.swift
//  SocioBoxSwiftUI
//
//  Created by Edwin Odesseiron on 3/4/21.
//

import SwiftUI

struct UsersListItemView: View, Identifiable {
	var id: ObjectIdentifier
	
	
	@ObservedObject var viewModel: UserProfileViewModel
	
	init(viewModel: UserProfileViewModel){
		self.viewModel = viewModel;
	}
	
	
    var body: some View {
	VStack {
		GeometryReader { geo in
			Image(uiImage: viewModel.userAvatar)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: geo.size.width, height: 123, alignment: .center)
				.clipped()
			
		}
		Text(viewModel.name)
			.padding(.vertical, 6)
	}.frame(maxWidth: 76,maxHeight: 154 )
    }
}

struct UsersListItem_Previews: PreviewProvider {
	static var previewAvatar = UIImage(named: "img_placeholder", in: Bundle(for: ImageLoader.self), with: nil) ?? UIImage()
	
    static var previews: some View {
	let viewModel=UserProfileViewModel();
	UsersListItem(viewModel:viewModel)
		.preferredColorScheme(.dark)
    }
}
