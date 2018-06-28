package(
    licenses = ["reciprocal"],  # Eclipse Public License - v 1.0
    default_visibility = ["//jre:__subpackages__"]
)

load("//build_defs:rules.bzl", "j2cl_library")

j2cl_library(
    name = "junit_emul",
    srcs = glob(["**/*.java"]),
    visibility = ["//:__pkg__"],
)
