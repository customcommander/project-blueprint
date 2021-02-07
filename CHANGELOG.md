# [1.6.0](https://github.com/customcommander/project-blueprint/compare/v1.5.0...v1.6.0) (2021-02-07)


### Features

* implement curry to experiment with the closure compiler ([7b11812](https://github.com/customcommander/project-blueprint/commit/7b118122d857f7be81c7f955a0fb1d0eb0bff832))

# [1.5.0](https://github.com/customcommander/project-blueprint/compare/v1.4.2...v1.5.0) (2021-02-06)


### Features

* add support for deprecation ([d7c1e19](https://github.com/customcommander/project-blueprint/commit/d7c1e19e2e5eb7123336b8119f507fb1c906a6bd))
* add support for description, parameters and return value ([47a642c](https://github.com/customcommander/project-blueprint/commit/47a642c38e5510e90a9cb345a8c9eed5a2a7dc5a))

## [1.4.2](https://github.com/customcommander/project-blueprint/compare/v1.4.1...v1.4.2) (2021-02-06)


### Bug Fixes

* deindent run command when building doc ([5693b06](https://github.com/customcommander/project-blueprint/commit/5693b06eb6b78be7a93b4444e656e64810bdebb7))

## [1.4.1](https://github.com/customcommander/project-blueprint/compare/v1.4.0...v1.4.1) (2021-02-06)


### Bug Fixes

* fix setup step on docs deployment ([7d8eff8](https://github.com/customcommander/project-blueprint/commit/7d8eff8d8d7c8dd9395234f4cd8ed2586e568a22))

# [1.4.0](https://github.com/customcommander/project-blueprint/compare/v1.3.0...v1.4.0) (2021-02-06)


### Features

* autogenerate docs using slate. basic support ([7794c98](https://github.com/customcommander/project-blueprint/commit/7794c9868ac4ea5ec51d2a50d3fbee684acbf361))

# [1.3.0](https://github.com/customcommander/project-blueprint/compare/v1.2.0...v1.3.0) (2021-02-05)


### Bug Fixes

* minify node distribution files ([cce2fa4](https://github.com/customcommander/project-blueprint/commit/cce2fa42cd1d4d0cdbedbfeaffcda7225efc622a))
* specify es2019 as input language when transpiling for browser ([224b183](https://github.com/customcommander/project-blueprint/commit/224b183f94758adbdf4083824d6ab067e4da32b7))


### Features

* add basic testing support ([821fffe](https://github.com/customcommander/project-blueprint/commit/821fffee40d14a5e7afeeb2a4d1b65c1a2f9b690))

# [1.2.0](https://github.com/customcommander/project-blueprint/compare/v1.1.0...v1.2.0) (2021-02-04)


### Bug Fixes

* pass secrets as env vars not as key=val pairs ([350eb76](https://github.com/customcommander/project-blueprint/commit/350eb769afc03fb97fda6c3ecebfbd3c8f7143dd))


### Features

* add new github workflow on pull requests ([473d0a9](https://github.com/customcommander/project-blueprint/commit/473d0a93f2e3f920e1ae70fb8f956eebf40889b3))
* use google closure compiler to produce a browser bundle ([ea36c05](https://github.com/customcommander/project-blueprint/commit/ea36c056eca56719ff484b432e633ba2f9f42452))

# [1.1.0](https://github.com/customcommander/project-blueprint/compare/v1.0.2...v1.1.0) (2021-02-01)


### Bug Fixes

* make sure vscode uses bash when working inside a container ([f32c728](https://github.com/customcommander/project-blueprint/commit/f32c728d8eb50062effac84e639d6d3ce20f4719))


### Features

* export symbols based on jsdoc annotations ([79af28f](https://github.com/customcommander/project-blueprint/commit/79af28f585bf923d479bf000f866ba8af9fe8cd6))

## [1.0.2](https://github.com/customcommander/project-blueprint/compare/v1.0.1...v1.0.2) (2021-01-28)


### Bug Fixes

* set public access in package.json to fix 402 npm error ([c18ec88](https://github.com/customcommander/project-blueprint/commit/c18ec888aedca7e58d477b367ea239dd1541f481))

## [1.0.1](https://github.com/customcommander/project-blueprint/compare/v1.0.0...v1.0.1) (2021-01-28)


### Bug Fixes

* pass env vars to docker container in gh workflow ([28be287](https://github.com/customcommander/project-blueprint/commit/28be287f35ec971fe77457a54a1c402bde054877))

# 1.0.0 (2021-01-28)


### Bug Fixes

* implement a basic build and release pipeline ([b1fa01f](https://github.com/customcommander/project-blueprint/commit/b1fa01f0212193e64529d7c9b2ef8b737b0a2c1a))
