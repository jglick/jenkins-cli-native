# Introduction

This is the official [Jenkins CLI](https://www.jenkins.io/doc/book/managing/cli/) packaged as a native executable using [GraalVM](https://www.graalvm.org/) for near-instant startup.

Unlike tools such as [`jenkins-zh/jenkins-cli`](https://github.com/jenkins-zh/jenkins-cli) the set of commands is extensible by Jenkins plugins
(mainly by the [`CLICommand`](https://www.jenkins.io/doc/developer/extensions/jenkins-core/#clicommand) extension point, though occasionally by [`@CLIMethod`](https://javadoc.jenkins.io/hudson/cli/declarative/class-use/CLIMethod.html)).

# Building

You will need a reasonably recent version of Docker.

```bash
make
./build/jenkins-cli -s https://my.jenkins/ -auth me:deadbeef1234 help
```
