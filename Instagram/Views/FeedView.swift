//
//  FeedView.swift
//  Instagram
//
//  Created by Pablo Junior Almonte Avila on 7/5/22.
//

import SwiftUI

struct FeedView: View {
    let users: [User]
    let posts: [Post]
    
    @Environment(\.colorScheme) var colorScheme
    
    var color : Color {
        colorScheme == .dark ? .white : .black
    }
    
    var body: some View {
        VStack(spacing: 0) {
            HeaderView()
            
            ScrollView(.vertical, showsIndicators: false) {
                ScrollView(.horizontal, showsIndicators: false){
                    HStack(spacing: 15) {
                        ForEach(users){ user in
                            StoryView(user: user)
                        }
                    }
                    
                    .padding(.horizontal)
                }
                
                .padding(.vertical, 5)
                
                Divider()

                VStack(spacing: 0) {
                    ForEach(posts){ post in
                        PostView(post: post)
                    }
                }
            }
            
            BottomTab(activeUser: users[0])
        }
        
        .foregroundColor(color)
    }
}

struct HeaderView : View {
    var body: some View {
        HStack {
            Image("instagram")
                .resizable()
                .frame(width: 120, height: 35)
                .scaledToFit()
            
            Spacer()
            
            HStack(spacing: 20) {
                IconButton(image: "add")
                IconButton(image: "heart")
                IconButton(image: "messenger")
            }
            
            .font(.title3)
        }
    
        .padding(.horizontal, 15)
        .padding(.vertical, 3)
    }
}

struct IconButton : View {
    let image: String
    
    var body: some View {
        Button{} label: {
            Image(image)
        }
    }
}

struct StoryView : View {
    let user: User
    
    var body: some View {
        VStack {
            VStack {
                AvatarImage(user.image)
            }
            
            .overlay{
                Circle()
                    .stroke(
                        LinearGradient(
                            colors: [.red, .orange, .red, .orange, .orange],
                            startPoint: .topLeading,
                            endPoint: .bottomTrailing
                        ),
                        lineWidth: 2.3
                    )
                    .frame(width: 70, height: 70)
            }
            
            .frame(width: 72, height: 72)
            
            Text(user.name)
                .font(.caption)
        }
    }
}

struct PostView : View {
    
    let post: Post
    
    var body: some View {
        VStack(spacing: 0.0){
            HStack {
                HStack {
                    AvatarImage(post.user.image, width: 30, height: 30)
                    
                    Text(post.user.name)
                        .font(.caption)
                        .fontWeight(.bold)
                }
                
                Spacer()
                
                IconButton(image: "more")
            }
            
            .padding(.horizontal, 8)
            .padding(.vertical, 5)
            
            VStack(spacing: 0.0){
                Image(post.image)
                    .resizable()
                    .frame(maxWidth: .infinity)
                    .scaledToFit()
                
                HStack {
                    HStack(spacing: 10) {
                        IconButton(image: "heart")
                        IconButton(image: "messenger")
                        IconButton(image: "share")
                    }
                    
                    Spacer()
                    
                    IconButton(image: "bookmark")
                }
                
                .font(.title3)
                .padding(.horizontal, 12)
                .padding(.vertical, 10)
            }
            
            VStack(alignment: .leading, spacing: 0.0) {
                if let message = post.description {
                    Text(message)
                        .font(.footnote)
                        .fontWeight(.light)
                        .padding(.horizontal, 12)
                }
                
                HStack {
                    HStack(spacing: 7.0){
                        AvatarImage(post.user.image, width: 24, height: 24)
                        
                        Text("Add comment...")
                            .font(.caption)
                            .foregroundColor(.secondary)
                    }
                    
                    Spacer()
                    
                    HStack {
                        Button("😍"){}
                        Button("😂"){}
                        Button{} label: {
                            Image(systemName: "plus.circle")
                        }
                    }
                }
                
                .padding(.horizontal, 12)
                .padding(.vertical, 9)
                
            }
        }
        
        .padding(.bottom)
    }
}

struct AvatarImage: View {
    let image: String
    let width: CGFloat
    let height: CGFloat
    
    init(_ image: String, width: CGFloat = 60, height: CGFloat = 60){
        self.image = image
        self.width = width
        self.height = height
    }
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFill()
            .frame(width: width, height: height)
            .cornerRadius(50)
    }
}

struct TabItem<Content: View>: View {
    let content: Content
    
    init(@ViewBuilder content: @escaping () -> Content){
        self.content = content()
    }
    
    var body: some View {
        content
            .frame(maxWidth: .infinity)
    }
}

struct BottomTab: View {
    let activeUser: User
    let tabs = ["Home", "Search", "Reels", "Shop"]
    
    var body: some View {
        VStack(spacing: 0.0) {
            Divider()
            
            HStack{
                ForEach(tabs, id: \.self){ tab in
                    TabItem {
                        Image(tab)
                    }
                }
                
                TabItem {
                    AvatarImage(activeUser.image, width: 24, height: 24)
                }
            }
            
            .padding(.horizontal, 5)
            .padding(.top, 12)
        }
    }
}

struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView(users: User.sampleData, posts: Post.sampleData)
            .preferredColorScheme(.dark)
    }
}
