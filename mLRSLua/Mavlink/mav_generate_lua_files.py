#!/usr/bin/env python
'''
mav_generate_lua_files.py
Copyright (c) OlliW, OlliW42, www.olliw.eu
'''
import os
import shutil
import re
import sys


#options to set

mavlinkpathtorepository = os.path.join('..','..','mLRS','modules','mavlink')

mavlinkdialect = os.path.join(mavlinkpathtorepository,'message_definitions','v1.0','all.xml')

mavlinkoutputdirectory = os.path.dirname(__file__)


'''
Imports
'''
sys.path.insert(0,mavlinkpathtorepository)

from pymavlink.generator import mavgen
from pymavlink.generator.mavgen import Opts
from pymavlink.generator import mavparse


'''
Generates the header files and place them in the output directory.
'''

outdir = os.path.join(mavlinkoutputdirectory, "modules")
xmlfile = mavlinkdialect


#delete modules subfolder and all .lua files
if os.path.isdir(outdir):
    shutil.rmtree(outdir)
for filename in os.listdir(mavlinkoutputdirectory):
    if filename.lower().endswith(".lua"):
        os.remove(os.path.join(mavlinkoutputdirectory, filename))


opts = Opts(
    output = outdir,
    wire_protocol = mavparse.PROTOCOL_2_0,
    language = "Lua",
    validate = True,
)
args = [xmlfile]

#opts = mavgen.Opts(outdir, parse_flags=mavflags.PARSE_FLAGS_WARNING_ENUM_VALUE_MISSING)
try:
    mavgen.mavgen(opts,args)
    print('Successfully Generated Headers', 'Headers generated successfully.')

except Exception as ex:
    exStr = str(ex)
    print('Error Generating Headers','{0!s}'.format(exStr))
    exit()

# the lua scripts are now in the subfolder modules, move them and delete the folder
for filename in os.listdir(outdir):
    src = os.path.join(outdir, filename)
    dst = os.path.join(mavlinkoutputdirectory, filename)
    shutil.move(src, dst)
os.rmdir(outdir)        



