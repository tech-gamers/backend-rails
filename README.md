[![Ruby](https://github.com/robturtle/backend/workflows/Ruby/badge.svg)](https://github.com/robturtle/backend/actions?query=workflow%3ARuby)

# backend-rails

This is a **scaffold** to boost your speed on your new projects. It's a bundle of best practices for developing and it consists **a lot of** automations.

## Features

### Run checks before your every git commit

Powered by `overcommit`, whenever you try to create a new git commit, it will run several checks to ensure that your code is in a good state.

Example:

```shell
$ git commit -m 'Add some ruby file'
Running pre-commit hooks
Check for "token" strings.....................................[FixMe] OK
Run SolargraphTypeCheck.........................[SolargraphTypeCheck] OK
Run Prettier...............................................[Prettier] OK
Run Rubocop.................................................[Rubocop] OK

✓ All pre-commit hooks passed

Running commit-msg hooks
Check text width..........................................[TextWidth] OK

✓ All commit-msg hooks passed
```

### Continuous Integration

Powered by `GitHub Actions`, we can run `CI/CD` inside the GitHub. Yes we no longer have to setup a separate CI service anymore!

Whenever **a commit is pushed** to the GitHub or whenever **a PR is created**, the CI will run.

### Continuous Deployment

Right now it was configured with Dokku. The reason for choosing Dokku is because it's really super easy to install and super fast to deploy. You can setup a new Dokku server through DigitalOcean.

Whenever **a new release** is created the deployment will run.

### Dockerized developing environment

To develop, the only thing you need to install is the `Docker`. To start a developing environment, after the setup, you simply run `docker-compose run --build`.

### Debug your dockerized server from outside using VS Code!

Right now the developing server is configured in `debugging` mode, which means the web server will only start when you entered the DEBUG mode inside the VS Code.

To debug your server, simply add some breakpoints, and run a new debug session. _Wait for several seconds_ for the web server to start up. Then goto `localhost:3000` and play around with the web app.

![image](https://user-images.githubusercontent.com/3524125/87491835-ff5e7680-c5fd-11ea-9c19-5e915d2563fc.png)

## Setup

### install Ruby Version Manager

I recommend you to install Ruby with a version manager. My top recommendation is [asdf-vm](https://asdf-vm.com/#/), but you can also use a traditional manager like `rbenv`.

Let's take `asdf` as example, the installation steps will be:

```
brew install coreutils curl git postgresql yarn
brew install asdf
echo '. $HOME/.asdf/asdf.sh' >> ~/.bashrc
echo '. $HOME/.asdf/asdf.sh' >> ~/.zshrc # in case you are using ZSH
. $HOME/.asdf/asdf.sh
```

Now `asdf` will be installed. You can check by:

```shell
$ which asdf
/Users/$USER/.asdf/bin/asdf
```

We will install ruby after the repo was cloned.

### clone repo & install packages

```
git clone https://github.com/tech-gamers/backend-rails.git
cd backend-rails
asdf plugin add ruby
asdf install
```

Now verify that the ruby's version matches with `.tool-versions`:

```shell
$ cat .tool-versions
ruby 2.6.6

$ ruby --version
SHOULD MATCH THE VERSION
```

After ruby is installed, we can install packages & tools:

```
bundle install
yarn install --check-files
./scripts/setup.sh
```

To verify the tools are setup correctly, run `bin/overcommit -r`:

```shell
$ bin/overcommit -r
Running pre-commit hooks
Check for "token" strings.....................................[FixMe] OK
Run SolargraphTypeCheck.........................[SolargraphTypeCheck] OK
Run Prettier...............................................[Prettier] OK
Run Rubocop.................................................[Rubocop] OK

✓ All pre-commit hooks passed

Running commit-msg hooks
Check text width..........................................[TextWidth] OK

✓ All commit-msg hooks passed
```

If you only see no errors then it means your tools are installed properly.

### configure deployment server

If you wish to deploy the repo to a dokku server, just go to `./.github/workflows/dokku.yml` and update the variables to point to your own server.
