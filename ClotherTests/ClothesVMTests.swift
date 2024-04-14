//
//  ClotherTests.swift
//  ClotherTests
//
//  Created by Abdulaziz Albahar on 4/12/24.
//
/*
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
        
    }
    
    
    func testOutfits() {
        testCreateClothing()
        
        let random1 = try? clothesVM.generateRandomOutfit(size: nil, color: .blue, weather: nil, fabric: .cotton)
        XCTAssertNotNil(random1)
        if let random1 {
            clothesVM.createOutfit(name: "RandomOutfit1", top: random1.0, bottom: random1.1, shoes: random1.2, other: random1.3)
        }
                
        let random2 = try? clothesVM.generateRandomOutfit(size: nil, color: nil, weather: nil, fabric: nil)
        XCTAssertNotNil(random2)
        if let random2 {
            clothesVM.createOutfit(name: "RandomOutfit2", top: random2.0, bottom: random2.1, shoes: random2.2, other: random2.3)
        }
        
        XCTAssertEqual(clothesVM.userOutfits[0].name, "RandomOutfit1")
        XCTAssertEqual(clothesVM.userOutfits[1].name, "RandomOutfit2")

    }
    
    func testCreateClothing() {
        
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
       
    func testSearch() {
        testCreateClothing()
        
        clothesVM.search(input: "Trouse")
        XCTAssertEqual(clothesVM.clothesOnDisplay[0], clothesVM.userClothes[3])
        
        clothesVM.search(input: "Adidas F")
        XCTAssertEqual(clothesVM.clothesOnDisplay[0], clothesVM.userClothes[1])
    }
    
    func testFilter() {
        testCreateClothing()
        
        clothesVM.filterClothes(by: .init(type: .top, size: nil, color: .black, weather: nil, fabric: .cotton))
        XCTAssertEqual(clothesVM.clothesOnDisplay[0], clothesVM.userClothes[0])
        
        clothesVM.filterClothes(by: .init(type: .bottom, size: nil, color: nil, weather: nil, fabric: nil))
        
        XCTAssertEqual(clothesVM.clothesOnDisplay.count, 2)
        XCTAssertEqual(clothesVM.clothesOnDisplay[0], clothesVM.userClothes[1])
        XCTAssertEqual(clothesVM.clothesOnDisplay[1], clothesVM.userClothes[3])
    }
    func testOutfitFilter() {
        testOutfits()
        
        clothesVM.filterOutfits(topFilter: .init(type: .top, size: nil, color: nil, weather: nil, fabric: nil)
                                , bottomFilter: .init(type: .bottom, size: nil, color: nil, weather: nil, fabric: .leather),
                                shoesFilter: .init(type: .shoes, size: nil, color: nil, weather: nil, fabric: nil))
        XCTAssertNotEqual(clothesVM.userOutfits.count, 0)
    }
}
*/
