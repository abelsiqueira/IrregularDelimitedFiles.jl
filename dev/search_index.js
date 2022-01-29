var documenterSearchIndex = {"docs":
[{"location":"","page":"Home","title":"Home","text":"CurrentModule = IrregularDelimitedFiles","category":"page"},{"location":"#IrregularDelimitedFiles","page":"Home","title":"IrregularDelimitedFiles","text":"","category":"section"},{"location":"","page":"Home","title":"Home","text":"Documentation for IrregularDelimitedFiles.","category":"page"},{"location":"","page":"Home","title":"Home","text":"","category":"page"},{"location":"","page":"Home","title":"Home","text":"Modules = [IrregularDelimitedFiles]","category":"page"},{"location":"#IrregularDelimitedFiles.read_irregular-Tuple{Any}","page":"Home","title":"IrregularDelimitedFiles.read_irregular","text":"keys, arrays, values = read_irregular(filename; options...)\n\nRead an irregular file like the one below:\n\n1#1024\n271#31,32,33,301\n403#99,105\n\nand returns three equal-sized arrays with this information such that they can be used to create a table. For instance, for the file above, it would return:\n\nkeys    = [   1, 271, 271, 271, 271, 403, 403]\nindexes = [   0,   0,   1,   2,   3,   0,   1]\nvalues  = [1024,  31,  32,  33, 301,  99, 105]\n\nInput\n\nfilename: File name.\nkey_sep::Char = '#': Character separating the key from the values.\narray_sep::Char = ',': Character separating values.\n\nOutput\n\nVectors keys::Vector{Int}, indexes::Vector{Int} and values::Vector{Int} such that a table provides the same information. See the example above.\n\n\n\n\n\n","category":"method"}]
}