import SwiftData
import SwiftUI
import TripKit

struct StationsList: View {
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss

    let searchResults: [SuggestedLocation]
    let maxResults: Int?
    let onSelect: ((Location) -> Void)?

    init(
        searchResults: [SuggestedLocation], maxResults: Int? = nil,
        onSelect: ((Location) -> Void)? = nil
    ) {
        self.searchResults = searchResults
        self.maxResults = maxResults
        self.onSelect = onSelect
    }

    var body: some View {
        LazyVStack(spacing: 0) {
            let results =
                maxResults != nil ? Array(searchResults.prefix(maxResults!)) : searchResults
            ForEach(Array(results.enumerated()), id: \.offset) {
                index, suggestedLocation in
                stationRow(suggestedLocation.location)
                if index < results.count - 1 {
                    DefaultDivider()
                }
            }
        }
    }

    private func stationRow(_ location: Location) -> some View {
        Button(action: {
            if let onSelect = onSelect {
                onSelect(location)
            }
        }) {
            HStack {
                VStack(alignment: .leading, spacing: 4) {
                    Text(location.getUniqueShortName())
                        .font(Font.dNormal)
                        .foregroundColor(Color.dDefault)

                    if let products = location.products, !products.isEmpty {
                        HStack(spacing: 4) {
                            ForEach(Array(products.enumerated()), id: \.element) { index, product in
                                HStack(spacing: 0) {
                                    Text(product.shortLabel)
                                    if index < products.count - 1 {
                                        Text(",")
                                    }
                                }
                                .font(Font.dSmall)
                                .foregroundColor(Color.dLight)
                            }
                        }
                    }
                }
                Spacer()
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 20)
            .background(Color.white)
            .contentShape(Rectangle())
        }
        .buttonStyle(PlainButtonStyle())
    }
}
