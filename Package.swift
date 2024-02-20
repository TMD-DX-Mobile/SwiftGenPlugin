// swift-tools-version: 5.6
import PackageDescription

let package = Package(
  name: "SwiftGenPlugin",
  products: [
    .plugin(name: "SwiftGenPlugin", targets: ["SwiftGenPlugin"]),
    .plugin(name: "SwiftGen-Generate", targets: ["SwiftGen-Generate"])
  ],
  dependencies: [],
  targets: [
    .plugin(
      name: "SwiftGenPlugin",
      capability: .buildTool(),
      dependencies: ["swiftgen"]
    ),
    .plugin(
      name: "SwiftGen-Generate",
      capability: .command(
        intent: .custom(
          verb: "generate-code-for-resources",
          description: "Creates type-safe for all your resources"
        ),
        permissions: [
          .writeToPackageDirectory(reason: "This command generates source code")
        ]
      ),
      dependencies: ["swiftgen"]
    ),
    .binaryTarget(
      name: "swiftgen",
      // We use gitlab-dogen to avoid proxy protection from downloading rawcontent of github
      url: "https://gitlab-dogen.group.echonet/dm/bddf/ap26093/mchb_ios/artifacts/-/raw/master/swiftgen.artifactbundle.zip",
      checksum: "b29bc733208ca8348778264dd4547d169d7a349b3a6844dd8aaa06d1cb276a17"
    )
  ]
)
