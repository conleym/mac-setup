#!/usr/bin/env zsh

# Reinstall the Xcode command-line tools. See:
# https://trac.macports.org/wiki/ProblemHotlist#reinstall-clt

VERSION=$(pkgutil --pkg-info=com.apple.pkg.CLTools_Executables 2>/dev/null | sed -n 's/^version: //p')

IN_PROGRESS_FILE="/tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress"

if [ -z "${VERSION}" ]; then
    echo "Command line tools package receipt is missing."

    touch ${IN_PROGRESS_FILE}
    softwareupdate -l

    echo "You now need to run software update to reinstall the Xcode command line tools. Then run this script again."
    exit 0
fi


if [ -e "${IN_PROGRESS_FILE}" ]; then
    echo "Removing in-progress file."

    rm "${IN_PROGRESS_FILE}"
    softwareupdate -l

    exit 0
fi

echo "Everything looks OK. Nothing to do."


# Local Variables:
# mode: sh
# sh-shell: zsh
# End:
