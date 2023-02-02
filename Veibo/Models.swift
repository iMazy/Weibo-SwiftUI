//
//  Models.swift
//  Veibo
//
//  Created by Ma on 2023/2/1.
//

import Foundation

struct ChuckNorrisJoke: Codable {
    let origin: String
    let url: String
}

struct WeiboOauth2AccessToken: Codable {
    let access_token: String
//    let expires_in: String
//    let remind_in: String
    let uid: String
}

struct UserInfoModel: Codable {
//    let id: String
    let name: String
    let description: String
    let profile_image_url: String
    let followers_count: Int
    let avatar_large: String
}


struct HomeTimeline : Codable {
    let statuses: [HomeTimelineStatus]
}

struct HomeTimelineStatus: Codable, Identifiable {
    var id: Int64
    let pic_urls: [HomeTimelineStatusPicUrl]
    let text: String
    let user: HomeTimelineStatusUser
    let created_at: String
}

struct HomeTimelineStatusPicUrl: Codable {
    let thumbnail_pic: String
}

struct HomeTimelineStatusUser: Codable {
    let name: String
    let avatar_large: String
}
