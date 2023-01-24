//
//  RegionProvider.swift
//  OBAKit
//
//  Created by Alan Chu on 1/23/23.
//

import OBAKitCore

protocol RegionProvider {
    var regions: [Region] { get }
    var currentRegion: Region? { get }

    func refreshRegions() async throws

    /// A ``currentRegion`` setter that is `async throws`.
    func setCurrentRegion(to newRegion: Region) async throws
}
