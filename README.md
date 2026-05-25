# homebrew-mockwave

[Homebrew](https://brew.sh) tap for [Mockwave](https://github.com/lfdubiela/mockwave) — an open-source multi-protocol mock server (HTTP, GraphQL, SOAP, gRPC).

## Install

```bash
brew tap lfdubiela/mockwave
brew install mockwave
```

## Upgrade

```bash
brew upgrade mockwave
```

## Usage

```bash
# Start with a JSON config file
mockwave start -f config.json

# Check version
mockwave version
```

For full documentation, see the [Mockwave README](https://github.com/lfdubiela/mockwave#readme).

## Formula update

The formula is updated automatically when a new version of Mockwave is tagged. A GitHub Actions workflow in [lfdubiela/mockwave](https://github.com/lfdubiela/mockwave) builds the binaries, uploads them to the GitHub Release, and opens a PR on this repo with the updated SHA256 checksums.
