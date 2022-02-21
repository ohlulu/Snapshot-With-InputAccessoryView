//
//  Copyright © 2022 Pinkoi. All rights reserved.
//

import XCTest
@testable import InputAccessory_Snapshot_Case

class InputAccessory_Snapshot_CaseTests: XCTestCase {

    func test() {
        let sut = ViewController()
        sut.loadViewIfNeeded()
        sut.inputBar.textView.becomeFirstResponder()
        
        record(snapshot: sut.snapshot(for: .iPhone8()), named: "i8")
        record(snapshot: sut.snapshot(for: .iPhone13()), named: "i13")
    }
}
