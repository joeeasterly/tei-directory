#! /bin/bash

# This bash script generates a TEI-formatted file directory and a corpus for the project.
# Update the paths for everything accordingly.

python /home/me/svn/my_project/scripts/python/generate_file_directory.py
java -jar /usr/local/bin/saxon9he.jar -xsl:/home/me/svn/my_project/scripts/xslt/dir_01_generateTEI.xsl -s:/home/me/svn/my_project/docs/dir/directory.xml -o:/home/me/svn/my_project/docs/dir/tei_directory.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:/home/me/svn/my_project/scripts/xslt/dir_02_formatTEI.xsl -s:/home/me/svn/my_project/docs/dir/tei_directory.xml -o:/home/me/svn/my_project/docs/dir/tei_table.xml
java -jar /usr/local/bin/saxon9he.jar -xsl:/home/me/svn/my_project/scripts/xslt/dir_03_generateDelimited.xsl -s:/home/me/svn/my_project/docs/dir/tei_table.xml -o:/home/me/svn/my_project/docs/dir/my_project_tei_table.txt
java -jar /usr/local/bin/saxon9he.jar -xsl:/home/me/svn/my_project/scripts/xslt/generate_corpus.xsl -s:/home/me/svn/my_project/docs/dir/tei_table.xml -o:/home/me/svn/my_project/docs/dir/my_project_corpus.xml