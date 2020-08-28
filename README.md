# react-native-svipe-auth

Read MRTD

## Installation

```sh
npm install svipe/react-native-svipe-auth#master
```
## Usage

```js
import SvipeAuth from "react-native-svipe-auth";

// ...

const result = await SvipeAuth.scanDocument(4711); // Returns JSON
```


Check out the example as well.

```
$ npm install
$ cd example
$ npm install
$ cd ios;pod install; cd ..
$ react-native run-ios
```

Sometimes it is easier to open example/ios/SvipeAuthExample.xcworkspace in XCode instead and run it from there. You need to do this anyways in order to sign for device deployment.


## License

MIT
