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
    let imageBuffer = Data()

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
    
    func createClothing() {
        clothesVM.createClothing(name: "Nike", image: imageBuffer, type: .top, size: .medium, color: .black, weather: .warm, fabric: .cotton)
        clothesVM.createClothing(name: "Adidas Fav", image: imageBuffer, type: .bottom, size: .small, color: .green, weather: .cold, fabric: .cotton)
        clothesVM.createClothing(name: "Fav Shoes", image: imageBuffer, type: .shoes, size: .small, color: .white, weather: .warm, fabric: .other)
        clothesVM.createClothing(name: "Fancy Trousers", image: imageBuffer, type: .bottom, size: .medium, color: .blue, weather: .freezing, fabric: .leather)
    }
    
    func testCreateClothing() {
        
        createClothing()
        
        XCTAssert(clothesVM.clothesOnDisplay.count == 4)
        XCTAssert(clothesVM.userClothes.count == 4)

        let clothing = ClothingItem(name: "Fancy Trousers", type: .bottom, size: .medium, color: .blue, weather: .freezing, fabric: .leather, displayImage: imageBuffer)
        XCTAssertEqual(clothesVM.clothesOnDisplay.last!.name, clothing.name)
        XCTAssertEqual(clothesVM.clothesOnDisplay.last!.displayImage, clothing.displayImage)
    }
    
    func testRandomOutfit() {
        createClothing()
        let random = clothesVM.generateRandomOutfit(size: nil, color: .blue, weather: nil, fabric: .cotton)
        
        XCTAssertNotNil(random)
        XCTAssertNotNil(random?.0)
        XCTAssertNotNil(random?.1)
        XCTAssertNotNil(random?.2)
        XCTAssertNotNil(random?.3)

    }
    
    func testSearch() {
        createClothing()
        
        clothesVM.search(input: "Trouse")
        XCTAssertEqual(clothesVM.clothesOnDisplay[0], clothesVM.userClothes[3])
        
        clothesVM.search(input: "Adidas F")
        XCTAssertEqual(clothesVM.clothesOnDisplay[0], clothesVM.userClothes[1])
    }
    
    func testFilter() {
        createClothing()
        
        clothesVM.filterClothes(by: .init(type: .top, size: nil, color: .black, weather: nil, fabric: .cotton))
        XCTAssertEqual(clothesVM.clothesOnDisplay[0], clothesVM.userClothes[0])

        clothesVM.filterClothes(by: .init(type: .bottom, size: nil, color: nil, weather: nil, fabric: nil))
        
        XCTAssertEqual(clothesVM.clothesOnDisplay.count, 2)
        XCTAssertEqual(clothesVM.clothesOnDisplay[0], clothesVM.userClothes[1])
        XCTAssertEqual(clothesVM.clothesOnDisplay[1], clothesVM.userClothes[3])
    }
    

}
