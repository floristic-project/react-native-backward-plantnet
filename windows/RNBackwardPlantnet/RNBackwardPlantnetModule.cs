using ReactNative.Bridge;
using System;
using System.Collections.Generic;
using Windows.ApplicationModel.Core;
using Windows.UI.Core;

namespace Backward.Plantnet.RNBackwardPlantnet
{
    /// <summary>
    /// A module that allows JS to share data.
    /// </summary>
    class RNBackwardPlantnetModule : NativeModuleBase
    {
        /// <summary>
        /// Instantiates the <see cref="RNBackwardPlantnetModule"/>.
        /// </summary>
        internal RNBackwardPlantnetModule()
        {

        }

        /// <summary>
        /// The name of the native module.
        /// </summary>
        public override string Name
        {
            get
            {
                return "RNBackwardPlantnet";
            }
        }
    }
}
