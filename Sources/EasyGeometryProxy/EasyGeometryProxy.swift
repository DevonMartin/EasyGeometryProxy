// The Swift Programming Language
// https://docs.swift.org/swift-book

import SwiftUI

extension View {
	
	// MARK: - Size
	
	/// Provides a convenient method to access the size of the view when it appears.
	///
	/// - Parameter onAppear: A closure executed with the size of the view when it is first laid out.
	public func withViewSize(
		onAppear: @escaping (CGSize) -> ()
	) -> some View {
		modifier(WithViewGeometryProxy(
			onAppear: { onAppear($0.size) },
			onChangeSize: {_, _ in},
			onChangeInsets: {_, _ in})
		)
	}
	
	/// Provides a convenient method to access the size of the view when it appears and to perform an action when its size changes.
	///
	/// - Parameters:
	///   - onAppear: A closure executed with the size of the view when it is first laid out.
	///   - onChange: A closure executed when the size of the view changes.
	public func withViewSize(
		onAppear: @escaping (CGSize) -> (),
		onChange: @escaping (() -> ())
	) -> some View {
		modifier(WithViewGeometryProxy(
			onAppear: { onAppear($0.size) },
			onChangeSize: { _, _ in onChange() },
			onChangeInsets: {_, _ in})
		)
	}
	
	/// Provides a convenient method to access the size of the view both when it appears and when its size changes.
	///
	/// - Parameters:
	///   - onAppear: A closure executed with the size of the view when it is first laid out.
	///   - onChange: A closure executed with the old and new sizes of the view when its size changes.
	public func withViewSize(
		onAppear: @escaping (CGSize) -> (),
		onChange: @escaping ((CGSize, CGSize) -> ())
	) -> some View {
		modifier(WithViewGeometryProxy(
			onAppear: { onAppear($0.size) },
			onChangeSize: onChange,
			onChangeInsets: {_, _ in})
		)
	}
	
	// MARK: - Insets
	
	/// Provides a convenient method to access the safe area insets of the view when it appears.
	///
	/// - Parameter onAppear: A closure executed with the safe area insets of the view when it is first laid out.
	public func withViewInsets(
		onAppear: @escaping (EdgeInsets) -> ()
	) -> some View {
		modifier(WithViewGeometryProxy(
			onAppear: { onAppear($0.safeAreaInsets) },
			onChangeSize: {_, _ in},
			onChangeInsets: {_, _ in})
		)
	}
	
	/// Provides a convenient method to access the safe area insets of the view when it appears and to perform an action when its
	/// insets change.
	///
	/// - Parameters:
	///   - onAppear: A closure executed with the safe area insets of the view when it is first laid out.
	///   - onChange: A closure executed when the safe area insets of the view change.
	public func withViewInsets(
		onAppear: @escaping (EdgeInsets) -> (),
		onChange: @escaping (() -> ())
	) -> some View {
		modifier(WithViewGeometryProxy(
			onAppear: { onAppear($0.safeAreaInsets) },
			onChangeSize: {_, _ in},
			onChangeInsets: { _, _ in onChange() })
		)
	}
	
	/// Provides a convenient method to access the safe area insets of the view both when it appears and when its insets change.
	///
	/// - Parameters:
	///   - onAppear: A closure executed with the safe area insets of the view when it is first laid out.
	///   - onChange: A closure executed with the old and new safe area insets of the view when its insets change.
	public func withViewInsets(
		onAppear: @escaping (EdgeInsets) -> (),
		onChange: @escaping ((EdgeInsets, EdgeInsets) -> ())
	) -> some View {
		modifier(WithViewGeometryProxy(
			onAppear: { onAppear($0.safeAreaInsets) },
			onChangeSize: {_, _ in},
			onChangeInsets: onChange)
		)
	}
	
	// MARK: - Geometry Proxy
	
	/// Provides a convenient method to access the layout information of the view using a `GeometryReader` when it appears.
	///
	/// - Parameter onAppear: A closure executed with the layout information provided by the `GeometryReader` when the
	/// view is first laid out.
	public func withViewGeometryProxy(
		onAppear: @escaping (GeometryProxy) -> ()
	) -> some View {
		modifier(WithViewGeometryProxy(
			onAppear: onAppear,
			onChangeSize: {_, _ in},
			onChangeInsets: {_, _ in})
		)
	}
	
	/// Provides a convenient method to access the layout information of the view using a `GeometryReader` when it appears and
	/// to perform an action when its size changes.
	///
	/// - Parameters:
	///   - onAppear: A closure executed with the layout information provided by the `GeometryReader` when the view is first
	///   laid out.
	///   - onChangeSize: A closure executed when the size of the view changes.
	public func withViewGeometryProxy(
		onAppear: @escaping (GeometryProxy) -> (),
		onChangeSize: @escaping (() -> ())
	) -> some View {
		modifier(WithViewGeometryProxy(
			onAppear: onAppear,
			onChangeSize: { _, _ in onChangeSize() },
			onChangeInsets: {_, _ in})
		)
	}
	
	/// Provides a convenient method to access the layout information of the view using a `GeometryReader` both when it appears
	/// and when its size changes.
	///
	/// - Parameters:
	///   - onAppear: A closure executed with the layout information provided by the `GeometryReader` when the view is first
	///   laid out.
	///   - onChangeSize: A closure executed with the old and new sizes of the view when its size changes.
	public func withViewGeometryProxy(
		onAppear: @escaping (GeometryProxy) -> (),
		onChangeSize: @escaping ((CGSize, CGSize) -> ())
	) -> some View {
		modifier(WithViewGeometryProxy(
			onAppear: onAppear,
			onChangeSize: onChangeSize,
			onChangeInsets: {_, _ in})
		)
	}
	
	/// Provides a convenient method to access the layout information of the view using a `GeometryReader` when it appears
	/// and to perform an action when its safe area insets change.
	///
	/// - Parameters:
	///   - onAppear: A closure executed with the layout information provided by the `GeometryReader` when the view is first
	///   laid out.
	///   - onChangeInsets: A closure executed when the safe area insets of the view change.
	public func withViewGeometryProxy(
		onAppear: @escaping (GeometryProxy) -> (),
		onChangeInsets: @escaping (() -> ())
	) -> some View {
		modifier(WithViewGeometryProxy(
			onAppear: onAppear,
			onChangeSize: {_, _ in},
			onChangeInsets: { _, _ in onChangeInsets() })
		)
	}
	
	/// Provides a convenient method to access the layout information of the view using a `GeometryReader` when it appears,
	/// and to perform actions when its size or safe area insets change.
	///
	/// - Parameters:
	///   - onAppear: A closure executed with the layout information provided by the `GeometryReader` when the view is first
	///   laid out.
	///   - onChangeSize: A closure executed when the size of the view changes.
	///   - onChangeInsets: A closure executed when the safe area insets of the view change.
	public func withViewGeometryProxy(
		onAppear: @escaping (GeometryProxy) -> (),
		onChangeSize: @escaping (() -> ()),
		onChangeInsets: @escaping (() -> ())
	) -> some View {
		modifier(WithViewGeometryProxy(
			onAppear: onAppear,
			onChangeSize: { _, _ in onChangeSize() },
			onChangeInsets: { _, _ in onChangeInsets() })
		)
	}
	
	/// Provides a convenient method to access the layout information of the view using a `GeometryReader` when it appears, to
	/// perform an action when its size changes, offering both the old and new sizes, and to perform an action when its safe area
	/// insets change.
	///
	/// - Parameters:
	///   - onAppear: A closure executed with the layout information provided by the `GeometryReader` when the view is first
	///   laid out.
	///   - onChangeSize: A closure executed with the old and new sizes of the view when its size changes.
	///   - onChangeInsets: A closure executed when the safe area insets of the view change.
	public func withViewGeometryProxy(
		onAppear: @escaping (GeometryProxy) -> (),
		onChangeSize: @escaping ((CGSize, CGSize) -> ()),
		onChangeInsets: @escaping (() -> ())
	) -> some View {
		modifier(WithViewGeometryProxy(
			onAppear: onAppear,
			onChangeSize: onChangeSize,
			onChangeInsets: { _, _ in onChangeInsets() })
		)
	}
	
	/// Provides a convenient method to access the layout information of the view using a `GeometryReader` when it appears,
	/// and to perform an action when its safe area insets change, offering both the old and new insets.
	///
	/// - Parameters:
	///   - onAppear: A closure executed with the layout information provided by the `GeometryReader` when the view is first
	///   laid out.
	///   - onChangeInsets: A closure executed with the old and new safe area insets of the view when its insets change.
	public func withViewGeometryProxy(
		onAppear: @escaping (GeometryProxy) -> (),
		onChangeInsets: @escaping ((EdgeInsets, EdgeInsets) -> ())
	) -> some View {
		modifier(WithViewGeometryProxy(
			onAppear: onAppear,
			onChangeSize: {_, _ in},
			onChangeInsets: onChangeInsets)
		)
	}
	
	/// Provides a convenient method to access the layout information of the view using a `GeometryReader` when it appears, to
	/// perform an action when its size changes, and to perform an action when the safe area insets change, offering both the old and
	/// new insets.
	///
	/// - Parameters:
	///   - onAppear: A closure executed with the layout information provided by the `GeometryReader` when the view is first
	///   laid out.
	///   - onChangeSize: A closure executed when the size of the view changes.
	///   - onChangeInsets: A closure executed with the old and new safe area insets of the view when its insets change.
	public func withViewGeometryProxy(
		onAppear: @escaping (GeometryProxy) -> (),
		onChangeSize: @escaping (() -> ()),
		onChangeInsets: @escaping ((EdgeInsets, EdgeInsets) -> ())
	) -> some View {
		modifier(WithViewGeometryProxy(
			onAppear: onAppear,
			onChangeSize: { _, _ in onChangeSize() },
			onChangeInsets: onChangeInsets)
		)
	}
	
	/// Provides a convenient method to access the layout information of the view using a `GeometryReader` when it appears, and
	/// to perform an action when the size or insets change, offering both the old and new values.
	///
	/// - Parameters:
	///   - onAppear: A closure executed with the layout information provided by the `GeometryReader` when the view is first
	///   laid out.
	///   - onChangeSize: A closure executed with the old and new sizes of the view when its size changes.
	///   - onChangeInsets: A closure executed with the old and new safe area insets of the view when its insets change.
	public func withViewGeometryProxy(
		onAppear: @escaping (GeometryProxy) -> (),
		onChangeSize: @escaping ((CGSize, CGSize) -> ()),
		onChangeInsets: @escaping ((EdgeInsets, EdgeInsets) -> ())
	) -> some View {
		modifier(WithViewGeometryProxy(
			onAppear: onAppear,
			onChangeSize: onChangeSize,
			onChangeInsets: onChangeInsets)
		)
	}
}

// MARK: - View Modifier

/// A view modifier that provides enhanced access to the layout information of a view using a `GeometryReader`.
///
/// This modifier allows the calling view to obtain layout details through closures when the view appears, when its size changes, and
/// when its safe area insets change. It embeds a `GeometryReader` in the background of the view to capture and provide this
/// information.
///
/// - Note: This is a private utility modifier used in conjunction with the `withViewGeometryProxy` functions to provide
/// more granular control over the layout data of a view.
private struct WithViewGeometryProxy: ViewModifier {
	
	private let onAppear: (GeometryProxy) -> ()
	private let onChangeSize: ((CGSize, CGSize) -> ())
	private let onChangeInsets: ((EdgeInsets, EdgeInsets) -> ())
	
	init(
		onAppear: @escaping (GeometryProxy) -> (),
		onChangeSize: @escaping ((CGSize, CGSize) -> ()),
		onChangeInsets: @escaping ((EdgeInsets, EdgeInsets) -> ())
	) {
		self.onAppear = onAppear
		self.onChangeSize = onChangeSize
		self.onChangeInsets = onChangeInsets
	}
	
	func body(content: Content) -> some View {
		content
			.background {
				GeometryReader { proxy in
					Color.clear
						.onAppear {
							onAppear(proxy)
						}
						.onChange(of: proxy.size) { oldValue, newValue in
							onChangeSize(oldValue, newValue)
						}
						.onChange(of: proxy.safeAreaInsets) { oldValue, newValue in
							onChangeInsets(oldValue, newValue)
						}
				}
			}
	}
}
