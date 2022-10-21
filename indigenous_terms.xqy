xquery version "1.0";
declare namespace ead = "urn:isbn:1-931666-22-9";
declare copy-namespaces no-preserve, inherit;

import module namespace functx="http://www.functx.com" 
    at "http://www.xqueryfunctions.com/xq/functx-1.0-doc-2007-01.xq";
    
(: Reports on "inappropriate terms for Indigenous peoples" in bioghist notes within a directory of EAD files. Edit the file path to run. :)
(: Inspired by Jarrett Drake's 2016 talk "RadTech Meets RadArch: Towards A New Principle for Archives and Archival Description." and the Proposed "Editorial Guide for Indigenous Entity Descriptions in SNAC" :)
(: Code created by Kelly Bolding. We borrow it with much gratitude. :)

declare variable $ead as document-node()+ := collection("file:///Users/ras26/Desktop/findingaids_eads/archives?recurse=yes;select=*.xml?recurse=yes;select=*.xml");
<results>
{
for $bioghist in $ead//ead:ead/ead:archdesc/ead:bioghist[ead:p[matches(string(.), '(\s|^)(s|[Ii]ndigenous|[Nn]ative\s[Aa]merican(s)|Lenape|squaw|buck|brave|papoose|peace\spipe|tomahawk|tom-tom|rain\sdance|war\sdance|ritual(istic)|heathen)(\s|$)', 'i')]]
return 

        <collection>
                <collectioncode>{data($bioghist/ancestor::ead:archdesc/ead:did/ead:unitid)}</collectioncode>
                <title>{data($bioghist/ancestor::ead:archdesc/ead:did/ead:unittitle)}</title>
                <origination>{data($bioghist/ancestor::ead:archdesc/ead:did/ead:origination/*)}</origination>
                <bioghist>{data($bioghist)}</bioghist>

        </collection>
        }
       </results>
