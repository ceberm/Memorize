//
//  Pie.swift
//  Memorize
//
//  Created by Cesar on 3/4/21.
//

import SwiftUI

struct Pie: Shape {
    var startAngle: Angle
    var endAngle: Angle
    var clockwise: Bool = false

    func path(in rect: CGRect) -> Path {
        //rect is the space offered to it
        
        let center = CGPoint(x: rect.midX, y:  rect.midY)
        let radius = min(rect.width, rect.height) / 2
        let start = CGPoint(
            x: center.x + radius * cos(CGFloat(startAngle.radians)),
            y: center.y + radius * sin(CGFloat(endAngle.radians))
        )
        
        var p = Path()
        p.move(to: center)
        p.addLine(to: start)
        p.addArc(
         center: center,
         radius: radius,
         startAngle: startAngle,
         endAngle: endAngle,
         clockwise: clockwise
        )
        p.addLine(to: center)
        return p
    }
}
