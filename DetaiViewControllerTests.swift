//
//  DetaiViewControllerTests.swift
//  sepiaTests
//
//  Created by Kandula Anand kumar on 30/11/22.
//

import XCTest
@testable import sepia
final class DetaiViewControllerTests: XCTestCase {

    var viewControllerUnderTest: DetailViewController!
    
    // MARK: - XCTestCase methods
        
    /// Sets up the `SolutionEditorViewControllerTests` unit test variables declared by this class.
    override func setUp() {
    
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
            viewControllerUnderTest = storyboard.instantiateViewController(identifier: "DetailViewController") as? DetailViewController
    
        viewControllerUnderTest.viewDidLoad()
    }
        /// Tears down the `SolutionEditorViewController` unit test variables declared by this class.
    override func tearDown() {
            // Put teardown code here. This method is called after the invocation of each test method in the class.
        viewControllerUnderTest = nil
    }
    
}
