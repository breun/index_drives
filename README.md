# index_drives

A script to create an index of all files and directories on mounted drives, including metadata.

## Setup

1. Download the script:

```bash
curl https://github.com/breun/index_drives/raw/master/index_drives.sh
```

2. Make the script executable:

```bash
chmod +x index_drives.sh
```

3. Edit the configuration section of the script using a text editor.
- You can exclude any drives you don’t want indexed, like for instance your internal drives and backup drives, on the line starting with `EXCLUDED_DRIVES=`. By default drives named `Macintosh HD`, `Time Machine` and `com.apple.TimeMachine.localsnapshots` are excluded from indexing.
- You can specify where you want the index files to be stored on the line starting with `OUTPUT_DIR=`. By default these files are stored in a folder called `External Drive indices` in your home directory.

## Index

After setting up, you can execute the script:

```bash
./index_drives.sh
```

Any existing files for previously indexed drives will be overwritten with the current state of affairs. Any existing files for previously indexed, but currently not connected drives will remain untouched.
