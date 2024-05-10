import SwiftUI

final class UIModel: ObservableObject {
  @Published var selectedDetent: PresentationDetent = .height(200)
}
