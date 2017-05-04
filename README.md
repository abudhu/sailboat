# ⛵ Sailboat

Sailboat automatically generates a map of a DigitalOcean environment, making it
easier for individuals to re-create their environments.  Further, Sailboat
can create an Autoscaling groups for use in DigitalOcean loadbalancers.

> [Installation](#installation) |
  [Usage](#usage) |
  [Examples](#examples)

## Installation

#### Option 1: Download the Installer Bash Script and execute:

  ```bash
  wget https://github.com/abudhu/sailboat/installer.sh
  ./installer.sh
  ```

#### Option 2: Build from Source

```bash
git clone https://github.com/abudhu/sailboat/ && cd sailboat
crystal build src/guardian.cr --release
```
> **Note:** You will need to add `sailboat` to your systems PATH

## Usage

> [Getting Started](#getting-started) |
  [Commands](#commands) |
  [Configure](#configure) |
  [Map](#map)  |
  [Create](#create) |
  [Delete](#delete) |
  [Fleet](#fleet)

## Getting Started
After installing Sailboat you will need to configure a default profile.  To do this run:

```bash
sailboat configure
```

You will be prompted with a Greeting.  You will need to enter a DigitalOcean API Token.

```bash
⛵ Welcome aboard! Lets setup your default profile.
Digital Ocean Token: <DIGITAL_OCEAN_TOKEN>
```
> **Note:** This will set the `default` Profile.  To add named profiles, please see the [Configure](#configure) section for more details.


## Commands

### Configure
Configures Sailboats default or named profiles.  These profiles can be used with other commands to query different DigitalOcean accounts

### Map
Generates a JSON map of an existing DigitaOcean environment.

### Create
Creates a DigitalOcean environment based upon an existing Map.

### Destroy
Destroys a DigitalOcean environment based upon an existing Map.

### Fleet
Generate an Autoscaling Group for a Droplet and attach it to an existing Loadbalancer

## Configure
#### Flags
Configure allows the following Flags
| Flag | Description | Example                                             | Required |
|-----------|------------------------|-------------------------------------|:--------:|
| --profile | Create a named profile | sailboat configure --profile <name> |no        |

## Map

## Create

## Delete

## Fleet
## Contributing

1. Fork it ( https://github.com/[your-github-name]/sailboat/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [[abudhu]](https://github.com/abudhu]) Amit Budhu - creator, maintainer
