workspace(name = "rules_gherkin")

load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")

git_repository(
    name = "com_github_nelhage_rules_boost",
    commit = "5cff96018ec4662cc61268cf248edfc6e6fe4635",
    remote = "https://github.com/nelhage/rules_boost",
    shallow_since = "1591047380 -0700",
)

load("@com_github_nelhage_rules_boost//:boost/boost.bzl", "boost_deps")

boost_deps()

git_repository(
    name = "gtest",
    commit = "703bd9caab50b139428cea1aaff9974ebee5742e",
    remote = "https://github.com/google/googletest",
)

git_repository(
    name = "com_grail_bazel_toolchain",
    commit = "f2d1ba2c9d713b2aa6e7063f6d11dd3d64aa402a",
    remote = "https://github.com/grailbio/bazel-toolchain.git",
)

load("@com_grail_bazel_toolchain//toolchain:deps.bzl", "bazel_toolchain_dependencies")

bazel_toolchain_dependencies()

load("@bazel_tools//tools/build_defs/repo:http.bzl", "http_archive")

# This sysroot is used by github.com/vsco/bazel-toolchains.
http_archive(
    name = "org_chromium_sysroot_linux_x64",
    build_file_content = """
filegroup(
  name = "sysroot",
  srcs = glob(["*/**"]),
  visibility = ["//visibility:public"],
)
""",
    sha256 = "84656a6df544ecef62169cfe3ab6e41bb4346a62d3ba2a045dc5a0a2ecea94a3",
    urls = ["https://commondatastorage.googleapis.com/chrome-linux-sysroot/toolchain/2202c161310ffde63729f29d27fe7bb24a0bc540/debian_stretch_amd64_sysroot.tar.xz"],
)

load("@com_grail_bazel_toolchain//toolchain:rules.bzl", "llvm_toolchain")

llvm_toolchain(
    name = "llvm_toolchain",
    llvm_version = "9.0.0",
    sysroot = {
        "linux": "@org_chromium_sysroot_linux_x64//:sysroot",
    },
)

load("@llvm_toolchain//:toolchains.bzl", "llvm_register_toolchains")

llvm_register_toolchains()

#———————————————————————————————————————————————————————————————————————
# To get the latest ruby rules, grab the 'develop' branch.
#———————————————————————————————————————————————————————————————————————

git_repository(
    name = "bazelruby_rules_ruby",
    branch = "master",
    remote = "https://github.com/bazelruby/rules_ruby.git",
)

load(
    "@bazelruby_rules_ruby//ruby:deps.bzl",
    "rules_ruby_dependencies",
    "rules_ruby_select_sdk",
)

rules_ruby_dependencies()

#———————————————————————————————————————————————————————————————————————
# Specify Ruby version — this will either build Ruby or use a local
# RBENV installation if the Ruby version matches.
#———————————————————————————————————————————————————————————————————————

load("@bazel_skylib//:workspace.bzl", "bazel_skylib_workspace")

bazel_skylib_workspace()

rules_ruby_select_sdk(version = "2.6.3")

#———————————————————————————————————————————————————————————————————————
# Now, load the ruby_bundle rule & install gems specified in the Gemfile
#———————————————————————————————————————————————————————————————————————

load(
    "@bazelruby_rules_ruby//ruby:defs.bzl",
    "ruby_bundle",
)

# You can specify more than one bundle in the WORKSPACE file
ruby_bundle(
    name = "cucumber",
    gemfile = "//:Gemfile",
    gemfile_lock = "//:Gemfile.lock",
)

git_repository(
    name = "cucumber_cpp",
    commit = "c94b370c67bcd5d27a84ca0aad686cf1703935a3",
    remote = "https://github.com/silvergasp/cucumber-cpp.git",
    shallow_since = "1610936570 +0800",
)
