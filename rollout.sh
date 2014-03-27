#!/bin/bash
serve export . output
rsync -rv --delete output/ dstutzman_danstutzman@ssh.phx.nearlyfreespeech.net:/home/public
