import SwiftUI
import Observation

class UIModel: ObservableObject {
  @Published var selectedDetent: PresentationDetent = .height(200)
}
