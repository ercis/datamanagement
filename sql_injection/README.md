# SQL Injection Example

This is a Node.js project. Node.js is an open-source, cross-platform, JavaScript runtime environment that executes JavaScript code outside a web browser.

## Prerequisites

Before you begin, ensure you have met the following requirements:

* You are running the project in a DevContainer. DevContainers provide a fully configured development environment, which can be shared across your team to ensure consistent development environments.

## Using DevContainer

To use the DevContainer, you need to have Docker installed and running on your machine. If you haven't installed Docker, you can download it from [here](https://www.docker.com/products/docker-desktop).

Once Docker is installed and running, follow these steps:

1. Open Visual Studio Code.
2. Install the `Remote - Containers` extension from the VS Code marketplace.
3. Open the command palette (F1 or Ctrl+Shift+P) and run the `Open Folder in Container...` command.
4. Select the project folder.

VS Code will start building the DevContainer. This might take a while the first time, as it needs to download the Docker image. Once the build is complete, VS Code will reload and you'll be inside the DevContainer.

## Starting the DevContainer

To start the DevContainer, follow these steps:

1. Open the command palette (F1 or Ctrl+Shift+P).
2. Run the `Remote-Containers: Reopen in Container` command.

VS Code will start the DevContainer and you'll be inside the DevContainer. You can now run any command in the terminal and it will be executed inside the DevContainer.

## Installing Packages

To install the necessary npm packages, follow these steps:

1. Open your terminal.
2. Navigate to the project directory.
3. Run the following command:

```bash
npm install
```

This command installs all the dependencies listed in the `package.json` file.

## Running the Server

To start the Node.js server, follow these steps:

1. In your terminal, navigate to the project directory.
2. Run the following command:

```bash
npm start
```

This command starts the server. By default, the server runs on `http://localhost:3000`.

## Forwarding a Port

If you're running the server inside a DevContainer, you might need to forward the server's port to your local machine to access it. Here's how you can do it:

1. Click on the `Remote Explorer` icon in the sidebar, or use the `View: Show Remote Explorer` command from the Command Palette.
2. In the `Remote Explorer` sidebar, switch to the `Forwarded Ports` view.
3. Click on the `+` button to forward a new port.
4. Enter the port number you want to forward (e.g., 3000).
5. The port is now forwarded and you can access the server on `http://localhost:3000` from your local machine.

Note: The port number might be different depending on your application's configuration.