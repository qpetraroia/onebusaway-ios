//
//  AgenciesWithCoverageModelOperation.swift
//  OBANetworkingKit
//
//  Created by Aaron Brethorst on 11/5/18.
//  Copyright © 2018 OneBusAway. All rights reserved.
//

import Foundation

public class AgenciesWithCoverageModelOperation: RESTModelOperation {
    public private(set) var agenciesWithCoverage = [AgencyWithCoverage]()

    override public func main() {
        super.main()
        agenciesWithCoverage = decodeModels(type: AgencyWithCoverage.self)
    }
}