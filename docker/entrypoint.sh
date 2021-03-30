# SET DEFAULT ENV IF NOT SET
export GATSBY_API_URL="${GATSBY_API_URL:=unknown}";

# CHECK IF FILES IS NOT CREATED, ELSE CREATE
cd /usr/share/nginx/html;

if [ ! -f .env ];
then
    echo "GATSBY_API_URL=$GATSBY_API_URL" > .env
fi;

# BUILD PROJECT
yarn build;

# KEEP NGINX DAEMON RUNNING
nginx -g 'daemon off;'; nginx -s reload;