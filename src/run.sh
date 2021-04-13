#! /usr/bin/env sh
DEST=${WEBDRIVE_MOUNT:-/mnt/webdrive}

# Check variables and defaults
if [ -z "${WEBDRIVE_URL}" ]; then
    echo "No URL specified!"
    exit
fi
if [ -z "${WEBDRIVE_USERNAME}" ]; then
    echo "No username specified, is this on purpose?"
fi

if [ -z "${WEBDRIVE_PASSWORD}" ]; then
    echo "No password specified, is this on purpose?"
fi

mkdir -p ${DEST}

echo "$WEBDRIVE_URL $WEBDRIVE_USERNAME $WEBDRIVE_PASSWORD" >> /etc/davfs2/secrets
unset WEBDRIVE_PASSWORD

mount -t davfs $WEBDRIVE_URL $DEST
if [ -n "$(ls -1A $DEST)" ]; then
    echo "Mounted $WEBDRIVE_URL onto $DEST"
    echo "Start processing"
    mkdir -p ${DEST}/${OUTPUT_PATH}
    python /dataset_analysis.py $DEST/$INPUT_FILENAME $DEST/${OUTPUT_PATH}
    umount $DEST
else
    echo "Nothing found in $DEST, giving up!"
    exit 1
fi
