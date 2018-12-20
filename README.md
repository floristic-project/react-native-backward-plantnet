
# react-native-backward-plantnet

## Getting started

`$ npm install react-native-backward-plantnet --save`

or

`$ npm install git+https://github.com/floristic-project/react-native-backward-plantnet.git --save`

### Mostly automatic installation

`$ react-native link react-native-backward-plantnet`

### Manual installation

#### Android

1. Open up `android/app/src/main/java/[...]/MainActivity.java`
  - Add `import com.reactlibrary.RNBackwardPlantnetPackage;` to the imports at the top of the file
  - Add `new RNBackwardPlantnetPackage()` to the list returned by the `getPackages()` method
2. Append the following lines to `android/settings.gradle`:
  	```
  	include ':react-native-backward-plantnet'
  	project(':react-native-backward-plantnet').projectDir = new File(rootProject.projectDir, 	'../node_modules/react-native-backward-plantnet/android')
  	```
3. Insert the following lines inside the dependencies block in `android/app/build.gradle`:
  	```
      compile project(':react-native-backward-plantnet')
  	```

#### iOS

1. In XCode, in the project navigator, right click `Libraries` ➜ `Add Files to [your project's name]`
2. Go to `node_modules` ➜ `react-native-backward-plantnet` and add `RNBackwardPlantnet.xcodeproj`
3. In XCode, in the project navigator, select your project. Add `libRNBackwardPlantnet.a` to your project's `Build Phases` ➜ `Link Binary With Libraries`
4. Run your project (`Cmd+R`)<

## Usage
```javascript
import RNBackwardPlantnet from 'react-native-backward-plantnet';

/* ******* ******* ******* ******* ******* ******* *******
 * CALLBACK VERSION
 ******* ******* ******* ******* ******* ******* ******* */
 
RNBackwardPlantnet.loadExistingObservationsCallback(
(error) => {
	console.log(error);
},
(json) => {
	console.log(JSON.parse(json));
});

/* ******* ******* ******* ******* ******* ******* *******
 * PROMISE VERSION
 ******* ******* ******* ******* ******* ******* ******* */
 
 try {
  	const json = RNBackwardPlantnet.loadExistingObservationsPromise();
  	console.log(JSON.parse(json));
 } catch (error) {
 	console.log(error);
 }

//

RNBackwardPlantnet;
```
  