load(
    "@bazelruby_rules_ruby//ruby:deps.bzl",
    "rules_ruby_dependencies",
    "rules_ruby_select_sdk",
)
load(
    "@bazelruby_rules_ruby//ruby:defs.bzl",
    "ruby_bundle",
)
load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")
load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")
load("@rules_pkg//:deps.bzl", "rules_pkg_dependencies")

def gherkin_workspace():
    rules_pkg_dependencies()
    boost_deps()
    rules_ruby_dependencies()
    bazel_skylib_workspace()
    rules_ruby_select_sdk(version = "2.6.3")
    ruby_bundle(
        name = "cucumber",
        gemfile = "@rules_gherkin//:Gemfile",
        gemfile_lock = "@rules_gherkin//:Gemfile.lock",
    )
