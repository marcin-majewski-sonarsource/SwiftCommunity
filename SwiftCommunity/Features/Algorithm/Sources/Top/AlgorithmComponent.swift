//
//  Copyright © 2019 An Tran. All rights reserved.
//

import Core
import DataModels
import SuperArcCoreComponent
import SuperArcCoreUI
import SuperArcCore
import SuperArcFoundation
import UIKit

// MARK: - AlgorithmComponent

public class AlgorithmComponent: Component<AlgorithmDependency, AlgorithmViewBuilder, EmptyInterface, EmptyComponentRoute>, AlgorithmViewBuilder {

    public var unownedViewBuilder: UnownedWrapper<AlgorithmComponent> {
        return UnownedWrapper(self)
    }

    lazy var algorithmService: AlgorithmService = {
        let repositoryURL = try! dependency.serviceContext.configurations.container.resolve(GitRepositoryConfigurationProtocol.self).algorithmRepositoryURL
        return AlgorithmService(context: dependency.serviceContext, remoteRepositoryURL: repositoryURL, conferencesGitService: dependency.conferencesGitService)
    }()

    // MARK: APIs

    public func makeContentViewController(with builder: UnownedWrapper<AlgorithmComponent>?) -> UIViewController {
        return makeContentViewController(forSection: nil, with: builder)
    }

    public func makeContentViewController(forSection sectionID: String?, with builder: UnownedWrapper<AlgorithmComponent>?) -> UIViewController {
        let viewController = ContentTableViewController.instantiate(with: viewControllerContext)
        viewController.builder = builder
        viewController.sectionID = sectionID
        viewController.viewModel = ContentTableViewModel(algorithmService: algorithmService)
        return viewController
    }
}

// MARK: - AlgorithmViewBuilder

public protocol AlgorithmViewBuilder: ViewBuildable {
    func makeContentViewController(forSection sectionID: String?, with builder: UnownedWrapper<AlgorithmComponent>?) -> UIViewController
}
