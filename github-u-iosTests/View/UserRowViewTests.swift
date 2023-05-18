//
//  UserRowViewTests.swift
//  github-u-iosTests
//
//  Created by Claudio Smith on 18/05/23.
//

import XCTest
import SwiftUI
import SnapshotTesting

@testable import github_u_ios

final class UserRowViewTests: XCTestCase {
    
    var controller: UIViewController!

    override func setUpWithError() throws {
        
        isRecording = false
        let view = UserRowView(viewdata: .viewdata)
        controller = UIHostingController(rootView: view)
    }

    override func tearDownWithError() throws {
      try super.tearDownWithError()
      controller = nil
    }
    
    func testScreenShotUserRow() throws {
        assertSnapshot(matching: controller, as: .image)
    }

}
