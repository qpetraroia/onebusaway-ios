//
//  Theme.swift
//  OBAKit
//
//  Created by Aaron Brethorst on 11/25/18.
//  Copyright © 2018 OneBusAway. All rights reserved.
//

import UIKit

public class Theme: NSObject {
    public let colors: ThemeColors
    public let metrics: ThemeMetrics
    public let behaviors: ThemeBehaviors

    public init(bundle: Bundle?, traitCollection: UITraitCollection?) {
        colors = ThemeColors(bundle: bundle ?? Bundle(for: Theme.self), traitCollection: traitCollection)
        metrics = ThemeMetrics()
        behaviors = ThemeBehaviors()
    }
}

public class ThemeMetrics: NSObject {

    public static let padding: CGFloat = 8.0

    public static let compactPadding: CGFloat = 4.0

    public static let ultraCompactPadding: CGFloat = 2.0

    public static let controllerMargin: CGFloat = 20.0

    public static let defaultMapAnnotationSize: CGFloat = 48.0

    public static let cornerRadius: CGFloat = 8.0

    public static let tableHeaderTopPadding: CGFloat = 20.0

    public static let floatingPanelTopInset: CGFloat = 7.0

    public static let compactTopBottomEdgeInsets = NSDirectionalEdgeInsets(top: 4.0, leading: 0, bottom: -4.0, trailing: 0)

    public static let collectionViewLayoutMargins = NSDirectionalEdgeInsets(top: 0, leading: padding, bottom: 0, trailing: padding)
}

public class ThemeColors: NSObject {

    /// Primary theme color.
    public let primary: UIColor

    /// Light text color, used on dark backgrounds.
    public let lightText: UIColor

    /// A gray text color, used on light backgrounds for de-emphasized text.
    public let secondaryLabel: UIColor

    /// A dark gray text color, used on maps.
    public let mapText: UIColor

    /// Tint color for map annotation views representing stops.
    public let stopAnnotationIcon: UIColor

    /// The color used to represent early departures.
    public let departureEarly: UIColor

    /// The color used to represent late departures.
    public let departureLate: UIColor

    /// The color used to represent on-time departures.
    public let departureOnTime: UIColor

    /// The color used to represent departures with an unknown status. (i.e. We don't know if they are early/late/on-time.)
    public let departureUnknown: UIColor

    /// The color used to highlight changing properties in the UI.
    public let propertyChanged: UIColor

    /// The background color of a grouped table.
    public let groupedTableBackground: UIColor

    /// The background color of a row in a grouped table.
    public let groupedTableRowBackground: UIColor

    /// The system background color. Works with Dark Mode in iOS 13 and above.
    public let systemBackground: UIColor

    /// A gray color; useful for de-emphasized UI elements.
    public let gray: UIColor

    public let mapStroke: UIColor

    public let label: UIColor

    public let separator: UIColor

    public let highlightedBackgroundColor: UIColor

    public let secondaryBackgroundColor: UIColor

    public static let shared = ThemeColors()

    public override convenience init() {
        self.init(bundle: Bundle(for: type(of: self)), traitCollection: nil)
    }

    public init(bundle: Bundle, traitCollection: UITraitCollection?) {
        primary = UIColor(named: "primary", in: bundle, compatibleWith: traitCollection)!
        lightText = UIColor(named: "lightText", in: bundle, compatibleWith: traitCollection)!
        stopAnnotationIcon = .white

        if #available(iOS 13, *) {
            departureEarly = .systemRed
            departureOnTime = .systemGreen
            departureUnknown = .label
            departureLate = .systemBlue
            gray = .systemGray
            groupedTableBackground = .systemGroupedBackground
            groupedTableRowBackground = .white
            systemBackground = .systemBackground
            mapText = .label
            label = .label
            secondaryLabel = .secondaryLabel
            separator = .separator
            highlightedBackgroundColor = .systemFill
            secondaryBackgroundColor = .secondarySystemBackground
            propertyChanged = .systemYellow
            mapStroke = .black
        }
        else {
            departureEarly = UIColor(hex: "fc3f3b")!
            departureOnTime = UIColor(hex: "16771a")!
            departureUnknown = .black
            departureLate = UIColor(hex: "0082f8")!
            gray = .gray
            groupedTableBackground = .groupTableViewBackground
            groupedTableRowBackground = .white
            systemBackground = .white
            mapText = UIColor(r: 42, g: 44, b: 47)
            label = .black
            secondaryLabel = .darkGray
            separator = UIColor(red: 200 / 255.0, green: 199 / 255.0, blue: 204 / 255.0, alpha: 1)
            highlightedBackgroundColor = UIColor(white: 0.9, alpha: 1)
            secondaryBackgroundColor = UIColor(white: 0.9, alpha: 1)
            propertyChanged = UIColor(r: 255, g: 255, b: 128)
            mapStroke = .black
        }
    }
}

public class ThemeBehaviors: NSObject {
    /// When true, the app will use floating panels in lieu of a tabbed UI.
    public let useFloatingPanelNavigation = false

    /// When true, tapping on a map annotation will show a callout.
    ///
    /// - Note: This behavior may be overriden by other features, like VoiceOver.
    ///         Because of how annotation selection works when VoiceOver is on,
    ///         it doesn't make any sense to display map callouts in that mode.
    public let mapShowsCallouts = true
}
