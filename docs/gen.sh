#!/bin/bash

set -e

export OPTION="gen"

if ! command -v "md2man-roff"
then
	echo "${0##*/}: \"md2man-roff\" is required for this operation."
	exit 1
fi

if ! command -v "md2man-html"
then
	echo "${0##*/}: \"md2man-html\" is required for this operation."
	exit 1
fi

while (( "${#}" > 0 ))
do
	case "${1,,}" in
		("--man")
			shift
			if [[ -n "${1}" ]] && [[ "${1}" != -* ]]
			then
				export MAN="${1}"
				shift
			else
				export MAN="man"
			fi
		;;
		("--html")
			shift
			if [[ -n "${1}" ]] && [[ "${1}" != -* ]]
			then
				export HTML="${1}"
				shift
			else
				export HTML="html"
			fi
		;;
		("--document")
			shift
			if [[ -n "${1}" ]] && [[ "${1}" != -* ]]
			then
				export DOCUMENT="${1}"
				shift
			else
				export DOCUMENT="markdown"
			fi
		;;
		(*)
			shift
		;;
	esac
done

case "${OPTION,,}" in
	("gen")
		for f in "${DOCUMENT}/"*".md"
		do
			unset format
			if [[ -f "${f}" ]]
			then
				if [[ -d "${MAN}" ]]
				then
					export format="${f##*/}"
					export format="${format%.*}"
					export format="${format}.1"
					md2man-roff "${f}" > "${MAN}/${format}"
				fi
				if [[ -d "${HTML}" ]]
				then
					export format="${f##*/}"
					export format="${format%.*}"
					export format="${format}.html"
					md2man-html "${f}" > "${HTML}/${format}"
				fi
			fi
		done
	;;
esac
