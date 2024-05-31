# Datamanagement lecture

A comprehensive collection of examples for the data management lecture.


## Prerequisites

### Visual Studio Code

Visual Studio Code is a free source-code editor made by Microsoft. Follow these steps to install it:

1. Visit the [Visual Studio Code download page](https://code.visualstudio.com/download)
2. Choose the version that suits your operating system (Windows, Linux, macOS)
3. Download and run the installer
4. Follow the instructions provided by the installer

### Docker Desktop

Docker Desktop is an application for MacOS, Windows and Linux machines for the building and sharing of containerized applications. Follow these steps to install it:

1. Visit the [Docker Desktop download page](https://www.docker.com/products/docker-desktop)
2. Click on "Get Docker Desktop"
3. Download and run the installer
4. Follow the instructions provided by the installer. The Linux and macOS installation is documented and should be straight forward. The Windows installation might require some additional steps. 

#### Windows Subsystem for Linux (WSL)
If you are using Windows, it might be a bit tricky to use the correct Windows Subsystem for Linux (WSL), 
which is required for Docker.

You need WSL 2! Unfortunately, WSL 1 is installed by default, which often leads to errors.
A tutorial can be found here: [Upgrade Version from WSL 1 to WSL 2](https://learn.microsoft.com/de-de/windows/wsl/install#upgrade-version-from-wsl-1-to-wsl-2)

## Devcontainers

Devcontainers, or Development Containers, are a feature of VS Code that allow you to define your development environment as code. This means you can share, replicate, and version control your development environment just like you do with your source code.

In this project, a devcontainer has already been set up for you. To use it, you need to:

1. Install the [Dev Containers](https://marketplace.visualstudio.com/items?itemName=ms-vscode-remote.remote-containers) extension in VS Code.
2. Open this project in VS Code (you can do this by running `code .` in the project directory).
3. Press `F1` to open the command palette.
4. Type "Reopen in Container". This will build the devcontainer defined in this project and reopen your project inside it.

The devcontainer for this project includes all the necessary tools and dependencies you need to start coding right away. It ensures that everyone working on this project has the same consistent environment, which helps to reduce the "it works on my machine" problem.

## Using SQL Notebooks
In this project, you can use SQL Notebooks to run SQL queries directly in VS Code. SQL Notebooks are a great way to document your work, as you can include text, code, and visualizations all in one place.
First create a connection to the database. Open your sidebar and enter a new connection:
| Key       | Value    |
| :------------- | :----------: |
| Display Name | My Database |
| Database Driver | postgres |
| Database Host | localhost |
| Database Port | 5432 |
| Database User | postgres |
| Database Password | postgres |
| Database Name | postgres |


## Using pgAdmin

pgAdmin is a web-based interface for managing PostgreSQL databases. It's included in the Docker Compose file for this project, allowing you to manage your databases directly from your development environment.

To use pgAdmin:

1. Ensure your devcontainer is running. If not, follow the steps in the "Devcontainers" section to start it.
2. Open a web browser and navigate to `http://localhost:[PORT]`. At the bottom of Visual Studio Code you can see the port number. The default port is `9000`.
3. Log in using the credentials defined in the Docker Compose file.

| Key       | Value    |
| :------------- | :----------: |
| Email | postgres@postgres.local |
| Password | postgres |

4. Once logged in, you can add a new server connection to connect to your PostgreSQL database. Use the details from your Docker Compose file to fill in the connection information.

| Key       | Value    |
| :------------- | :----------: |
| Name | My Database |
| Connection-hostname | db |
| Connection-port | 5432 |
| Connection-username | postgres |
| Connection-password | postgres |

Remember, any changes you make in pgAdmin are made directly to the database. Be careful when modifying data or database structures.

## Contributing

Contributions are always welcome!
