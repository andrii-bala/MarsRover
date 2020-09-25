//
//  PhotosPresenter.swift
//  Bala.Andrii.MarsRover
//
//  Created by Andrii Bala on 12/24/18.
//  Copyright © 2018 iThinkers. All rights reserved.
//

import Foundation
import Alamofire
import SVProgressHUD

protocol PhotosView: class {
    func refreshPhotosView()
    func displayPhotosRetrievalError(title: String, message: String)
}

protocol PhotoCellView {
    func display(imagePath: String)
    func display(date: String)
    func display(camera: String)
}

protocol PhotosPresenter {
    var numberOfPhotos: Int { get }
    var router: PhotosViewRouter { get }
    func viewDidLoad()
    func configure(cell: PhotoCellView, forRow row: Int)
    func didSelect(row: Int)
    func collectionViewLayout() -> CGSize
}

class PhotosPresenterImplementation: PhotosPresenter {
    
    fileprivate weak var view: PhotosView?
    fileprivate let displayPhotosUseCase: DisplayPhotosUseCase
    internal let router: PhotosViewRouter
    
    var photos = [Photo]()
    
    var numberOfPhotos: Int {
        return photos.count
    }
    
    init(view: PhotosView,
         displayPhotosUseCase: DisplayPhotosUseCase,
         router: PhotosViewRouter) {
        self.view = view
        self.displayPhotosUseCase = displayPhotosUseCase
        self.router = router
    }
    
    // MARK: - PhotosPresenter
    
    func viewDidLoad() {
        SVProgressHUD.show()
        self.displayPhotosUseCase.displayPhotos { (result) in
            SVProgressHUD.dismiss()
            switch result {
            case let .success(photos):
                self.handlePhotosReceived(photos)
            case let .failure(error):
                self.handlePhotosError(error)
            }
        }
    }
    
    func configure(cell: PhotoCellView, forRow row: Int) {
        let photo = photos[row]
        
        cell.display(imagePath: photo.imgSrc)
        cell.display(date: photo.earthDate)
        cell.display(camera: photo.camera.fullName)
    }
    
    func didSelect(row: Int) {
        let photo = photos[row]
        
        router.presentDetailsView(for: photo)
    }
    
    func collectionViewLayout() -> CGSize {
        return CGSize(width: UIScreen.width - 20, height: 90)
    }
    
    // MARK: - Private
    
    fileprivate func handlePhotosReceived(_ photos: [Photo]) {
        self.photos = photos
        view?.refreshPhotosView()
    }
    
    fileprivate func handlePhotosError(_ error: Error) {
        view?.displayPhotosRetrievalError(title: "Error", message: error.localizedDescription)
    }
}
