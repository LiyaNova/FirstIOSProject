//
//  PhotosViewController.swift
//  Navigation
//
//  Created by Юлия Филимонова on 25.04.2022.
//

import UIKit

class PhotosViewController: UIViewController {

    private let photoGallery:[PhotoGallery] = PhotoGallery.makeCell()

    private let screenView: UIView = {
        let screenView = UIView()
        screenView.translatesAutoresizingMaskIntoConstraints = false
        screenView.backgroundColor = .black
        screenView.alpha = 0.0
        return screenView
    }()

    private lazy var crossImageView: UIImageView = {
        let crossImageView = UIImageView()
        crossImageView.translatesAutoresizingMaskIntoConstraints = false
        crossImageView.isUserInteractionEnabled = true
        crossImageView.image = UIImage(systemName: "multiply")
        crossImageView.tintColor = .white
        crossImageView.alpha = 0.0
        let tapCrossGesture = UITapGestureRecognizer(target: self, action: #selector(tapCrossAction))
        crossImageView.addGestureRecognizer(tapCrossGesture)
        return crossImageView
    }()

    @objc private func tapCrossAction() {
        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.3) {
                self.navigationController?.isNavigationBarHidden = false
                self.crossImageView.alpha = 0.0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.3, relativeDuration: 0.5) {
                self.photoImageView.alpha = 0.0
                self.screenView.alpha = 0.0
            }
        }
    }

    private lazy var photoImageView: UIImageView = {
        let photoImageView = UIImageView()
        photoImageView.contentMode = .scaleAspectFill
        photoImageView.clipsToBounds = true
        photoImageView.translatesAutoresizingMaskIntoConstraints = false
        return photoImageView
    }()


    private lazy var collection: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        let collection = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.dataSource = self
        collection.delegate = self
        collection.register(PhotosCollectionViewCell.self, forCellWithReuseIdentifier: PhotosCollectionViewCell.identifier)
        return collection
    }()

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.navigationBar.isHidden = false
        navigationController?.navigationBar.tintColor = UIColor.blueTheme
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        navigationItem.title = "Photo Gallery"
        layout()
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.navigationBar.isHidden = true
    }

    private func layout() {
        [collection, screenView, photoImageView, crossImageView].forEach {view.addSubview($0)}

        NSLayoutConstraint.activate([
            collection.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            collection.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            collection.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            collection.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),

            screenView.widthAnchor.constraint(equalToConstant: UIScreen.main.bounds.width),
            screenView.topAnchor.constraint(equalTo: collection.topAnchor),
            screenView.bottomAnchor.constraint(equalTo: collection.bottomAnchor),

            photoImageView.centerXAnchor.constraint(equalTo:screenView.centerXAnchor),
            photoImageView.centerYAnchor.constraint(equalTo: screenView.centerYAnchor),
            photoImageView.widthAnchor.constraint(equalTo: screenView.widthAnchor),
            photoImageView.heightAnchor.constraint(equalTo: screenView.widthAnchor),

            crossImageView.bottomAnchor.constraint(equalTo: photoImageView.topAnchor),
            crossImageView.trailingAnchor.constraint(equalTo: screenView.trailingAnchor)
        ])
    }

}

// MARK: - UICollectionViewDataSource

extension PhotosViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        photoGallery.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotosCollectionViewCell.identifier, for: indexPath) as! PhotosCollectionViewCell
        cell.setupCell(photoGallery[indexPath.item])
        return cell
    }
}

// MARK: - UICollectionViewDelegateFlowLayout

extension PhotosViewController: UICollectionViewDelegateFlowLayout {
    private var sideInset: CGFloat { return 8 }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collection.bounds.width - sideInset * 4 )/3
        return CGSize(width: width, height: width)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }

    func  collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        sideInset
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        UIEdgeInsets(top: sideInset, left: sideInset, bottom: sideInset, right: sideInset)
    }

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        photoImageView.image = photoGallery[indexPath.item].photo

        UIView.animateKeyframes(withDuration: 0.8, delay: 0) {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 0.5) {
                self.navigationController?.isNavigationBarHidden = true
                self.screenView.alpha = 0.7
                self.photoImageView.alpha = 1.0
            }
            UIView.addKeyframe(withRelativeStartTime: 0.5, relativeDuration: 0.3) {
                self.crossImageView.alpha = 1.0
            }
            
        }
    }
}
