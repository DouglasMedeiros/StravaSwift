//
//  Club.swift
//  StravaSwift
//
//  Created by Matthew on 11/11/2015.
//  Copyright © 2015 Matthew Clarkson. All rights reserved.
//

import Foundation
import SwiftyJSON

/**
 Clubs represent groups of athletes on Strava. They can be public or private. The object is returned in summary or detailed representations.
 **/
public final class Club: Strava {
    public let id: Int?
    public let profileMedium: NSURL?
    public let profile: NSURL?
    public let name: String?
    public let description: String?
    public let city: String?
    public let state: String?
    public let country: String?
    public let clubType: ClubType?
    public let sportType: SportType?
    public let isPrivate: Bool?
    public let memberCount: Int?
    public let resourceState: ResourceState?
    
    /**
     Initializer
     
     - Parameter json: SwiftyJSON object
     - Internal
     **/
    required public init(_ json: JSON) {
        id = json["id"].int
        name = json["name"].string
        description = json["description"].string
        resourceState = json["resource_state"].strava(ResourceState)
        city = json["city"].string
        state = json["state"].string
        country = json["country"].string
        clubType = json["club_type"].strava(ClubType)
        sportType = json["sport_type"].strava(SportType)
        profileMedium = NSURL(optionalString: json["profile_medium"].string)
        profile = NSURL(optionalString: json["profile"].string)
        isPrivate = json["private"].bool
        memberCount = json["member_count"].int
    }
}