#!/bin/bash

exec /sbin/setuser nzbdrone mono /opt/NzbDrone/NzbDrone.exe -nobrowswer -data=/config
