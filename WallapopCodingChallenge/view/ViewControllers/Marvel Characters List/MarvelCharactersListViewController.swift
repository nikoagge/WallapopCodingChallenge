//
//  MarvelCharactersListViewController.swift
//  WallapopCodingChallenge
//
//  Created by Nikos Aggelidis on 25/5/22.
//

import UIKit
import RxSwift
import RxCocoa

final class MarvelCharactersListViewController: UIViewController {
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero,
                                          collectionViewLayout: UICollectionViewFlowLayout())
        collection.showsVerticalScrollIndicator = false
        collection.showsHorizontalScrollIndicator = false
        collection.translatesAutoresizingMaskIntoConstraints = false
        collection.delegate = self
        collection.dataSource = self
        collection.register(MarvelCharacterCollectionViewCell.self,
                            forCellWithReuseIdentifier: MarvelCharacterCollectionViewCell.identifier)
        collection.backgroundColor = .clear
        collection.accessibilityLabel = "MarvelListCollectionView"
        
        return collection
    }()
    
    private var searchBarContainer: UIView?
    private var marvelCharactersListViewModelProtocol: MarvelCharactersListViewModelProtocol
    private let refreshControl = UIRefreshControl()
    private let disposeBag = DisposeBag()
    private var searchComponent: SearchBarComponent?
    
    init(with marvelCharactersListViewModelProtocol: MarvelCharactersListViewModelProtocol) {
        self.marvelCharactersListViewModelProtocol = marvelCharactersListViewModelProtocol
        
        super.init(nibName: nil, bundle: nil)
        
//        view.backgroundColor = .yellow
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        navigationController?.setNavigationBarHidden(true, animated: true)
        self.view.backgroundColor =  UIColor.background
        addSubviews()
        fetchMarvelCharacters()
    }
    
    private func addSubviews() {
        self.view.addSubview(collectionView)
        refreshControl.addTarget(self, action: #selector(didPullToRefresh(_:)), for: .valueChanged)
        collectionView.refreshControl = refreshControl
        setupSearchBar()
        setCollectionConstraints()
    }
    
    private func setupSearchBar() {
        let searchComponent = SearchBarComponent(frame: .zero)
        searchComponent.base.translatesAutoresizingMaskIntoConstraints = false
        searchComponent.placeholder = "Find your marvel character"
        view.addSubview(searchComponent.base)
        self.searchComponent = searchComponent
        setSearchViewConstraints(with: searchComponent.base)
        
        searchComponent.actions.text
            .subscribe(onNext: { [weak self] query in
                guard let self = self else { return }
                self.searchForCharacter(with: query)
            }).disposed(by: disposeBag)
        
        searchComponent.actions.didSearch
            .subscribe(onNext: { [weak self] query in
                guard let self = self else { return }
                self.searchForCharacter(with: query)
            }).disposed(by: disposeBag)
    }
    
    @objc
    private func didPullToRefresh(_ sender: Any) {
        fetchMarvelCharacters()
    }
    
    private func fetchMarvelCharacters() {
        self.marvelCharactersListViewModelProtocol.getAllMarvelCharacters()
            .subscribe(onNext: { [weak self] characters in
                guard let self = self else { return }
                self.marvelCharactersListViewModelProtocol.characters = characters
                self.refreshControl.endRefreshing()
                self.collectionView.reloadData()
            }, onError: { [weak self] error in
                UIViewController.showErrorAlert(with: self?.navigationController,
                                                message: error.localizedDescription)
            }).disposed(by: disposeBag)
    }
    
    private func searchForCharacter(with query: String) {
        if query.count >= marvelCharactersListViewModelProtocol.minimumChars {
            self.marvelCharactersListViewModelProtocol.searchMarvelCharacter(with: query)
                .subscribe(onNext: { [weak self] characters in
                    guard let self = self else { return }
                    self.marvelCharactersListViewModelProtocol.characters = characters
                    self.collectionView.reloadData()
                }, onError: { error in
                    
                }).disposed(by: disposeBag)
        }
    }
    
    private func setSearchViewConstraints(with view: UIView) {
        view.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 15).isActive = true
        view.trailingAnchor.constraint(equalTo: self.view.trailingAnchor, constant: -30).isActive = true
        view.leadingAnchor.constraint(equalTo: self.view.leadingAnchor, constant: 30).isActive = true
        view.heightAnchor.constraint(equalToConstant: 56).isActive = true
        view.widthAnchor.constraint(lessThanOrEqualTo: self.view.widthAnchor, multiplier: 1).isActive = true
        view.bottomAnchor.constraint(equalTo: collectionView.topAnchor, constant: -15).isActive = true
    }
    
    private func setCollectionConstraints() {
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -30).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 30).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -30).isActive = true
        collectionView.widthAnchor.constraint(lessThanOrEqualTo: view.widthAnchor, multiplier: 1).isActive = true
    }
}

// MARK: - Collection Datasource
extension MarvelCharactersListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return marvelCharactersListViewModelProtocol.characters.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MarvelCharacterCollectionViewCell.identifier,
                                                            for: indexPath) as? MarvelCharacterCollectionViewCell else {
            return UICollectionViewCell(frame: .zero)
        }
        cell.setupCell(with: marvelCharactersListViewModelProtocol.characters[indexPath.row])
        
        return cell
    }
}

// MARK: - Collection Delegate
extension MarvelCharactersListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView,
                        willDisplay cell: UICollectionViewCell,
                        forItemAt indexPath: IndexPath) {
        if indexPath.row == marvelCharactersListViewModelProtocol.characters.count - 1 &&
            marvelCharactersListViewModelProtocol.displayMode == .allCharacters {
            marvelCharactersListViewModelProtocol.fetchMarvelCharacters()
                .subscribe(onNext: { [weak self] characters in
                    guard let self = self else { return }
                    self.marvelCharactersListViewModelProtocol.characters.append(contentsOf: characters)
                    collectionView.performBatchUpdates({
                        collectionView.reloadSections([0])
                    })
                }).disposed(by: disposeBag)
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        marvelCharactersListViewModelProtocol.showDetailCharacter(with: marvelCharactersListViewModelProtocol.characters[indexPath.row], navigation: navigationController)
    }
}

// MARK: - Collection Flow Layout
extension MarvelCharactersListViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: 150)
    }
}
