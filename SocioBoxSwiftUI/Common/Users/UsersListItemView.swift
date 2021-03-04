//
//  UsersListItem.swift
//  SocioBoxSwiftUI
//
//  Created by Edwin Odesseiron on 3/4/21.
//

import SwiftUI

struct UsersListItem: View {
	
	let userAvatar:UIImage;
	let userName:String;
	
	init(_ userName:String, _ avatar:UIImage){
		self.userAvatar = avatar;
		self.userName = userName;
	}
	
	
    var body: some View {
	VStack {
		GeometryReader { geo in
			Image(uiImage: userAvatar)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: geo.size.width, height: 123, alignment: .center)
				.clipped()
			
		}
		Text(userName)
			.padding(.vertical, 6)
	}.frame(maxWidth: 76,maxHeight: 154 )
    }
}

struct UsersListItem_Previews: PreviewProvider {
	static var previewAvatar = UIImage(named: "img_placeholder", in: Bundle(for: ImageLoader.self), with: nil) ?? UIImage()
	
    static var previews: some View {
	UsersListItem("Josh", previewAvatar)
		.preferredColorScheme(.dark)
    }
}
