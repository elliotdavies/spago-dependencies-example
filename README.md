# spago-dependencies-example
>Example repo to recreate an issue with Spago dependencies

This repo mimics the kind of setup you might see in a monorepo, where a single `packages.dhall` is used to register all the libraries in the monorepo and the individual libraries have their own `spago.dhall` files. (`spago-deps.dhall` files are used to avoid circular dependencies, since each `spago.dhall` imports `packages.dhall` and that in turn imports the dependencies for each library.)

This setup works fine for packages that don't import other local dependencies. For example, `cd monorepo/package-b` && `npx spago build` works fine because `package-b` only depends on remote packages.

However `cd monorepo/package-a` && `npx spago build` will fail because `package-a` depends on `package-b`. The error is `purs compile: No files found using pattern: ./package-b/src/**/*.purs` and consequently `Module B was not found`.

The problem may be that Spago is picking up `"./package-b"` (the second argument to `mkPackage`) from `packages.dhall` and passing it straight to the compiler without taking into account that `packages.dhall` is in another directory.
