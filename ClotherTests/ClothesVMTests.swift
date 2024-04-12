//
//  ClotherTests.swift
//  ClotherTests
//
//  Created by Abdulaziz Albahar on 4/12/24.
//

@testable import Clother
import XCTest

final class ClothesVMTests: XCTestCase {
    
    var clothesVM: ClothesViewModel!

    override func setUp() {
        super.setUp()
        self.clothesVM = ClothesViewModel()
    }
    
    override func tearDown() {
        self.clothesVM = nil
        super.tearDown()
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testCreateClothing() {
        let imageBuffer = Data()
        
        clothesVM.createClothing(name: "Nike", image: imageBuffer, type: .top, size: .medium, color: .black, weather: .warm, fabric: .cotton)
        clothesVM.createClothing(name: "Adidas Fav", image: imageBuffer, type: .bottom, size: .small, color: .green, weather: .cold, fabric: .cotton)
        clothesVM.createClothing(name: "Fav Shoes", image: imageBuffer, type: .shoes, size: .small, color: .white, weather: .warm, fabric: .other)
        clothesVM.createClothing(name: "Fancy Trousers", image: imageBuffer, type: .bottom, size: .medium, color: .blue, weather: .freezing, fabric: .leather)
        
        XCTAssert(clothesVM.clothesOnDisplay.count == 4)
        XCTAssert(clothesVM.userClothes.count == 4)

        let clothing = ClothingItem(name: "Fancy Trousers", type: .bottom, size: .medium, color: .blue, weather: .freezing, fabric: .leather, displayImage: imageBuffer)
        XCTAssertEqual(clothesVM.clothesOnDisplay.last!.name, clothing.name)
        XCTAssertEqual(clothesVM.clothesOnDisplay.last!.displayImage, clothing.displayImage)
    }
    
    func testRandomOutfit() {
        let random = clothesVM.generateRandomOutfit(size: nil, color: .blue, weather: nil, fabric: .cotton)
        
        XCTAssertNotNil(random)
        XCTAssertNotNil(random?.0)
        XCTAssertNotNil(random?.1)
        XCTAssertNotNil(random?.2)
        XCTAssertNotNil(random?.3)

    }
    
    

}
