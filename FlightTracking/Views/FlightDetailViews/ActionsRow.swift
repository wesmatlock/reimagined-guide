import SwiftUI

struct ActionsRow: View {
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Button {} label: {
                    Label("Live Share", systemImage: "square.and.arrow.up")
                        .padding(.vertical, 2)
                        .padding(.horizontal, 5)
                }
                .fontDesign(.rounded)
                .fontWeight(.semibold)
                .buttonStyle(.borderedProminent)
                .buttonBorderShape(.capsule)

                Button {} label: {
                    Label("My Flight", systemImage: "person.fill")
                }
                .fontDesign(.rounded)
                .fontWeight(.regular)
                .buttonStyle(StrokedCapsule())
                .buttonBorderShape(.capsule)

                Button {} label: {
                    Label("Alternatives", systemImage: "arrow.triangle.2.circlepath")
                }
                .fontDesign(.rounded)
                .fontWeight(.regular)
                .buttonStyle(StrokedCapsule())
                .buttonBorderShape(.capsule)

                Button {} label: {
                    Label("Live Activity", systemImage: "bolt.fill")
                }
                .fontDesign(.rounded)
                .fontWeight(.regular)
                .buttonStyle(StrokedCapsule())
                .buttonBorderShape(.capsule)

                Button {} label: {
                    Label("More", systemImage: "ellipsis")
                }
                .fontDesign(.rounded)
                .fontWeight(.regular)
                .buttonStyle(StrokedCapsule())
                .buttonBorderShape(.capsule)
            }
        }
        .contentMargins(.leading, 12)
        .scrollClipDisabled()
    }
}

#Preview {
    ActionsRow()
}
