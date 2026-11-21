# ------------------------------------------------------------------------------
# Stage 0: Download, extract, and install PWTK
# ------------------------------------------------------------------------------
echo "⏳ Stage 0.1: Downloading pwtk-3.2 package..."
wget -O pwtk-3.2-auto.tar.gz "https://github.com/sarhanisaid/scripts/raw/main/packages/pwtk-3.2-auto.tar.gz"
check_status "Download PWTK package"

echo "⏳ Stage 0.2: Extracting the archive..."
tar -xzvf pwtk-3.2-auto.tar.gz
check_status "Extract archive"

echo "⏳ Stage 0.3: Navigating into the pwtk-3.2 directory..."
if [ -d "pwtk-3.2" ]; then
    cd pwtk-3.2 || exit 1
    echo "✅ Entered directory successfully."
else
    echo "❌ [ERROR]: Directory pwtk-3.2 does not exist!"
    exit 1
fi

echo "⏳ Stage 0.4: Installing required Tcl dependencies (sudo password may be required)..."
sudo apt update && sudo apt install -y tcl tcllib tcl-tclreadline tcl-thread
check_status "Install Tcl dependencies via apt"

echo "⏳ Stage 0.5: Configuring PWTK system PATH..."
if [ -f "setup_pwtk_path.sh" ]; then
    bash setup_pwtk_path.sh
    check_status "Configure PWTK PATH"
else
    echo "❌ [ERROR]: setup_pwtk_path.sh not found inside the directory!"
    exit 1
fi