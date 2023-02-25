
# Origin UI - Domain
This package is where lives the domain related code for the Origin UI. The goal separating it from the ui code is :
1. Clear separation between the UI and the bussiness logic/api. 
2. Easy to change the domain if necessary. Since the UI only knows the use cases, it's much easier to update or change the domain.
3. The package can be reused in other projects.
---
## Architecture

The package architecture is inspired on the Clean Architecture. And follows these layers:

UseCases (returns the entity) → Repository (bussiness logic) → DataSource (returns the model)

---

## Running tests

To run all unit tests make sure you are under /domain and then use the following command:

```sh
$ flutter test --coverage --test-randomize-ordering-seed random
```

To view the generated coverage report you can use [lcov](https://github.com/linux-test-project/lcov).

```sh
# Generate Coverage Report
$ genhtml /domain/coverage/lcov.info -o coverage/

# Open Coverage Report
$ open /domain/coverage/index.html
```
