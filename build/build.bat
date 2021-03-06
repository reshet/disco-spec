@echo off
SET SAXON=C:\Users\olof\Dropbox\utils\saxon-he\saxon9he.jar

echo -----convert turtle to other formats-----
echo RDF/XML-ABBREV
call rdfcopy ../discovery.ttl TURTLE RDF/XML-ABBREV > ../discovery-abbrev.xml
echo RDF/XML
call rdfcopy ../discovery.ttl TURTLE RDF/XML > ../discovery.rdf
echo N3
call rdfcopy ../discovery.ttl TURTLE N3 > ../discovery.n3

echo -----create html documentation from rdf/xml-----
call java -cp %SAXON% net.sf.saxon.Transform -t -s:../discovery-abbrev.xml -xsl:rdf2htmlclasses.xsl -o:../documentation/classes.html
echo removing rdf/xml abbrev (used for generation the documentation)
del ../discovery-abbrev.xml
echo -----done-----
