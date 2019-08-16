# index_drives

A script to create an index of all files and directories on mounted drives, including metadata.

## Setup

1. Download the script:

	curl -o index_external_drives.sh https://gist.githubusercontent.com/breun/2c275df3c948bf1cefcd19867fccab74/raw

2. Make the script executable:

	chmod +x index_external_drives.sh

3. Edit the configuration section of the script using a text editor.
	a. You can exclude any drives you don’t want indexed, like for instance your internal drives and backup drives, on the line starting with “EXCLUDED_DRIVES=“. By default drives named “Macintosh HD”, “Time Machine” and “com.apple.TimeMachine.localsnapshots” are excluded from indexing.
	b. You can specify where you want the index files to be stored on the line starting with “OUTPUT_DIR=“. By default these files are stored in a folder called "External Drive indices” in your home directory.

After setting up, you can execute the script:

	./index_external_drives.sh

Any existing files for previously indexed drives will be overwritten with the current state of affairs. Any existing files for previously indexed, but currently not connected drives will remain untouched.
