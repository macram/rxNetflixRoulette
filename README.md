# rxNetflixRoulette

rxNetflixRoulette is an example iOS app implemented using RxSwift which uses the [NetflixRoulette API](https://netflixroulette.net/api/). The application will retrieve details from a film given a title.

* Alamofire/RxAlamofire
* RxSwift / RxCocoa

I developed this application while trying to learn Functional Reactive Programming using RxSwift.

## MVVM Architecture

I used two variants of MVVM architecture. The one in the Master branch is not completely MVVM; it only uses raw Observables and the code is not quite decoupled. 

The one in the _withDrivers_ branch is prettier (I think), using Drivers and binding. Please give me any comments you have about it; the main purpose of me developing this application is learning RxSwift.

## RxSwift resources

I learnt a lot from a variety of sources:

* [**RxSwift: Reactive Programming With Swift**](https://store.raywenderlich.com/products/rxswift). This book is wonderful. I just would love a ePub/iBooks version :)
* [**MVVM with RxSwift**](https://academy.realm.io/posts/slug-max-alexander-mvvm-rxswift/)
* [**MVVM design pattern and RxSwift**](http://lukagabric.com/mvvm-design-pattern-and-rxswift/)
* [**A practical MVVM example in Swift – Part 1**](http://candycode.io/a-practical-mvvm-example-in-swift-part-1/) & [**A practical MVVM example in Swift – Part 2 (featuring RxSwift)**](http://candycode.io/a-practical-mvvm-example-in-swift-part-2/)
