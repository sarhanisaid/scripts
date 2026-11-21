# ------------------------------------------------------------------------------
# Stage 1: Clone the official tutorial repository
# ------------------------------------------------------------------------------
echo "⏳ Stage 1.1: Navigating to the user home directory (~)..."
cd ~ || exit 1

echo "⏳ Stage 1.2: Checking for git installation..."
if ! command -v git &> /dev/null; then
    echo "⚠️ git is not installed. Installing git now..."
    sudo apt install -y git
    check_status "Install git"
else
    echo "✅ git is already installed."
fi

echo "⏳ Stage 1.3: Cloning the repository (AB-Initio_In_Arabic_QE)..."
# Check if the repository directory already exists to avoid clone failure
if [ -d "AB-Initio_In_Arabic_QE" ]; then
    echo "ℹ️ Directory AB-Initio_In_Arabic_QE already exists. Pulling latest updates..."
    cd AB-Initio_In_Arabic_QE && git pull
    check_status "Update repository"
else
    git clone https://github.com/sarhanisaid/AB-Initio_In_Arabic_QE.git
    check_status "Clone repository"
fi

echo "⏳ Stage 1.4: Navigating to example-02 directory..."
if [ -d "$HOME/AB-Initio_In_Arabic_QE/example-02" ]; then
    cd "$HOME/AB-Initio_In_Arabic_QE/example-02" || exit 1
    echo "✅ Reached working directory successfully: $(pwd)"
else
    echo "❌ [ERROR]: Directory example-02 does not exist!"
    exit 1
fi
