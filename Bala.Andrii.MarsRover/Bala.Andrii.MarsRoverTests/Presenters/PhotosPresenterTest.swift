//
//  PhotosPresenterTest.swift
//  Bala.Andrii.MarsRoverTests
//
//  Created by Andrii Bala on 12/25/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import XCTest
@testable import Bala_Andrii_MarsRover

class PhotosPresenterTest: XCTestCase {
    
    let diplayPhotosUseCaseStub = DisplayPhotosUseCaseStub()
    let photosViewRouterSpy = PhotosViewRouterSpy()
    let photosViewSpy = PhotosViewSpy()
    
    var photosPresenter: PhotosPresenterImplementation!
    
    // MARK: - Set up
    
    override func setUp() {
        super.setUp()
        photosPresenter = PhotosPresenterImplementation(view: photosViewSpy,
                                                      displayPhotosUseCase: diplayPhotosUseCaseStub,
                                                      router: photosViewRouterSpy)
    }
    
    // MARK: - Tests
    
    func test_viewDidLoad_success_refreshPhotosView_called() {
        // Given
        let photosToBeReturned = Photo.createPhotosArray()
        diplayPhotosUseCaseStub.resultToBeReturned = .success(photosToBeReturned)
        
        // When
        photosPresenter.viewDidLoad()
        
        // Then
        XCTAssertTrue(photosViewSpy.refreshPhotosViewCalled, "refreshPhotosView was not called")
    }
    
    func test_viewDidLoad_failure_displayPhotosRetrievalError() {
        // Given
        let expectedErrorTitle = "Error"
        let expectedErrorMessage = "Some error message"
        let errorToBeReturned = NSError.createError(withMessage: expectedErrorMessage)
        diplayPhotosUseCaseStub.resultToBeReturned = .failure(errorToBeReturned)
        
        // When
        photosPresenter.viewDidLoad()
        
        // Then
        XCTAssertEqual(expectedErrorTitle, photosViewSpy.displayPhotosRetrievalErrorTitle, "Error title doesn't match")
        XCTAssertEqual(expectedErrorMessage, photosViewSpy.displayPhotosRetrievalErrorMessage, "Error message doesn't match")
    }
    
    func test_configureCell_has_data() {
        // Given
        photosPresenter.photos = Photo.createPhotosArray()
        let expectedDisplayedDate = "2015-05-30"
        let expectedDisplayedCamera = "Front Hazard Avoidance Camera"
        let expectedDisplayedImagePath = "http://mars.jpl.nasa.gov/msl-raw-images/proj/msl/redops/ods/surface/sol/01000/opgs/edr/fcam/FLB_486265257EDR_F0481570FHAZ00323M_.JPG"
        
        let photoCellViewSpy = PhotoCellViewSpy()
        
        // When
        photosPresenter.configure(cell: photoCellViewSpy, forRow: 0)
        
        // Then
        XCTAssertEqual(expectedDisplayedDate, photoCellViewSpy.displayedDate, "The date we expected was not displayed")
        XCTAssertEqual(expectedDisplayedCamera, photoCellViewSpy.displayedCamera, "The camera name we expected was not displayed")
        XCTAssertEqual(expectedDisplayedImagePath, photoCellViewSpy.displayedImagePath, "The photo we expected was not displayed")
    }
    
    func test_didSelect_navigates_to_details_view() {
        // Given
        let photos = Photo.createPhotosArray()
        let rowToSelect = 1
        photosPresenter.photos = photos
        
        // When
        photosPresenter.didSelect(row: rowToSelect)
        
        // Then
        XCTAssertEqual(photos[rowToSelect], photosViewRouterSpy.passedPhoto, "Expected navigate to details view to be called with photo at index 1")
    }
}
