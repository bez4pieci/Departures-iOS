//
//  DepartureRowOld.swift
//  Departures
//
//  Created by Ernests Karlsons on 25.05.25.
//

import SwiftData
import SwiftUI
import TripKit

//struct DepartureRowOld: View {
//    let departure: Departure
//
//    var body: some View {
//        HStack(spacing: 10) {
//            // Line
//            HStack() {
//                Text(departure.line.label ?? "")
//                    .padding(.horizontal, 6)
//                    .padding(.vertical, 2)
//                    .font(Font.custom("DepartureMono-Regular", size: 16))
//                    .background(Color(hex: departure.line.style?.backgroundColor ?? 0x808080))
//                    .foregroundColor(Color(hex: departure.line.style?.foregroundColor ?? 0x000000))
//                    .cornerRadius(departure.line.style?.shape == .rounded ? 4 : departure.line.style?.shape == .circle ? 100 : 0)
//                Spacer()
//            }
//            .frame(width: 50)
//
//            // Destination
//            Text(departure.destination?.name ?? "")
//                .font(.system(size: 20))
//                .foregroundColor(.white)
//                .strikethrough(departure.cancelled)
//                .lineLimit(1)
//                .frame(maxWidth: .infinity, alignment: .leading)
//
//            // Time
//            Text(timeString)
//                .font(.system(size: 20))
//                .foregroundColor(departureColor)
//                .strikethrough(departure.cancelled)
//        }
//        .padding(.horizontal, 20)
//        .padding(.vertical, 12)
//    }
//
//    private var timeString: String {
//        if let predictedTime = departure.predictedTime {
//            return formatTime(predictedTime)
//        }
//        return formatTime(departure.plannedTime)
//    }
//
//    private var departureColor: Color {
//        if departure.cancelled {
//            return .red.opacity(0.5)
//        } else if let predictedTime = departure.predictedTime,
//                  predictedTime > departure.plannedTime {
//            return .red
//        }
//        return .green
//    }
//
//}
