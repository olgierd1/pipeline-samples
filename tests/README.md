# How to run unit tests in pipeline


```yaml
name: Tests
on: [push]
jobs:
  tests:
    runs-on: ubuntu-latest
    steps:
      - uses: actions/checkout@v2
      - uses: actions/setup-node@v2
        with:
          node-version: '14'

      - name: Cache dependencies
        uses: actions/cache@v2
        with:
          path: |
            **/node_modules
          key: ${{ runner.os }}-${{ hashFiles('**/package-lock.json') }}
          
      - name: Install packages
        run: npm ci
      
      - name: Run unit tests
        run: npm run test
```

# How to use database instance in pipeline:
https://docs.github.com/en/actions/using-containerized-services