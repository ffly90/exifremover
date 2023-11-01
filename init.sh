# Create subdirectories
mkdir cmd
mkdir internal
mkdir pkg

# Initialize a Go module
go mod init webexif

# Create the main application file
touch cmd/webexif/main.go

# Create a router for the web application
touch web/router.go

# Create a simple server configuration file
touch web/config.go

# Create a directory for HTML templates
mkdir web/templates

# Create a directory for static assets (CSS, JavaScript, images, etc.)
mkdir web/static

# Create a .gitignore file to specify what should be ignored by Git
echo ".DS_Store" > .gitignore
echo ".vscode" >> .gitignore
echo "web/static" >> .gitignore

# Create a README.md file
echo "# My Go Web App" > README.md

# Create a Go source file for your main application (cmd/webexif/main.go) and add the code.
# You can use your preferred code editor to open and edit these files.

# Initialize a Git repository (if not already initialized)
git init
git add .
git commit -m "Initial commit"

# Optionally, add a remote repository and push the code
# git remote add origin your_remote_repository_url
# git push -u origin master

