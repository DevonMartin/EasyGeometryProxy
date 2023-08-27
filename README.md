<br>

<h1 align=center>
EasyGeometryProxy
</h1>

<p align=center>
	A SwiftUI Package to easily access a view's size and inset information.
	<br>
	Rid your code of ugly GeometryReaders.
</p>

<p align=center>
	<a href="https://docs.swift.org/swift-book/documentation/the-swift-programming-language/">
		<img src="https://img.shields.io/badge/Swift_Compatability-5.9-4f4f4f?logo=swift&colorB=F05138" alt="Swift Version">
	</a>
    
	<a href="https://developer.apple.com/documentation/swiftui/view/onchange(of:initial:_:)-4psgg#">
		<img src="https://img.shields.io/badge/Platforms-iOS_|_macOS_|_visionOS-4f4f4f?logo=apple&colorB=ffffff" alt="Platforms">
	</a>
   
  <br/>
   
	<a href="https://www.reddit.com/u/DeanHodes/?utm_source=share&utm_medium=ios_app&utm_name=ioscss&utm_content=1&utm_term=1">
		<img src="https://img.shields.io/badge/Reddit-@DeanHodes-black?logo=reddit&colorA=ffffff&colorB=FF4500" alt="Reddit">
	</a>
   
	<a href="https://www.threads.net/@realdevonmartin">
		<img src="https://img.shields.io/badge/Threads-@realDevonMartin-4f4f4f?logo=threads&colorA=000000&&colorB=ffffff" alt="Threads">
	</a>
   
	<a href="#License">
		<img src="https://img.shields.io/badge/license-MIT-yellow)" alt="MIT License">
	</a>
</p>

```swift
import SwiftUI
import EasyGeometryProxy

struct ContentView: View {

    var body: some View {
        NavigationView {
            // ...
        }
        .withViewSize(onAppear: someFunction)
    }

}
```


<h2>Overview</h2>

`EasyGeometryProxy` is a Swift extension for SwiftUI's `View` type.
It offers a cleaner replacement to the traditional use of `GeometryReader` on a view's background, providing an elegant and straightforward way to access a view's size and safe area insets.

<h2>API</h2>

<h3>Three convenient functions:</h3>

- **Access Size**:
    - `withViewSize(onAppear:onChange:)`

- **Access Safe Area Insets**:
    - `withViewInsets(onAppear:onChange:)`

- **Access Both Size and Insets**:
    - `withViewGeometryProxy(onAppear:onChangeSize:onChangeInsets:)`

All functions are overloaded to support various parameter combinations, allowing you to access the data you need, when you need it. All `onChange` variants can be adjusted as follows:

- Omitted entirely.
- Defined with 0 parameters.
- Defined with 2 parameters.

EasyGeometryProxy utilizes iOS 17's new `onChange(of:initial:_:)` function.

## Usage

Working with your view's size has never been so clean.

### Examples:

**1. Accessing Safe Area Insets on Appearance**

**Before**:

```swift
.background {
    GeometryReader { proxy in
        Color.clear
            .onAppear {
                setBottomSafeArea(proxy.safeAreaInsets)
            }
    }
}
```

**After**:

```swift
.withViewInsets(onAppear: setBottomSafeArea)
```

**2. Accessing Both Size and Insets on Appearance and Change**

**Before**:

```swift
.background {
	GeometryReader { proxy in
		Color.clear
			.onAppear {
				someFunction(proxy)
			}
			.onChange(of: proxy.size, perform: someFunction)
			.onChange(of: proxy.safeAreaInsets, perform: someFunction)
	}
}
```

**After**:

```swift
.withViewGeometryProxy(
	onAppear: someFunction,
	onChangeSize: someFunction,
	onChangeInsets: someFunction
)
```

**3. Demonstrating Overloading with 0 or 2 Parameters**

**Explicit**

```swift
.withViewGeometryProxy { proxy in
	someFunction(proxy)
} onChangeSize: {
	/* 0 parameters */ 
	someFunction()
} onChangeInsets: { oldInsets, newInsets in
	/* 2 parameters */
	someFunction(oldInsets, newInsets)
}
```

**Implicit**

```swift
.withViewGeometryProxy(
	onAppear: someFunction,
	onChangeSize: someFunction, // 0 parameters
	onChangeInsets: someFunction // 2 parameters
)
```

## Installation

1. To use `EasyGeometryProxy`, in Xcode, navigate to: `File ➡ Add Package Dependencies`

2. In the top-right search bar, enter: `https://github.com/DevonMartin/EasyGeometryProxy`

3. Ensure your project is selected in the drop down `Add to Project` menu, and then click `Add Package`.

That's it! Then, in any file you want to access the package, simply `import EasyGeometryProxy`.

## License

The MIT License (MIT)
=====================

Copyright © 2023 Devon Martin

Permission is hereby granted, free of charge, to any person
obtaining a copy of this software and associated documentation
files (the “Software”), to deal in the Software without
restriction, including without limitation the rights to use,
copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the
Software is furnished to do so, subject to the following
conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED “AS IS”, WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES
OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT
HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY,
WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR
OTHER DEALINGS IN THE SOFTWARE.