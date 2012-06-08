## XBD

The XBD gem allows you to create, load and save XBD files. XBD files are arbitrary, self-describing, hierarchical,
binary data structures consisting of "tags", "attributes", and "sub-tags".

## XBD vs XML

Feature differences:

* Any XML file can be converted to XBD, but the referse is not true.
* XBD allows you to store aribrary binary strings in attributes.
* XBD does not allow any data between sub-tags
* XBD Tag and Attribute names can be arbitrary binary string.

Additional benefits of XBD:

* XBD uses dictionaries (hashes) to store all Tag-Name, Attribute-Name and Attribute-Values. Consequently: XBD files can be as small as 1/10th the size an equivelent XML file
* XBD files are simple and streamlined for encoding/decoding. Consequently they can be as much as 10x faster to read and write.

(NOTE: The 10x performance improvement was tested on the original pure-C++ implementation vs a fast, pure-C++ XML parser. Tests have not been made in this Ruby version.)
