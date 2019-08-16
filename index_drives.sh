#!/usr/bin/env bash

##########
# Config #
##########

# Root path for drives to index
INDEX_ROOT="/Volumes"

# Excluded from indexing
EXCLUDED_DRIVES=("Macintosh HD" "Time Machine" "com.apple.TimeMachine.localsnapshots")

# Directory for storing index files 
OUTPUT_DIR="$HOME/External Drive indices"

##########
# Action #
##########

write_indices() {
  local drive_root

  for drive_root in "${INDEX_ROOT}"/*; do
    if is_excluded "${drive_root}"; then
      echo "Skipping '${drive_root}', because it is explicitly excluded in the configuration."
      continue
    else
      write_index "$drive_root"
    fi
  done
}

is_excluded() {
  local path_to_check excluded_drive
  path_to_check=$1

  for excluded_drive in "${EXCLUDED_DRIVES[@]}"; do
    if [ "${INDEX_ROOT}/${excluded_drive}" == "${path_to_check}" ]; then
      # path_to_check is excluded
      return 0
    fi
  done

  # path_to_check is not excluded
  return 1
}

write_index() {
  local directory index_file
  directory=$1

  create_output_directory_if_needed

  index_file="${OUTPUT_DIR}/$(basename "${directory}") index.txt"

  echo "Writing index for '${directory}' to '${index_file}'..."
  find -x "${drive_root}" -ls > "${index_file}"
}

create_output_directory_if_needed() {
  if [ ! -d "${OUTPUT_DIR}" ]; then
    echo "Creating output directory '${OUTPUT_DIR}'"
    mkdir -p "${OUTPUT_DIR}"
  fi
}

write_indices
echo "All done."
