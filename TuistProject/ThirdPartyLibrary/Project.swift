//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by BEYun on 2023/04/14.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "ThirdPartyLibrary",
    product: .framework,
    packages: [
        .remote(
            url: "https://github.com/SnapKit/SnapKit.git",
            requirement: .upToNextMajor(from: "5.0.1")
        ),
        .remote(
            url: "https://github.com/devxoul/Then",
            requirement: .upToNextMajor(from: "2.0.0")
        ),
        .remote(
            url: "https://github.com/Alamofire/Alamofire.git",
            requirement: .upToNextMajor(from: "5.6.1")
        ),
        .remote(
            url: "https://github.com/SwiftyJSON/SwiftyJSON.git",
            requirement: .upToNextMajor(from: "4.0.0")
        ),
        .remote(
            url: "https://github.com/onevcat/Kingfisher.git",
            requirement: .upToNextMajor(from: "7.0.0")
        )
    ],
    dependencies: [
        .package(product: "SnapKit"),
        .package(product: "Then"),
        .package(product: "Alamofire"),
        .package(product: "SwiftyJSON"),
        .package(product: "Kingfisher")
    ]
)
