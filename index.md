![bazel_cucumber](https://github.com/silvergasp/rules_gherkin/blob/main/doc/imgs/bazel_cucumber.png)
# Rules Gherkin
A set of bazel rules for BDD with [cucumber/gherkin](https://cucumber.io/).

NOTE: This is alpha level software, the API may change without notice

## Getting started
Add the following to your WORKSPACE

``` python
load("@bazel_tools//tools/build_defs/repo:git.bzl", "git_repository")
git_repository(
    name = "rules_gherkin",
    commit = "COMMIT", # Update this to match latest commit
    remote = "https://github.com/silvergasp/rules_gherkin.git"
)
load("@rules_gherkin//:gherkin_deps.bzl","gherkin_deps")
gherkin_deps()

load("@rules_gherkin//:gherkin_workspace.bzl","gherkin_workspace")
gherkin_workspace()
```
Example BUILD file.

```python
load("//gherkin:defs.bzl", "gherkin_library", "gherkin_test")

gherkin_library(
    name = "feature_specs",
    srcs = glob(["**/*.feature"]),
)

gherkin_test(
    name = "calc_test",
    steps = ":calculator_steps",
    deps = [":feature_specs"],
)

load("//gherkin:defs.bzl", "cc_gherkin_steps")

cc_gherkin_steps(
    name = "calculator_steps",
    srcs = [
        "CalculatorSteps.cpp",
    ],
    visibility = ["//visibility:public"],
    deps = [
        "//examples/Calc/src:calculator",
        "@cucumber_cpp//src:cucumber_main",
        "@gtest",
    ],
)


```

<!-- Generated with Stardoc: http://skydoc.bazel.build -->

<a name="#gherkin_library"></a>

## gherkin_library

<pre>
gherkin_library(<a href="#gherkin_library-name">name</a>, <a href="#gherkin_library-deps">deps</a>, <a href="#gherkin_library-srcs">srcs</a>)
</pre>



**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :-------------: | :-------------: | :-------------: | :-------------: | :-------------: |
| name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| deps |  A list of other gherkin_library scenarios to include   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | optional | [] |
| srcs |  Gherkin feature specifications   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | optional | [] |


<a name="#gherkin_test"></a>

## gherkin_test

<pre>
gherkin_test(<a href="#gherkin_test-name">name</a>, <a href="#gherkin_test-deps">deps</a>, <a href="#gherkin_test-steps">steps</a>)
</pre>



**ATTRIBUTES**


| Name  | Description | Type | Mandatory | Default |
| :-------------: | :-------------: | :-------------: | :-------------: | :-------------: |
| name |  A unique name for this target.   | <a href="https://bazel.build/docs/build-ref.html#name">Name</a> | required |  |
| deps |  A list of gherkin_library definitions   | <a href="https://bazel.build/docs/build-ref.html#labels">List of labels</a> | optional | [] |
| steps |  The steps implementation to test the gherkin features against   | <a href="https://bazel.build/docs/build-ref.html#labels">Label</a> | optional | None |


<a name="#cc_gherkin_steps"></a>

## cc_gherkin_steps

<pre>
cc_gherkin_steps(<a href="#cc_gherkin_steps-attrs">attrs</a>)
</pre>

 cc_gherkin_steps The steps implementation for a set of gherkin features

Wraps cc_binary with cucumber context https://docs.bazel.build/versions/master/be/c-cpp.html#cc_binary


**PARAMETERS**


| Name  | Description | Default Value |
| :-------------: | :-------------: | :-------------: |
| attrs |  Rule attributes   |  none |




## Attribution
Big thank you to 'Paolo Ambrosio', who authored the [cucumber-cpp](https://github.com/cucumber/cucumber-cpp) from whom I copied and modified the //examples directory in this repository. The examples/LICENCE.txt has been added to reflect the origins of the example.


