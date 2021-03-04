//
//  PostsListItemView.swift
//  SocioBoxSwiftUI
//
//  Created by Edwin Odesseiron on 3/4/21.
//

import SwiftUI

struct PostsListItemView: View {
	
	let likes:Int;
	let comments:Int;
	let message:String;
	let picture:UIImage
	
	init(_ likes:Int, _ comments: Int, _ message:String, _ picture:UIImage){
		self.likes = likes;
		self.comments = comments;
		self.message = message;
		self.picture = picture;
	}
	
    var body: some View {
	VStack {
		PostPicture(picture: picture)
		HStack {
			PostMessage(message)
			LikesAndComments(self.likes,self.comments)
		}.padding(.all, 12)
	}.frame(maxHeight: 264)
	.padding(.vertical, 12)
    }
}

struct PostsListItemView_Previews: PreviewProvider {
	static var previewPicture = UIImage(named: "img_placeholder", in: Bundle(for: ImageLoader.self), with: nil) ?? UIImage()
	
    static var previews: some View {
	VStack {
		PostsListItemView(20,10,"Such a nice place!", previewPicture)
			.preferredColorScheme(.dark)
		PostsListItemView(200,142,"", previewPicture)
			.preferredColorScheme(.dark)
	}
    }
}






//MARK: - PostPicture component
private struct PostPicture:View{
	let picture:UIImage;
	
	var body: some View {
		GeometryReader { geo in
			Image(uiImage: picture)
				.resizable()
				.aspectRatio(contentMode: .fill)
				.frame(width: geo.size.width, height: 224.0, alignment: .center)
				.clipped()
		}
	}
}


//MARK: - Post message component
private struct PostMessage:View {
	let message:String;
	
	init(_ message:String){
		self.message = message;
	}
	
	var body: some View{
		if message.count>0 {
			HStack {
				Text(message)
				Spacer(minLength: /*@START_MENU_TOKEN@*/0/*@END_MENU_TOKEN@*/)
			}
		} else {
			Spacer(minLength: 240)
		}
	}
}


//MARK: - Likes and Comments component
private struct LikesAndComments:View{
	
	let likes:Int;
	let comments:Int;
	
	init(_ likes:Int, _ comments:Int){
		self.likes = likes;
		self.comments = comments;
	}
	
	var body: some View{
		HStack{
			Image(systemName: "hand.thumbsup")
				.accentColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
			Text(String(likes))
			Image(systemName: "bubble.left")
				.accentColor(.blue)
			Text(String(comments))
		}
	}
}
