#!/usr/bin/env zsh

GCLOUD_SDK_FOLDER=$(brew --prefix)/share/google-cloud-sdk

if [ -d "${GCLOUD_SDK_FOLDER}" ]; then
  case "$(basename "${SHELL}")" in
    zsh)
      source "${GCLOUD_SDK_FOLDER}/path.zsh.inc"
      source "${GCLOUD_SDK_FOLDER}/completion.zsh.inc"
      ;;
    bash)
      source "${GCLOUD_SDK_FOLDER}/path.bash.inc"
      ;;
  esac
fi
