#!/usr/bin/env zsh

nueip() {
  [[ -z "$1" ]] && echo "Try input in/1/out/2" && return 1
  env_ok=0
  [[ -n "${NUEIP_COMPANY}" ]] && [[ -n "${NUEIP_ID}" ]] && [[ -n "${NUEIP_PASS}" ]] && [[ -n "${NUEIP_LAT}" ]] && [[ -n "${NUEIP_LNG}" ]] && env_ok=1
  [[ "${env_ok}" == "0" ]] && echo "required env var not met" && return 127

  UA="Mozilla/5.0 (Macintosh; Intel Mac OS X 10_15_7) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/117.0.0.0 Safari/537.36"

  cookies=$(curl -sv 'https://cloud.nueip.com/login/index/param' \
    -H "user-agent: ${UA}" \
    -H 'accept: application/json, text/plain, */*' \
    -H 'content-type: application/x-www-form-urlencoded' \
    --data-raw "inputCompany=${NUEIP_COMPANY}&inputID=${NUEIP_ID}&inputPassword=${NUEIP_PASS}" \
    --compressed 2>&1 | grep set-cookie | grep -v deleted)

  # echo "$cookies"

  findLastCookie() {
    name=$1
    [[ -z "$name" ]] && echo "" && return
    echo "$cookies" | grep "$name=" | tail -n1 | awk -F': ' '{print $NF}' | awk '{print $1}'
  }

  api_cookies=$(
    (
    findLastCookie dtag
    findLastCookie lang
    findLastCookie PHPSESSID
    findLastCookie language
    findLastCookie zone
    findLastCookie login
    findLastCookie idle
    findLastCookie country
    findLastCookie countryByIP
    findLastCookie locate
    findLastCookie loginTime
    findLastCookie cuid
    findLastCookie activity
    findLastCookie tkchecksum
    findLastCookie signature
    findLastCookie checksum
    ) | xargs echo
  )

  tokens=$(curl -s 'https://cloud.nueip.com/oauth2/token/api' \
    -H "user-agent: ${UA}" \
    -H 'accept: application/json, text/plain, */*' \
    -H "cookie: ${api_cookies}" \
    --compressed)

  access_token=$(echo "$tokens" | jq -r '.token_access_token')

  # echo $access_token

  #punch_data=$(curl -s 'https://cloud.nueip.com/portal/Portal_punch_clock/ajax?type=view' \
  #  -H "user-agent: ${UA}" \
  #  -H 'accept: application/json, text/plain, */*' \
  #  -H "authorization: Bearer ${access_token}" \
  #  -H "cookie: ${api_cookies}" \
  #  --compressed
  #)

  punch_token=$(curl -s 'https://cloud.nueip.com/home' \
    -H "user-agent: ${UA}" \
    -H "cookie: ${api_cookies}" \
    --compressed | grep 'name="token"' | uniq | sed -E 's/(<|>)//g' | awk '{print $NF}' | awk -F= '{print $NF}' | jq -r '.'
  )

  clockIn() {
    curl -s 'https://cloud.nueip.com/portal/Portal_punch_clock/ajax' \
    -H "user-agent: ${UA}" \
    -H 'accept: application/json, text/plain, */*' \
    -H "authorization: Bearer ${access_token}" \
    -H 'content-type: multipart/form-data' \
    -H "cookie: ${api_cookies}" \
    --data-raw "check_type=1&id=1&token=${punch_token}&attendance_time=$(date +"%Y-%m-%d%%20%H%%3A%M%%3A%S")&lat=${NUEIP_LAT}&lng=${NUEIP_LNG}" \
    --compressed
  }

  clockOut() {
    curl -s 'https://cloud.nueip.com/portal/Portal_punch_clock/ajax' \
    -H "user-agent: ${UA}" \
    -H 'accept: application/json, text/plain, */*' \
    -H "authorization: Bearer ${access_token}" \
    -H 'content-type: multipart/form-data' \
    -H "cookie: ${api_cookies}" \
    --data-raw "check_type=1&id=2&token=${punch_token}&attendance_time=$(date +"%Y-%m-%d%%20%H%%3A%M%%3A%S")&lat=${NUEIP_LAT}&lng=${NUEIP_LNG}" \
    --compressed
  }

  case "$1" in
    in|1)
      clockIn | jq '.'
    ;;
    out|2)
      clockOut | jq '.'
    ;;
    *)
      echo "Try only input in/1/out/2"
      return 2
    ;;
  esac
}
