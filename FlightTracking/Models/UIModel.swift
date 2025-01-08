import Observation
import SwiftUI

class UIModel: ObservableObject {
    @Published var selectedDetent: PresentationDetent = .height(200)
}
