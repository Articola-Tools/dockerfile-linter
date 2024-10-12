# Articola Tools' Dockerfile linter

[![image size](https://ghcr-badge.egpl.dev/articola-tools/dockerfile-linter/size?color=dodgerblue)](https://ghcr-badge.egpl.dev/articola-tools/dockerfile-linter/size?color=dodgerblue)

This repo contains Dockerfile with preconfigured [Dockerfile linter](https://github.com/hadolint/hadolint?tab=readme-ov-file#rules).
This linter is used in Articola Tools organization's repositories to lint Dockerfile files like
other linters.

## Usage

Use `ghcr.io/articola-tools/dockerfile-linter` Docker image with `-v ./:/linter_workdir/repo`
parameter, where `./` - is a path to a folder with files you want to lint.

Example command to use this linter -
`docker run --rm -v ./:/linter_workdir/repo ghcr.io/articola-tools/dockerfile-linter`
