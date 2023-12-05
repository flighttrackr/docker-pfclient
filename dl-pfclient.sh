#!/usr/bin/env sh

case `uname -m` in
    x86_64)
        archive_url="http://client.planefinder.net/pfclient_5.0.162_amd64.tar.gz"
        archive_md5="3bb9734b43e665b16a5a9ef4c43bfed3"
        ;;

    i386|i686)
        archive_url="http://client.planefinder.net/pfclient_5.0.161_i386.tar.gz"
        archive_md5="58d54a47520585a7a4eb1983f31cab7f"
        ;;

    armv6l|armv7l|aarch64)
        archive_url="http://client.planefinder.net/pfclient_5.0.161_armhf.tar.gz"
        archive_md5="0f1e6b90f292833060020d039b8d2fb1"
        ;;

    *)
        echo "Unsupported architecture"
        exit 1
esac

# Download file
wget -T 120 -t 10 -O /tmp/pfclient.tar.gz "$archive_url"
if [ $? -ne 0 ]
then
    >&2 echo "Download failed"
    exit 1
fi

# Check md5
calculated_md5=$(md5sum /tmp/pfclient.tar.gz | cut -d " " -f1)
if [ "$archive_md5" != "$calculated_md5" ]
then
    >&2 echo "Verification failed ($archive_md5 != $calculated_md5)"
    exit 1
fi

echo "Verification successful ($archive_md5 == $calculated_md5)"

# Extract
tar -xvzf /tmp/pfclient.tar.gz -C /app
exit $?
