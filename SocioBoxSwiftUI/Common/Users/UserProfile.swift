//
//  UserProfile.swift
//  SocioBoxSwiftUI
//
//  Created by Edwin Odesseiron on 3/4/21.
//

import SwiftUI

struct UserProfile: View {
	
	let avatar:UIImage;
	let name:String;
	let area:String;
	let bio:String;
	
	init( name:String, avatar:UIImage, bio:String, area:String ){
		self.avatar = avatar;
		self.name = name;
		self.area = area;
		self.bio = bio;
	}
	
    var body: some View {
	GeometryReader { geo in
		VStack {
			HStack{
				Spacer()
				Image(systemName: "video").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
				Image(systemName: "message").foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
			}.padding(.trailing, 12)
			HStack {
				Spacer()
					Image(uiImage: avatar)
						.resizable()
						.aspectRatio(contentMode: .fill)
						.frame(width: geo.size.width/4.17, height: geo.size.width/4.17, alignment: .center)
						.clipShape(Circle())
						.overlay(Circle().stroke(Color.white,lineWidth:1).shadow(radius: 1))
				
				Spacer()
			}
			Text(name)
				.font(.largeTitle)
			HStack{
				Image(systemName: "location")
					.accentColor(.blue)
				Text(area)
					.font(.callout)
			}
			.padding(.top, 6)
			Text(bio)
				.font(.callout)
				.padding(.top, 28)
				.padding(.horizontal, 28)
			
		}
		.frame(width: geo.size.width, height: 284, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
	}
    }
}

struct UserProfile_Previews: PreviewProvider {
	static var previewAvatar = UIImage(named: "img_placeholder", in: Bundle(for: ImageLoader.self), with: nil) ?? UIImage()
	static let previewUser = Mock.user();
	
    static var previews: some View {
	UserProfile(name:previewUser.name, avatar: previewAvatar,bio:previewUser.bio, area: previewUser.area )
		.preferredColorScheme(.dark)
    }
}
