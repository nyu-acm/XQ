xquery version "1.0";
declare namespace ead = "urn:isbn:1-931666-22-9";
declare copy-namespaces no-preserve, inherit;

import module namespace functx="http://www.functx.com" 
    at "http://www.xqueryfunctions.com/xq/functx-1.0-doc-2007-01.xq";
    
(: Reports on terms for born-digital carriers in the <dsc> within a directory of EAD files. Edit the file path to run. :)
(: Inspired by Jarrett Drake's 2016 talk "RadTech Meets RadArch: Towards A New Principle for Archives and Archival Description." :)
(: Code created by Kelly Bolding. We borrow it with much gratitude. :)

declare variable $ead as document-node()+ := collection("file:///Users/ras26/Desktop/findingaids_eads_v2/tamwag?recurse=yes;select=*.xml?recurse=yes;select=*.xml");
<results>
{
for $dsc in $ead//ead:ead/ead:archdesc/ead:dsc[ead:p[matches(string(.), (\s|^)(disk|disc|discs|diskette|diskettes|floppy)(\s|$)', 'i')]]

return 

        <collection>
                <collectioncode>{data($dsc/ancestor::ead:archdesc/ead:did/ead:unitid)}</collectioncode>
                <title>{data($dsc/ancestor::ead:archdesc/ead:did/ead:unittitle)}</title>
                <c>{data($c)}</c>
        </collection>
        }
       </results>
