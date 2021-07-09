# SET DEFAULT ENV IF NOT SET
export GATSBY_API_URL="${GATSBY_API_URL:=unknown}";

# CHECK IF FILES IS NOT CREATED, ELSE CREATE
cd /usr/share/nginx/html;

if [ ! -f env.js ];
then
    echo "window.GATSBY_API_URL='$GATSBY_API_URL';" > env.js
fi;

# KEEP NGINX DAEMON RUNNING
nginx -g 'daemon off;'; nginx -s reload;