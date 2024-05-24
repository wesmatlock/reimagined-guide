import SwiftUI
import Observation

@Observable
final class UIModel {
  var selectedDetent: PresentationDetent = .height(200)
}
