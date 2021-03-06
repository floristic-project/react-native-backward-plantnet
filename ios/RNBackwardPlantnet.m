
#import "RNBackwardPlantnet.h"
#import <React/RCTLog.h>

/*
 * Your class must also include the RCT_EXPORT_MODULE() macro. This takes an
 * optional argument that specifies the name that the module will be accessible
 * as in your JavaScript code (more on this later). If you do not specify a
 * name, the JavaScript module name will match the Objective-C class name.
 * If the Objective-C class name begins with RCT, the JavaScript module name
 * will exclude the RCT prefix.
 */

@implementation RNBackwardPlantnet

/*
 * The native module should not have any assumptions about what thread it is
 * being called on. React Native invokes native modules methods on a separate
 * serial GCD queue, but this is an implementation detail and might change.
 * The - (dispatch_queue_t)methodQueue method allows the native module to
 * specify which queue its methods should be run on. For example, if it needs
 * to use a main-thread-only iOS API, it should specify this via:
 * return dispatch_get_main_queue();
 *
 * Similarly, if an operation may take a long time to complete, the native
 * module should not block and can specify it's own queue to run operations on.
 *
 * The specified methodQueue will be shared by all of the methods in your
 * module. If just one of your methods is long-running (or needs to be run on
 * a different queue than the others for some reason), you can use
 * dispatch_async inside the method to perform that particular method's code
 * on another queue, without affecting the others.
 */

- (dispatch_queue_t)methodQueue {
    // return dispatch_get_main_queue();
	return dispatch_queue_create("com.floristicreactbackwardlibrary.RNBackwardPlantnet", DISPATCH_QUEUE_SERIAL);
}
RCT_EXPORT_MODULE() // default: "RNBackwardPlantnet"
// RCT_EXPORT_MODULE(RNBackwardPlantnet); // custom

/*
 * RCT_EXPORT_METHOD supports all standard JSON object types, such as:
 *
 *    string (NSString)
 *    number (NSInteger, float, double, CGFloat, NSNumber)
 *    boolean (BOOL, NSNumber)
 *    array (NSArray) of any types from this list
 *    object (NSDictionary) with string keys and values of any type from this list
 *    function (RCTResponseSenderBlock)
 *
 * But it also works with any type that is supported by the RCTConvert class
 * (see RCTConvert for details). The RCTConvert helper functions all accept a
 * JSON value as input and map it to a native Objective-C type or class.
 */

/*
 * A native module can export constants that are immediately available to
 * JavaScript at runtime. This is useful for communicating static data that
 * would otherwise require a round-trip through the bridge.
 */

 - (NSDictionary *)constantsToExport {
	return @{
		//@"key": @"value"
	};
}

/*
 * Native modules also supports a special kind of argument- a callback.
 * In most cases it is used to provide the function call result to JavaScript.
 *
 * RCTResponseSenderBlock accepts only one argument - an array of parameters
 * to pass to the JavaScript callback. In this case we use Node's convention
 * to make the first parameter an error object (usually null when there is no
 * error) and the rest are the results of the function.
 *
 * A native module should invoke its callback exactly once. It's okay to store
 * the callback and invoke it later. This pattern is often used to wrap iOS
 * APIs that require delegates - see RCTAlertManager for an example. If the
 * callback is never invoked, some memory is leaked. If both onSuccess and
 * onFail callbacks are passed, you should only invoke one of them.
 *
 * If you want to pass error-like objects to JavaScript, use RCTMakeError from
 * RCTUtils.h. Right now this just passes an Error-shaped dictionary to
 * JavaScript, but we would like to automatically generate real JavaScript
 * Error objects in the future.
 *
 * Native modules can also fulfill a promise, which can simplify your code,
 * especially when using ES2016's async/await syntax. When the last parameters
 * of a bridged native method are an RCTPromiseResolveBlock and
 * RCTPromiseRejectBlock, its corresponding JS method will return a JS Promise
 * object.
 */

 RCT_EXPORT_METHOD(loadExistingObservationsCallback:(RCTResponseSenderBlock)errorCallback
 				successCallback:(RCTResponseSenderBlock)successCallback) {
	/*[self
		loadExistingObservations:errorCallback
		successCallback:successCallback
		resolve: NSNull
		reject: NSNull
	]*/
	successCallback(@[@"", [NSNull null]]);
 }

 RCT_EXPORT_METHOD(loadExistingObservationsPromise:(RCTPromiseResolveBlock)resolve
 				reject:(RCTPromiseRejectBlock)reject) {
	/*[self
		loadExistingObservations:NSNull
		successCallback:NSNull
		resolve: resolve
		reject: reject
	]*/
	resolve(@"");
}

/*- (void)loadExistingObservations:(RCTResponseSenderBlock)errorCallback
 				successCallback:(RCTResponseSenderBlock)successCallback
				resolve:(RCTPromiseResolveBlock)resolve
				reject:(RCTPromiseRejectBlock)reject {
	// NSMutableArray *requests = [[NSMutableArray alloc] init];
	// [NSMutableArray arrayWithArray:[
	// 	PLNRequest
	// 	MR_findByAttribute:@"isWaiting"
	// 	withValue:@"0"
	// 	andOrderBy:@"date"
	// 	ascending:NO
	// ]];

	if (successCallback != NSNull) {
		successCallback(@[@"", [NSNull null]]);
	}

	if (resolve != NSNull) {
		resolve(@"");
	}
}*/

@end
