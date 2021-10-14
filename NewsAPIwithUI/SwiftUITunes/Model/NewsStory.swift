//
//  Track.swift
//  SwiftUITunes
//
//  Created by lake on 9/16/21.
//


import Foundation
public struct NewsStory: Codable
{
    /*
     "author": "Sakshita Khosla",
          "content": "The ruling BJP on Tuesday retained the Gandhinagar Municipal Corporation (GMC) and won in two other civic body polls in Gujarat. Meanwhile, Congress won the polls for Bhanvad municipality in Devbhumi Dwarka district. Congratulating Gujarat BJP workers for the local body poll results, PM Narendra Modi said, \"Results...reaffirm the deep-rooted bond between the people of Gujarat and BJP.\"",
          "date": "05 Oct 2021,Tuesday",
          "imageUrl": "https://static.inshorts.com/inshorts/images/v1/variants/jpg/m/2021/10_oct/5_tue/img_1633437263685_837.jpg?",
          "readMoreUrl": "https://www.hindustantimes.com/india-news/gandhinagar-municipal-corporation-poll-result-nadda-thanks-people-of-gujarat-101633428970165-amp.html?utm_campaign=fullarticle&utm_medium=referral&utm_source=inshorts ",
          "time": "06:21 pm",
          "title": "BJP wins Gandhinagar & 2 other Gujarat civic body polls, Congress wins 1",
          "url": "https://www.inshorts.com/en/news/bjp-wins-gandhinagar-2-other-gujarat-civic-body-polls-congress-wins-1-1633438260708"
     */
    
    var author: String
    var content: String
    var date: String
    var imageUrl: String
    var readMoreUrl: String?
    var time: String
    var title: String
    var url: String
  
    
}
