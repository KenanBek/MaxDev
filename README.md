# maxDEV: Maximize Developer Productivity

**maxDEV** is a cross-platform and extensible desktop application for developers. It offers a set of ready-to-use tools in categories such as security, server management, encoders/decoders, and more.

Visit the [**maxDEV website**](https://maxdevapp.com/) for more information.

## ⬇️ Download

**Get maxDEV** for Windows, macOS, or Linux:

- [**Download from Website**](https://maxdevapp.com/download/) - With automatic platform detection
- [**Download Tool**](https://kenanbek.github.io/maxDEV/download.html) - Static HTML page with download links for all platforms
- [**Download from Releases**](https://github.com/KenanBek/maxDEV/releases) - All platform versions

<img width="1136" alt="maxDEV 1.0.3" src="https://github.com/user-attachments/assets/06c746d9-66f7-4fd4-9267-8cfc2b1bc629" />

## Supported Tools

**maxDEV** includes various productivity tools across different categories:

| Category              | Tool                   | Description                                  | Phase | Learn More                                 |
| --------------------- | ---------------------- | -------------------------------------------- | ----- | ------------------------------------------ |
| **Server Management** | **Mock Server**        | Create and manage mock servers               | Alpha |                                            |
| **Server Management** | **HTTP Tester**        | Test HTTP requests and analyze responses     | Alpha |                                            |
| **Databases**         | **Redis Client**       | Connect to and manage Redis databases        | Alpha | [Doc](https://maxdevapp.com/redis-client/) |
| **Encode / Decode**   | **JWT Token**          | Create and decode JWT tokens                 | Beta  |                                            |
| **Encode / Decode**   | **Base64**             | Encode and decode Base64 data                | Beta  |                                            |
| **Formatting**        | **JSON Formatter**     | Format and beautify JSON data                | Beta  |                                            |
| **Security**          | **Password Generator** | Generate secure passwords                    | Beta  |                                            |
| **Security**          | **Hash Generator**     | Generate MD5, SHA-1, SHA-256, SHA-512 hashes | Beta  |                                            |

> Development phases: **Proof of Concept** → **Alpha** → **Beta** → Stable. Learn more about the phases in the [**Documentation**](https://maxdevapp.com/devtools-lifecycle/).

## Get Started

**maxDEV** is available for Windows, macOS (Apple Silicon, Intel), and Linux.

### Good to Know

#### Privacy First: Local and Offline Operation

All tools run locally on your machine. No tool-related data is transmitted to the internet. The only exception is **Sentry** integration for error tracking and reporting, which sends anonymized data without any personally identifiable information.

#### Update Policy

**Current approach**: maxDEV uses an **aggressive** update strategy - the application checks for updates at every launch and automatically downloads and installs them when available.

**Future approach**: Once the application becomes more stable, we'll switch to a **background** update strategy - the application will check for updates in the background and notify you when an update is available. You'll then have the choice to install or postpone the update.

#### Pricing Model

During the early access program, **maxDEV** is completely free. For the future, I'm considering a freemium model where core tools will be free, while premium features will require a payment.

> [!WARNING]
> EARLY ACCESS: **maxDEV** is currently in the early access phase. Features may be incomplete, contain bugs, or change significantly between releases.

> [!NOTE]
> This repository contains only release distributions of maxDEV, which is closed-source software. No source code is provided here, only installable packages for supported platforms.

## Release Notes

Check the [Release Notes](https://maxdevapp.com/release-notes/) page for the complete list of changes and compatibility notes.

### v1.0.4

- Manage multiple Redis connections easily
- Navigate with the new tab-based interface (Explorer, Commands, Info)
- View and edit Redis values directly in the interface
- Execute Redis commands with a simple command line
- Browse detailed server information

[Learn more, check the demo video and downloadable assets for v1.0.4](https://maxdevapp.com/blog/maxdev-v1-0-4-beta-release/)

### v1.0.3

- Introduce a PoC version of the Redis Client
- Improvements to the Mock Server
- Improvements to the HTTP Tester
- Update app icons

[Learn more, check the demo video and downloadable assets for v1.0.3](https://maxdevapp.com/blog/maxdev-v1-0-3-beta-release/)

## Related Sub-projects

- [Redis Client tester](./redisclient/README.md) - A simple environment for manually testing the Redis client tool in maxDEV.
