# How to notify slack channel about failed pipeline:
```yml
name: Notify failed pipeline
on: [push]
jobs:
  linter:
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
      
      - name: Run eslint
        run: npm run lint


  notify_failed_pipeline:
    if: failure()
    needs: [linter]
    runs-on: ubuntu-latest
    steps:
      - name: Slack Notification
        uses: rtCamp/action-slack-notify@v2
        env:
          SLACK_WEBHOOK: ${{ secrets.SLACK_WEBHOOK }}
```