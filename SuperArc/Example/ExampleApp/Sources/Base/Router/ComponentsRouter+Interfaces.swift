//
//  Copyright © 2019 An Tran. All rights reserved.
//

import SuperArcCoreComponent

extension NavigatorProtocol {

    var featureAInterface: FeatureAInterfaceProtocol {
        return interfaceRegistry.resolve(type: FeatureAInterfaceProtocol.self)
    }

    var featureBInterface: FeatureBInterfaceProtocol {
        return interfaceRegistry.resolve(type: FeatureBInterfaceProtocol.self)
    }

    var featureCInterface: FeatureCInterfaceProtocol {
        return interfaceRegistry.resolve(type: FeatureCInterfaceProtocol.self)
    }

    var featureDInterface: FeatureDInterfaceProtocol {
        return interfaceRegistry.resolve(type: FeatureDInterfaceProtocol.self)
    }

}
