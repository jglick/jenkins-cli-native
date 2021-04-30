# Introduction

This is the official [Jenkins CLI](https://www.jenkins.io/doc/book/managing/cli/) packaged as a native executable using Graal for near-instant startup.

Unlike tools such as [`jenkins-zh/jenkins-cli`](https://github.com/jenkins-zh/jenkins-cli) the set of commands is extensible by Jenkins plugins
(mainly by the [`CLICommand`](https://www.jenkins.io/doc/developer/extensions/jenkins-core/#clicommand) extension point).

# Building

You will need a reasonably recent version of Docker.

```bash
make
./jenkins/cli -s https://my.jenkins/ -auth me:deadbeef1234 help
```
