# SwiftUI + MVVM + Clean Architecture + Unit Tests + Crypto Application


## Background
This repository is dedicated to my journey of learning Swift UI and sharing insights on building scalable, testable iOS applications. I've noticed that many tutorials fall short when it comes to handling large-scale apps effectively. My interest in the financial and digital wallet domain was sparked when I followed a YouTube tutorial to create a cryptocurrency portfolio tracking app. This repository serves as a platform to explore this domain, share knowledge, and address its unique challenges, all while mastering Swift UI and crafting robust iOS solutions.

## Problems
1. Dependency injection is crucial for scalability and testability. While avoiding it can simplify code, especially for small projects, it leads to tight coupling between classes and their dependencies, making code less adaptable and harder to maintain.

2. Regarding the network layer, the tutorial introduced a reusable network manager to reduce redundancy and enhance maintainability. In this repository, I aim to present a cleaner approach for writing network requests using a combination of structs, protocols, and extensions. This method enhances code readability and maintainability.

## Solutions
1. Dependency injection and the separation of layers are crucial principles for achieving a clear separation of concerns in software development. By organizing different layers, such as use cases, repositories, and network services, we can keep our codebase modular, facilitate testing, and enhance maintainability. These well-defined dependencies establish a structured flow of data and actions, bridging the gap between user interfaces and backend APIs or local data storage.

2. Regarding the network layer, I've introduced several protocols: HTTPRequestable, HTTPReply, and HTTPParam. These abstractions are designed to streamline the handling of network requests, minimizing boilerplate code and providing a structured approach to attributes like URLs, HTTP methods, responses, and parameters. This organization not only reduces redundancy but also enhances traceability within the codebase.

The project follows

- ``No external libraries``
- ``SOLID principles``
- ``Clean Architecture``
- ``MVVM Architecture``
- ``Use of Composition root``
- ``Factory Pattern``
- ``Repository Pattern``
- ``Use Cases``
- ``Combine + Result APIs``
- ``Dependency Injection``
- ``Unit tests``
- ``Test doubles: Use of Stubs, Spys and Mocks``
- ``Folder separation: Domain, Data, Presentation and Utilities``

## Disclaimer:

## References: 

[Building Scalable iOS Apps with Clean Architecture and MVVM (Part 1)](https://medium.com/@wadegraduate/building-scalable-ios-apps-with-clean-architecture-and-mvvm-part-1-38a3d142cf59)

[Building Scalable iOS Apps with Clean Architecture and MVVM (Part 2)](https://medium.com/@wadegraduate/building-scalable-ios-apps-with-clean-architecture-and-mvvm-part-2-c24ff24075c0)

[Build SwiftUI App with MVVM, Core Data, Combine, and API requests | SwiftUI Crypto App #0](https://youtu.be/TTYKL6CfbSs?si=pbv-6BSNSZ2YGTUB)
