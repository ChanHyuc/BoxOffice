@testable import BoxOffice
import XCTest

final class BoxOfficeTests: XCTestCase {
    func testResponseParsing() throws {
        var response: Response?
        
        let decoder = JSONDecoder()
        if let dataAsset = NSDataAsset(name: "box_office_sample") {
            do {
                response = try decoder.decode(Response.self, from: dataAsset.data)
                print(" \(response)")
            } catch {

            }
        }

        
        XCTAssertEqual(response?.boxOfficeResult.boxofficeType, "일별 박스오피스")
        XCTAssertEqual(response?.boxOfficeResult.showRange, "20220105~20220105")

        let firstMovie = response?.boxOfficeResult.dailyBoxOfficeList.first
        XCTAssertNotNil(firstMovie)
        XCTAssertEqual(firstMovie?.movieNm, "경관의 피")
        XCTAssertEqual(firstMovie?.rank, "1")
        XCTAssertEqual(firstMovie?.salesAmt, "584559330")
        XCTAssertEqual(firstMovie?.audiCnt, "64050")
    }
    
}
