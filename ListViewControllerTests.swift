//
//  ListViewControllerTests.swift
//  sepiaTests
//
//  Created by Kandula Anand kumar on 30/11/22.
//

import XCTest
@testable import sepia

final class ListViewControllerTests: XCTestCase {

    var viewControllerUnderTest: ListViewController!
    
    // MARK: - XCTestCase methods
        
    /// Sets up the `SolutionEditorViewControllerTests` unit test variables declared by this class.
    override func setUp() {
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewControllerUnderTest = storyboard.instantiateViewController(identifier: "ListViewController") as? ListViewController
    
       // viewControllerUnderTest.viewDidLoad()
    }
        /// Tears down the `SolutionEditorViewController` unit test variables declared by this class.
    override func tearDown() {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewControllerUnderTest = nil
    }
    func testGetData() {
        viewControllerUnderTest.getData()
    }
    func testShowAlert() {
        viewControllerUnderTest.showAlert()
    }
    func testDidSelectItem() {

        viewControllerUnderTest.tableView(viewControllerUnderTest.listTable, didSelectRowAt: IndexPath(row: 0, section: 0))
    }
}

