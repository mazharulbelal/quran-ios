//
//  PlayerItemInfo.swift
//  Quran
//
//  Created by Afifi, Mohamed on 2018-04-04.
//
//  Quran for iOS is a Quran reading application for iOS.
//  Copyright (C) 2018  Quran.com
//
//  This program is free software: you can redistribute it and/or modify
//  it under the terms of the GNU General Public License as published by
//  the Free Software Foundation, either version 3 of the License, or
//  (at your option) any later version.
//
//  This program is distributed in the hope that it will be useful,
//  but WITHOUT ANY WARRANTY; without even the implied warranty of
//  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
//  GNU General Public License for more details.
//
import MediaPlayer

public struct PlayerItemInfo {
    // MARK: Lifecycle

    public init(title: String, artist: String, image: UIImage?) {
        self.title = title
        self.artist = artist
        artwork = (image ?? UIImage(named: "app-image")).map { image in
            MPMediaItemArtwork(boundsSize: image.size) { _ in image }
        }
    }

    // MARK: Public

    public let title: String
    public let artist: String
    public let artwork: MPMediaItemArtwork?
}
