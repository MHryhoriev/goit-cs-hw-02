
URLs=("https://google.com" "https://facebook.com" "https://twitter.com")

LOG_FILE="website_status.log"

GREEN='\033[0;32m'
NC='\033[0m'

for URL in "${URLs[@]}"; do
    HTTP_STATUS=$(curl -o /dev/null -s -w "%{http_code}" -L "$URL")

    if [ "$HTTP_STATUS" -eq 200 ]; then
        LOG_MESSAGE="<$URL> is UP"
    else
        LOG_MESSAGE="<$URL> is DOWN"
    fi

    echo "$LOG_MESSAGE" >> "$LOG_FILE"
done

echo -e "${GREEN}Logs were successfully written to the file '$LOG_FILE'${NC}"