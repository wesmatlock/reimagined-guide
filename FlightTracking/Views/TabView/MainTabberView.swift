import SwiftUI

struct MainTabbarView: View {
    @State private var selectedTab: Int = 0

    var body: some View {
        TabView {
            EmptyView()
                .tabItem {
                    Image(systemName: "airplane")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                    Text("Flights")
                }
            EmptyView()
                .tabItem {
                    Image(systemName: "building")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                    Text("Airports")
                }
            EmptyView()
                .tabItem {
                    Image(systemName: "airplane")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                    Text("Aircraft")
                }
            EmptyView()
                .tabItem {
                    Image(systemName: "gear")
                        .environment(\.symbolVariants, selectedTab == 0 ? .fill : .none)
                    Text("Settings")
                }
        }
    }
}

#Preview {
    MainTabbarView()
}
