# Change Log

## [0.5.0] - 2024-12-14

Maintenance release.

### Fixed
- Fix "defined in application" runtime warnings ([@alexgleason](https://github.com/alexgleason))
- Remove unused @requred_keys ([@alexgleason](https://github.com/alexgleason))
- Fix duplicate keys warnings ([@alexgleason](https://github.com/alexgleason))

### Chore

- Upgrade dev dependencies
- Remove empty config file
- Regenerate formatter config and gitignore with the latest Elixir
- Fix CI workflow

## [0.4.1] - 2021-01-14
### Fixed
- Call the youtube oembed with https ([@fatboypunk](https://github.com/fatboypunk))

## [0.4.0] - 2020-07-21
### Added
- Add Youtube provider ([@Kuret](https://github.com/Kuret))

## [0.3.0] - 2019-03-27
### Added
- Add Vimeo provider ([@fatboypunk](https://github.com/fatboypunk))

## [0.2.2] - 2018-09-11
### Fixed
- Fix link selector for Discoverable provider

## [0.2.1] - 2017-11-02
### Fixed
- Fix handling of relative endpoint urls ([@slavone](https://github.com/slavone))

## [0.2.0] - 2017-09-13
### Added
- Ability to add custom providers via mix config in parent application ([@slavone](https://github.com/slavone))

### Fixed
- Encode Instagram photo URL in API request.

## [0.1.1] - 2017-03-08
### Fixed
- Fix crashing when URL is empty or nil. 

## [0.1.0] - 2017-02-25

Initial release.
