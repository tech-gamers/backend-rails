[![Ruby](https://github.com/robturtle/backend/workflows/Ruby/badge.svg)](https://github.com/robturtle/backend/actions?query=workflow%3ARuby)
[![code style: prettier](https://img.shields.io/badge/code_style-prettier-ff69b4.svg?style=flat-square)](https://github.com/prettier/prettier)

# backend

I will test all fancy shits here.

## Setup

1. initialization
   ```
   git clone git@github.com:robturtle/backend.git
   cd backend
   ./scripts/setup.sh
   ```
2. edit ./.github/workflows/dokku.yml and update vars

### How to deploy?

Create a GitHub release, it will automatically trigger the deploy procedure.

## Scaffolding

All scaffolding related code should follows the procedure as below:

1. make PR with base directed to `scaffold`
2. squash and merge
3. `master` cherr-pick that squashed commit from `scaffold` branch
