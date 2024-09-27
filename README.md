# Dotfiles Backup Script

This repository contains a script (`add_dotfiles.sh`) that helps you backup
important configuration folders from your home directory.

## What It Does

The `add_dotfiles.sh` script copies the following folders from your home
directory to a `dotfiles` folder:

-   `.config`
-   `.themes`
-   `.icons`

## Prerequisites

-   Bash shell (standard on most Linux distributions)
-   Write permissions in your home directory

## Installation

1. Clone this repository or download the `add_dotfiles.sh` script.
2. Place the script in your desired location (e.g.,
   `~/dotfiles/add_dotfiles.sh`).
3. Make the script executable:
    ```
    chmod +x ~/dotfiles/add_dotfiles.sh
    ```

## Usage

1. Open a terminal.
2. Navigate to the directory containing the script:
    ```
    cd ~/dotfiles
    ```
3. Run the script:
    ```
    ./add_dotfiles.sh
    ```

Alternatively, you can run the script from any location using the full path:

```
~/dotfiles/add_dotfiles.sh
```

## What to Expect

-   The script will create a `dotfiles` folder in your home directory if it
    doesn't already exist.
-   It will then copy the `.config`, `.themes`, and `.icons` folders from your
    home directory to the `dotfiles` folder.
-   The script will provide feedback on which folders were successfully copied
    or if they were not found.

## Restoring Your Dotfiles

To restore these configurations on a new system:

1. Copy the `dotfiles` folder to your new home directory.
2. Move or copy the contents of each folder (`.config`, `.themes`, `.icons`) to
   their respective locations in your new home directory.

## Note

This script overwrites existing files in the `dotfiles` folder. If you want to
keep multiple versions or backups, consider modifying the script to include
timestamps in the folder names.

## Contributing

Feel free to fork this repository and submit pull requests for any improvements
or additional features you think would be useful.
