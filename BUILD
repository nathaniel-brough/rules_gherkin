load(
    "@bazelruby_rules_ruby//ruby:defs.bzl",
    "ruby_binary",
)

ruby_binary(
    name = "cucumber_ruby",
    main = "@cucumber//:bin/cucumber",
    visibility = ["//visibility:public"],
    deps = ["@cucumber"],
)

exports_files(
    [
        "Gemfile.lock",
        "Gemfile",
    ],
    visibility = ["//visibility:public"],
)
