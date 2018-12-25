//
//  Photo.swift
//  Bala.Andrii.MarsRover
//
//  Created by Andrii Bala on 12/24/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import Foundation

struct Photos: Codable {
    let photos: [Photo]
}

struct Photo: Codable {
    let id, sol: Int
    let camera: PhotoCamera
    let img_src: String
    let earth_date: String
    let rover: Rover
}

struct PhotoCamera: Codable {
    let id: Int
    let name: String
    let rover_id: Int
    let full_name: String
}

struct Rover: Codable {
    let id: Int
    let name, landing_date, launch_date, status: String
    let max_sol: Int
    let max_date: String
    let total_photos: Int
    let cameras: [CameraElement]
}

struct CameraElement: Codable {
    let name, full_name: String
}

extension Photo: Equatable { }

func == (lhs: Photo, rhs: Photo) -> Bool {
    return lhs.id == rhs.id
}
