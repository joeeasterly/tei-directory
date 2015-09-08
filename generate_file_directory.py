#!/usr/bin/env python

# This script updates generates an XML file , recursively listing the contents of a directory.
import os
import fnmatch
import lxml.etree as ET

dir_path = "/home/me/svn/my_project/"

root = ET.Element("list")


for dirname, dirnames, filenames in os.walk(dir_path):
    for file in filenames:
        if '.xml' in file:
            filePath =  os.path.abspath(os.path.join(dirname, file))
            filename = ET.SubElement(root, "file")
            filename.text = filePath
tree = ET.ElementTree(root)
tree.write("/home/me/svn/my_project/docs/dir/directory.xml", pretty_print=True, xml_declaration=True, encoding="utf-8")
