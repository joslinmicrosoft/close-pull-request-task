#!/bin/sh -l
echo "Auzure Pages Build Host: $INPUT_AZURE_PAGES_BUILDHOST"
UPLOAD_HOST="https://$INPUT_AZURE_PAGES_BUILDHOST/api/closepr?apiToken=$INPUT_AZURE_PAGES_API_TOKEN&apiVersion=$INPUT_AZURE_PAGES_API_VERSION"

curl -v -F "event=@$GITHUB_EVENT_PATH" $UPLOAD_HOST

if [ 0 -eq $? ]; then
        echo "\e[32mSuccessfully uploaded webhook information\e[0m"
else
        echo "\e[31mFailed to upload webhook information\e[0m"
    exit 1
fi;
