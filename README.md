# rxNetflixRoulette

rxNetflixRoulette is an example iOS app implemented using RxSwift which used the [NetflixRoulette API](https://netflixroulette.net/api/), but turned to use the [TMDb API]() after the first one closing. The application will retrieve details from a film given a title or an actor.

* Alamofire/RxAlamofire
* RxSwift / RxCocoa

I developed this application while trying to learn Functional Reactive Programming using RxSwift.

## MVVM Architecture

I used two variants of MVVM architecture. The one in the Master branch is not completely MVVM; it only uses raw Observables and the code is not quite decoupled. 

The one in the `withDrivers` branch is prettier (I think), using Drivers and binding. Please give me any comments you have about it; the main purpose of me developing this application is learning RxSwift.

Forget all branches but `tmdb`. It's the only one currently working.

## RxSwift resources

I learnt a lot from a variety of sources:

* [**RxSwift: Reactive Programming With Swift**](https://store.raywenderlich.com/products/rxswift). This book is wonderful. I just would love a ePub/iBooks version :)
* [**MVVM with RxSwift**](https://academy.realm.io/posts/slug-max-alexander-mvvm-rxswift/)
* [**MVVM design pattern and RxSwift**](http://lukagabric.com/mvvm-design-pattern-and-rxswift/)
* [**A practical MVVM example in Swift – Part 1**](http://candycode.io/a-practical-mvvm-example-in-swift-part-1/) & [**A practical MVVM example in Swift – Part 2 (featuring RxSwift)**](http://candycode.io/a-practical-mvvm-example-in-swift-part-2/)
