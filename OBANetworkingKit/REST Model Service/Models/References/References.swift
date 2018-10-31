//
//  References.swift
//  OBANetworkingKit
//
//  Created by Aaron Brethorst on 10/20/18.
//  Copyright © 2018 OneBusAway. All rights reserved.
//

import Foundation

@objc(OBAReferences)
public class References: NSObject, Decodable {
    let agencies: [Agency]
    let routes: [Route]
    let situations: [Situation]
    let stops: [Stop]
    let trips: [Trip]

    private enum CodingKeys: String, CodingKey {
        case agencies, routes, situations, stops, trips
    }

    public required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)

        do {
            agencies = try container.decode([Agency].self, forKey: .agencies)
        } catch {
            agencies = []
            print("error decoding agencies: \(error)")
            throw error
        }

        do {
            routes = try container.decode([Route].self, forKey: .routes)
        } catch {
            routes = []
            print("error decoding routes: \(error)")
            throw error
        }

        do {
            situations = try container.decode([Situation].self, forKey: .situations)
        } catch {
            situations = []
            print("error decoding situations: \(error)")
            throw error
        }

        do {
            stops = try container.decode([Stop].self, forKey: .stops)
        } catch {
            stops = []
            print("error decoding stops: \(error)")
            throw error
        }

        do {
            trips = try container.decode([Trip].self, forKey: .trips)
        } catch {
            trips = []
            print("error decoding trips: \(error)")
            throw error
        }
    }

    public static func decodeReferences(_ data: [String: Any]) throws -> References {
        let decoder = DictionaryDecoder.restApiServiceDecoder()

        let references = try decoder.decode(References.self, from: data)

        return references
    }
}