//
//  Project.swift
//  ProjectDescriptionHelpers
//
//  Created by BEYun on 2023/04/14.
//

import ProjectDescription
import ProjectDescriptionHelpers

let project = Project.makeModule(
    name: "TuistApp",
    platform: .iOS,
    product: .app,
    packages: [],
    dependencies: [
        .project(target: "ThirdPartyLibrary", path: .relativeToRoot("TuistProject/ThirdPartyLibrary"))
    ],
    resources: ["Resources/**"],
    infoPlist: .file(path: "Support/Info.plist")
)
